/*
 * Copyright (c) 2026 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

import { describe, it, expect, TestType, Size, Level } from '@ohos/hypium';
import { hilog } from '@kit.PerformanceAnalysisKit';
import { BusinessError } from '@kit.BasicServicesKit';
import {
  IrCapabilityProbe, IrCodeCompiler, IrSendQueue, IrTransmitter, KeyTester, TransmitErrorMapper,
  IrCapability, IrCode, IrCompileError, IrCompileResult, IrFrame, IrProtocol,
  SendFrame, SendJob, SendProgress, SendSource, SendState, SendStep, SendTicket,
  TransmitResult, TransmitResultCode
} from 'ircore';

/**
 * ircore 红外模块逻辑套件：覆盖类型默认值、波形编译、错误映射、串行发送队列
 * 状态机、发射守卫分支、能力缓存与单键测试的编译失败路径。
 * 范围：IrTypes / IrCodeCompiler / TransmitErrorMapper.fromError / IrSendQueue /
 *       IrTransmitter 守卫分支 / IrCapabilityProbe 缓存读写 / KeyTester 编译失败。
 * 明确不覆盖：
 * - IrCodeCompiler TOO_LONG 分支：RAW 分块上限等于单帧上限 1024，NEC/SONY/RC5 帧
 *   远小于上限，该分支在现有分块策略下不可达。
 * - IrTransmitter 合法波形的真实发送与 transmitFrame 正常路径：依赖红外硬件。
 * - IrCapabilityProbe.probe()：依赖 infraredEmitter 系统 API。
 * - KeyTester NO_EMITTER/BUSY/成功路径：能力缓存受 UI 套件拉起 EntryAbility 影响。
 * - TransmitErrorMapper.toUserText：依赖应用资源加载。
 * - IrLibraryRepository：依赖注入 context 与全局静态缓存，与套件执行顺序耦合。
 * 安全说明：IrSendQueue 全部用例使用空 frames 步骤（内层循环零次，永不调用
 * transmitInfrared）；IrTransmitter/IrKeyTester 用例均在系统 API 调用之前返回。
 */

/** Hilog domain reserved for the ircore logic tests. */
const DOMAIN: number = 0xF813;
/** Prefix added to every case log so the logs can be filtered by suite. */
const SUITE_PREFIX: string = 'MeetingScene_IrCore_';
/** System limit of one waveform frame, mirrors AppConstants.MAX_PATTERN_LENGTH. */
const MAX_PATTERN_LENGTH: number = 1024;
/** Default carrier frequency in hertz, mirrors AppConstants.DEFAULT_FREQUENCY_HZ. */
const DEFAULT_FREQUENCY_HZ: number = 38000;
/** NEC frame layout: header pair + four bytes of mark/space pairs + stop mark. */
const NEC_FRAME_LENGTH: number = 67;
/** Sony SIRC 15-bit layout: header pair + fifteen mark/space pairs. */
const SONY_15_FRAME_LENGTH: number = 32;
/** Sony SIRC 12-bit layout: header pair + twelve mark/space pairs. */
const SONY_12_FRAME_LENGTH: number = 26;
/** RC5 total duration: fourteen bits times two half-bits of 889 microseconds. */
const RC5_DURATION_US: number = 24892;

/** Builds a code with the given protocol, payload and repeat count. */
function buildCode(protocol: IrProtocol, payload: string, repeatCount: number): IrCode {
  const code: IrCode = new IrCode();
  code.protocol = protocol;
  code.payload = payload;
  code.repeatCount = repeatCount;
  return code;
}

/** Builds a RAW code with the given payload. */
function buildRawCode(payload: string): IrCode {
  return buildCode(IrProtocol.RAW, payload, 1);
}

/** Builds a RAW payload of deterministic positive values separated by spaces. */
function buildLongRawPayload(valueCount: number): string {
  const values: number[] = [];
  for (let i: number = 0; i < valueCount; i++) {
    values.push(100 + (i % 3));
  }
  return values.join(' ');
}

/** Builds one send step with empty frames so the inner loop never transmits. */
function buildEmptyStep(index: number, delayMs: number): SendStep {
  const step: SendStep = new SendStep();
  step.index = index;
  step.deviceId = 'test-device';
  step.keyId = 'test-key';
  step.frames = [];
  step.delayMs = delayMs;
  return step;
}

/** Builds a send job whose every step carries empty frames. */
function buildEmptyJob(source: SendSource, stepCount: number, delayMs: number): SendJob {
  const job: SendJob = new SendJob();
  job.source = source;
  for (let i: number = 0; i < stepCount; i++) {
    job.steps.push(buildEmptyStep(i, delayMs));
  }
  return job;
}

/** Builds a BusinessError shaped literal for the error mapper inputs. */
function buildBizError(code: number): BusinessError {
  const error: BusinessError = {
    name: 'IrCoreTestError',
    message: 'synthetic business error ' + code.toString(),
    code: code
  };
  return error;
}

export default function irCoreLogicTest() {
  describe('IrCoreLogicTest', () => {

    /**
     * @tc.number    SUB_MEETINGSCENE_LOGIC_IRCORE_0100
     * @tc.name      testIrCore0001
     * @tc.desc      新建 IrCode 未赋值时协议为 RAW、载频为 38kHz、重复次数为 1、
     *               载荷与标识等文本字段均为空串。
     * @tc.require   NA
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testIrCore0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const TAG: string = 'testIrCore0001';
      hilog.info(DOMAIN, TAG, '%{public}s', SUITE_PREFIX + TAG + ' start');
      const code: IrCode = new IrCode();
      expect(code.protocol).assertEqual(IrProtocol.RAW);
      expect(code.frequencyHz).assertEqual(DEFAULT_FREQUENCY_HZ);
      expect(code.repeatCount).assertEqual(1);
      expect(code.payload).assertEqual('');
      expect(code.id).assertEqual('');
      expect(code.source).assertEqual('');
      expect(code.license).assertEqual('');
      hilog.info(DOMAIN, TAG, '%{public}s', SUITE_PREFIX + TAG + ' end');
    });

    /**
     * @tc.number    SUB_MEETINGSCENE_LOGIC_IRCORE_0101
     * @tc.name      testIrCore0002
     * @tc.desc      新建 IrCompileResult 为失败空帧状态（ok 假、错误码 NONE、无帧），
     *               新建 IrFrame 的序号、波形与总时长均为零值。
     * @tc.require   NA
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testIrCore0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const TAG: string = 'testIrCore0002';
      hilog.info(DOMAIN, TAG, '%{public}s', SUITE_PREFIX + TAG + ' start');
      const result: IrCompileResult = new IrCompileResult();
      expect(result.ok).assertFalse();
      expect(result.error).assertEqual(IrCompileError.NONE);
      expect(result.frames.length).assertEqual(0);
      expect(result.message).assertEqual('');
      const frame: IrFrame = new IrFrame();
      expect(frame.index).assertEqual(0);
      expect(frame.pattern.length).assertEqual(0);
      expect(frame.durationUs).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', SUITE_PREFIX + TAG + ' end');
    });

    /**
     * @tc.number    SUB_MEETINGSCENE_LOGIC_IRCORE_0102
     * @tc.name      testIrCore0003
     * @tc.desc      新建 SendStep/SendJob/SendTicket/SendFrame 的默认值：步间延迟
     *               250ms、来源 MANUAL、任务未受理且票据为空、帧载频 38kHz。
     * @tc.require   NA
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testIrCore0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const TAG: string = 'testIrCore0003';
      hilog.info(DOMAIN, TAG, '%{public}s', SUITE_PREFIX + TAG + ' start');
      const step: SendStep = new SendStep();
      expect(step.delayMs).assertEqual(250);
      expect(step.index).assertEqual(0);
      expect(step.frames.length).assertEqual(0);
      const job: SendJob = new SendJob();
      expect(job.source).assertEqual(SendSource.MANUAL);
      expect(job.ticketId).assertEqual('');
      expect(job.steps.length).assertEqual(0);
      const ticket: SendTicket = new SendTicket();
      expect(ticket.accepted).assertFalse();
      expect(ticket.ticketId).assertEqual('');
      expect(ticket.reason).assertEqual('');
      const frame: SendFrame = new SendFrame();
      expect(frame.frequencyHz).assertEqual(DEFAULT_FREQUENCY_HZ);
      expect(frame.pattern.length).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', SUITE_PREFIX + TAG + ' end');
    });

    /**
     * @tc.number    SUB_MEETINGSCENE_LOGIC_IRCORE_0103
     * @tc.name      testIrCore0004
     * @tc.desc      新建 TransmitResult 结果码为 UNKNOWN，新建 SendProgress 处于
     *               PENDING 且结果码 UNKNOWN，新建 IrCapability 为无发射器只读状态。
     * @tc.require   NA
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testIrCore0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const TAG: string = 'testIrCore0004';
      hilog.info(DOMAIN, TAG, '%{public}s', SUITE_PREFIX + TAG + ' start');
      const result: TransmitResult = new TransmitResult();
      expect(result.code).assertEqual(TransmitResultCode.UNKNOWN);
      expect(result.durationMs).assertEqual(0);
      expect(result.message).assertEqual('');
      const progress: SendProgress = new SendProgress();
      expect(progress.state).assertEqual(SendState.PENDING);
      expect(progress.resultCode).assertEqual(TransmitResultCode.UNKNOWN);
      expect(progress.ticketId).assertEqual('');
      expect(progress.stepIndex).assertEqual(0);
      expect(progress.totalSteps).assertEqual(0);
      const capability: IrCapability = new IrCapability();
      expect(capability.hasEmitter).assertFalse();
      expect(capability.readOnly).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', SUITE_PREFIX + TAG + ' end');
    });

    /**
     * @tc.number    SUB_MEETINGSCENE_LOGIC_IRCORE_0104
     * @tc.name      testIrCore0005
     * @tc.desc      锁定五个枚举的字符串取值：IrProtocol 五种协议、
     *               TransmitResultCode 六种结果码、SendState 四种步骤状态、
     *               SendSource 两种任务来源。
     * @tc.require   NA
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testIrCore0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const TAG: string = 'testIrCore0005';
      hilog.info(DOMAIN, TAG, '%{public}s', SUITE_PREFIX + TAG + ' start');
      expect(IrProtocol.NEC).assertEqual('NEC');
      expect(IrProtocol.RC5).assertEqual('RC5');
      expect(IrProtocol.RC6).assertEqual('RC6');
      expect(IrProtocol.SONY).assertEqual('SONY');
      expect(IrProtocol.RAW).assertEqual('RAW');
      expect(TransmitResultCode.OK).assertEqual('OK');
      expect(TransmitResultCode.PERM_DENIED).assertEqual('PERM_DENIED');
      expect(TransmitResultCode.PARAM_ERROR).assertEqual('PARAM_ERROR');
      expect(TransmitResultCode.NO_EMITTER).assertEqual('NO_EMITTER');
      expect(TransmitResultCode.BUSY).assertEqual('BUSY');
      expect(TransmitResultCode.UNKNOWN).assertEqual('UNKNOWN');
      expect(SendState.PENDING).assertEqual('PENDING');
      expect(SendState.SENDING).assertEqual('SENDING');
      expect(SendState.SUCCESS).assertEqual('SUCCESS');
      expect(SendState.FAILED).assertEqual('FAILED');
      expect(SendSource.MANUAL).assertEqual('MANUAL');
      expect(SendSource.SCENE).assertEqual('SCENE');
      hilog.info(DOMAIN, TAG, '%{public}s', SUITE_PREFIX + TAG + ' end');
    });

    /**
     * @tc.number    SUB_MEETINGSCENE_LOGIC_IRCORE_0105
     * @tc.name      testIrCore0006
     * @tc.desc      空格分隔的偶数长度 RAW 脉冲序列编译为单帧波形，帧长等于输入
     *               值个数，总时长等于各值之和。
     * @tc.require   NA
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testIrCore0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const TAG: string = 'testIrCore0006';
      hilog.info(DOMAIN, TAG, '%{public}s', SUITE_PREFIX + TAG + ' start');
      const result: IrCompileResult = IrCodeCompiler.compile(buildRawCode('100 200 300 400'));
      expect(result.ok).assertTrue();
      expect(result.error).assertEqual(IrCompileError.NONE);
      expect(result.frames.length).assertEqual(1);
      expect(result.frames[0].pattern.length).assertEqual(4);
      expect(result.frames[0].pattern[0]).assertEqual(100);
      expect(result.frames[0].pattern[3]).assertEqual(400);
      expect(result.frames[0].durationUs).assertEqual(1000);
      hilog.info(DOMAIN, TAG, '%{public}s', SUITE_PREFIX + TAG + ' end');
    });

    /**
     * @tc.number    SUB_MEETINGSCENE_LOGIC_IRCORE_0106
     * @tc.name      testIrCore0007
     * @tc.desc      RAW 载荷中的逗号与分号分隔符被归一化为空格，混合分隔的编译
     *               结果与纯空格分隔完全一致。
     * @tc.require   NA
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testIrCore0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const TAG: string = 'testIrCore0007';
      hilog.info(DOMAIN, TAG, '%{public}s', SUITE_PREFIX + TAG + ' start');
      const mixed: IrCompileResult = IrCodeCompiler.compile(buildRawCode('100,200;300 400'));
      const plain: IrCompileResult = IrCodeCompiler.compile(buildRawCode('100 200 300 400'));
      expect(mixed.ok).assertTrue();
      expect(plain.ok).assertTrue();
      expect(mixed.frames.length).assertEqual(plain.frames.length);
      expect(mixed.frames[0].pattern.length).assertEqual(4);
      expect(mixed.frames[0].pattern.length).assertEqual(plain.frames[0].pattern.length);
      let samePattern: boolean = true;
      for (let i: number = 0; i < mixed.frames[0].pattern.length; i++) {
        if (mixed.frames[0].pattern[i] !== plain.frames[0].pattern[i]) {
          samePattern = false;
        }
      }
      expect(samePattern).assertTrue();
      expect(mixed.frames[0].durationUs).assertEqual(plain.frames[0].durationUs);
      hilog.info(DOMAIN, TAG, '%{public}s', SUITE_PREFIX + TAG + ' end');
    });

    /**
     * @tc.number    SUB_MEETINGSCENE_LOGIC_IRCORE_0107
     * @tc.name      testIrCore0008
     * @tc.desc      奇数个值的 RAW 序列编译时自动复制末值补成偶数长度，帧长为
     *               输入值个数加一且末两位相同。
     * @tc.require   NA
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testIrCore0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const TAG: string = 'testIrCore0008';
      hilog.info(DOMAIN, TAG, '%{public}s', SUITE_PREFIX + TAG + ' start');
      const result: IrCompileResult = IrCodeCompiler.compile(buildRawCode('100 200 300'));
      expect(result.ok).assertTrue();
      expect(result.frames.length).assertEqual(1);
      expect(result.frames[0].pattern.length).assertEqual(4);
      expect(result.frames[0].pattern[2]).assertEqual(300);
      expect(result.frames[0].pattern[3]).assertEqual(300);
      expect(result.frames[0].durationUs).assertEqual(900);
      hilog.info(DOMAIN, TAG, '%{public}s', SUITE_PREFIX + TAG + ' end');
    });

    /**
     * @tc.number    SUB_MEETINGSCENE_LOGIC_IRCORE_0108
     * @tc.name      testIrCore0009
     * @tc.desc      RAW 序列中出现零值、负值、非数字与 NaN 文本任一时编译失败，
     *               错误码为 INVALID_VALUE 且不产生任何帧。
     * @tc.require   NA
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testIrCore0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const TAG: string = 'testIrCore0009';
      hilog.info(DOMAIN, TAG, '%{public}s', SUITE_PREFIX + TAG + ' start');
      const zero: IrCompileResult = IrCodeCompiler.compile(buildRawCode('0 100 200'));
      expect(zero.ok).assertFalse();
      expect(zero.error).assertEqual(IrCompileError.INVALID_VALUE);
      expect(zero.frames.length).assertEqual(0);
      const negative: IrCompileResult = IrCodeCompiler.compile(buildRawCode('-5 100 200'));
      expect(negative.ok).assertFalse();
      expect(negative.error).assertEqual(IrCompileError.INVALID_VALUE);
      expect(negative.frames.length).assertEqual(0);
      const alpha: IrCompileResult = IrCodeCompiler.compile(buildRawCode('abc 100 200'));
      expect(alpha.ok).assertFalse();
      expect(alpha.error).assertEqual(IrCompileError.INVALID_VALUE);
      expect(alpha.frames.length).assertEqual(0);
      const nanText: IrCompileResult = IrCodeCompiler.compile(buildRawCode('NaN 100 200'));
      expect(nanText.ok).assertFalse();
      expect(nanText.error).assertEqual(IrCompileError.INVALID_VALUE);
      expect(nanText.frames.length).assertEqual(0);
      expect(zero.message.length > 0).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', SUITE_PREFIX + TAG + ' end');
    });

    /**
     * @tc.number    SUB_MEETINGSCENE_LOGIC_IRCORE_0109
     * @tc.name      testIrCore0010
     * @tc.desc      纯空白字符的 RAW 载荷在编译入口被拒绝，错误码为 EMPTY_PAYLOAD
     *               且提示载荷为空。
     * @tc.require   NA
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testIrCore0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const TAG: string = 'testIrCore0010';
      hilog.info(DOMAIN, TAG, '%{public}s', SUITE_PREFIX + TAG + ' start');
      const result: IrCompileResult = IrCodeCompiler.compile(buildRawCode('   '));
      expect(result.ok).assertFalse();
      expect(result.error).assertEqual(IrCompileError.EMPTY_PAYLOAD);
      expect(result.frames.length).assertEqual(0);
      expect(result.message).assertEqual('IR code payload is empty');
      hilog.info(DOMAIN, TAG, '%{public}s', SUITE_PREFIX + TAG + ' end');
    });

    /**
     * @tc.number    SUB_MEETINGSCENE_LOGIC_IRCORE_0110
     * @tc.name      testIrCore0011
     * @tc.desc      恰好 1024 个正值（单帧上限）的 RAW 序列编译为一个完整帧，帧
     *               长恰为 1024 且总时长等于各值之和。
     * @tc.require   NA
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testIrCore0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const TAG: string = 'testIrCore0011';
      hilog.info(DOMAIN, TAG, '%{public}s', SUITE_PREFIX + TAG + ' start');
      const result: IrCompileResult =
        IrCodeCompiler.compile(buildRawCode(buildLongRawPayload(MAX_PATTERN_LENGTH)));
      expect(result.ok).assertTrue();
      expect(result.frames.length).assertEqual(1);
      expect(result.frames[0].pattern.length).assertEqual(1024);
      expect(result.frames[0].pattern[0]).assertEqual(100);
      expect(result.frames[0].pattern[1]).assertEqual(101);
      expect(result.frames[0].pattern[1023]).assertEqual(100);
      // 1024 个值按 100+(i%3) 循环取值，总时长为 102400 与 1023 个调制增量之和。
      expect(result.frames[0].durationUs).assertEqual(103423);
      hilog.info(DOMAIN, TAG, '%{public}s', SUITE_PREFIX + TAG + ' end');
    });

    /**
     * @tc.number    SUB_MEETINGSCENE_LOGIC_IRCORE_0111
     * @tc.name      testIrCore0012
     * @tc.desc      1025 个正值的 RAW 序列先复制末值补成偶数长度，再按 1024 上限切分
     *               为两帧：首帧 1024 个值、次帧 2 个相同的值，帧序号依次连续。
     * @tc.require   NA
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testIrCore0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const TAG: string = 'testIrCore0012';
      hilog.info(DOMAIN, TAG, '%{public}s', SUITE_PREFIX + TAG + ' start');
      const result: IrCompileResult =
        IrCodeCompiler.compile(buildRawCode(buildLongRawPayload(MAX_PATTERN_LENGTH + 1)));
      expect(result.ok).assertTrue();
      expect(result.frames.length).assertEqual(2);
      expect(result.frames[0].pattern.length).assertEqual(1024);
      expect(result.frames[1].pattern.length).assertEqual(2);
      expect(result.frames[0].index).assertEqual(0);
      expect(result.frames[1].index).assertEqual(1);
      expect(result.frames[1].pattern[0]).assertEqual(101);
      // 第 1025 个值被复制补成偶数长度，次帧末位与首位相同。
      expect(result.frames[1].pattern[1]).assertEqual(101);
      hilog.info(DOMAIN, TAG, '%{public}s', SUITE_PREFIX + TAG + ' end');
    });

    /**
     * @tc.number    SUB_MEETINGSCENE_LOGIC_IRCORE_0112
     * @tc.name      testIrCore0013
     * @tc.desc      十六进制 NEC 载荷 0x08,0xF7 编译为标准 67 值帧：引导码 9000
     *               与 4500 微秒、四字节 mark/space 对、结尾 560 微秒停止位。
     * @tc.require   NA
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testIrCore0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const TAG: string = 'testIrCore0013';
      hilog.info(DOMAIN, TAG, '%{public}s', SUITE_PREFIX + TAG + ' start');
      const result: IrCompileResult = IrCodeCompiler.compile(
        buildCode(IrProtocol.NEC, '0x08,0xF7', 1));
      expect(result.ok).assertTrue();
      expect(result.frames.length).assertEqual(1);
      expect(result.frames[0].pattern.length).assertEqual(NEC_FRAME_LENGTH);
      expect(result.frames[0].pattern[0]).assertEqual(9000);
      expect(result.frames[0].pattern[1]).assertEqual(4500);
      expect(result.frames[0].pattern[NEC_FRAME_LENGTH - 1]).assertEqual(560);
      // 地址 0x08 的第四个比特为 1，对应第 9 位波形的 1690 微秒长空号。
      expect(result.frames[0].pattern[9]).assertEqual(1690);
      expect(result.frames[0].pattern[2]).assertEqual(560);
      hilog.info(DOMAIN, TAG, '%{public}s', SUITE_PREFIX + TAG + ' end');
    });

    /**
     * @tc.number    SUB_MEETINGSCENE_LOGIC_IRCORE_0113
     * @tc.name      testIrCore0014
     * @tc.desc      超过 8 位的 NEC 载荷按 16 位字节加反码解释：1275,2295 取高
     *               字节后与直接编译 0x04,0x08 的波形完全一致。
     * @tc.require   NA
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testIrCore0014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const TAG: string = 'testIrCore0014';
      hilog.info(DOMAIN, TAG, '%{public}s', SUITE_PREFIX + TAG + ' start');
      const combined: IrCompileResult =
        IrCodeCompiler.compile(buildCode(IrProtocol.NEC, '1275,2295', 1));
      const direct: IrCompileResult =
        IrCodeCompiler.compile(buildCode(IrProtocol.NEC, '0x04,0x08', 1));
      expect(combined.ok).assertTrue();
      expect(direct.ok).assertTrue();
      expect(combined.frames.length).assertEqual(direct.frames.length);
      expect(combined.frames[0].pattern.length).assertEqual(NEC_FRAME_LENGTH);
      expect(combined.frames[0].pattern.length).assertEqual(direct.frames[0].pattern.length);
      expect(combined.frames[0].durationUs).assertEqual(direct.frames[0].durationUs);
      let samePattern: boolean = true;
      for (let i: number = 0; i < combined.frames[0].pattern.length; i++) {
        if (combined.frames[0].pattern[i] !== direct.frames[0].pattern[i]) {
          samePattern = false;
        }
      }
      expect(samePattern).assertTrue();
      // 地址 0x04 的第三个比特为 1，对应第 7 位波形的 1690 微秒长空号。
      expect(combined.frames[0].pattern[7]).assertEqual(1690);
      hilog.info(DOMAIN, TAG, '%{public}s', SUITE_PREFIX + TAG + ' end');
    });

    /**
     * @tc.number    SUB_MEETINGSCENE_LOGIC_IRCORE_0114
     * @tc.name      testIrCore0015
     * @tc.desc      NEC 载荷 0,255 为 8 位边界值：地址 0 的反码 255 全部为长空号，
     *               命令 255 的反码 0 全部为短空号。
     * @tc.require   NA
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testIrCore0015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const TAG: string = 'testIrCore0015';
      hilog.info(DOMAIN, TAG, '%{public}s', SUITE_PREFIX + TAG + ' start');
      const result: IrCompileResult =
        IrCodeCompiler.compile(buildCode(IrProtocol.NEC, '0,255', 1));
      expect(result.ok).assertTrue();
      expect(result.frames.length).assertEqual(1);
      expect(result.frames[0].pattern.length).assertEqual(NEC_FRAME_LENGTH);
      // 反地址字节 0xFF 的首个比特为 1：短码 560 后跟长空号 1690。
      expect(result.frames[0].pattern[18]).assertEqual(560);
      expect(result.frames[0].pattern[19]).assertEqual(1690);
      // 反命令字节 0x00 的首个比特为 0：码元均为 560 微秒。
      expect(result.frames[0].pattern[50]).assertEqual(560);
      expect(result.frames[0].pattern[51]).assertEqual(560);
      expect(result.frames[0].pattern[NEC_FRAME_LENGTH - 1]).assertEqual(560);
      hilog.info(DOMAIN, TAG, '%{public}s', SUITE_PREFIX + TAG + ' end');
    });

    /**
     * @tc.number    SUB_MEETINGSCENE_LOGIC_IRCORE_0115
     * @tc.name      testIrCore0016
     * @tc.desc      NEC 载荷元素个数不为二、含非数字文本、负值或超过 16 位上界
     *               时均编译失败，错误码为 INVALID_VALUE。
     * @tc.require   NA
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testIrCore0016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const TAG: string = 'testIrCore0016';
      hilog.info(DOMAIN, TAG, '%{public}s', SUITE_PREFIX + TAG + ' start');
      const threeTokens: IrCompileResult =
        IrCodeCompiler.compile(buildCode(IrProtocol.NEC, '1,2,3', 1));
      expect(threeTokens.ok).assertFalse();
      expect(threeTokens.error).assertEqual(IrCompileError.INVALID_VALUE);
      expect(threeTokens.frames.length).assertEqual(0);
      const alpha: IrCompileResult =
        IrCodeCompiler.compile(buildCode(IrProtocol.NEC, 'a,b', 1));
      expect(alpha.ok).assertFalse();
      expect(alpha.error).assertEqual(IrCompileError.INVALID_VALUE);
      expect(alpha.frames.length).assertEqual(0);
      const negative: IrCompileResult =
        IrCodeCompiler.compile(buildCode(IrProtocol.NEC, '-1,5', 1));
      expect(negative.ok).assertFalse();
      expect(negative.error).assertEqual(IrCompileError.INVALID_VALUE);
      expect(negative.frames.length).assertEqual(0);
      const overflow: IrCompileResult =
        IrCodeCompiler.compile(buildCode(IrProtocol.NEC, '65536,0', 1));
      expect(overflow.ok).assertFalse();
      expect(overflow.error).assertEqual(IrCompileError.INVALID_VALUE);
      expect(overflow.frames.length).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', SUITE_PREFIX + TAG + ' end');
    });

    /**
     * @tc.number    SUB_MEETINGSCENE_LOGIC_IRCORE_0116
     * @tc.name      testIrCore0017
     * @tc.desc      SONY 15 位帧编译为 32 值波形，数据按低位在先展开：1234,15 的
     *               第二个比特为 1 输出 1200 微秒长码，1,12 的首个比特同样如此。
     * @tc.require   NA
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testIrCore0017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const TAG: string = 'testIrCore0017';
      hilog.info(DOMAIN, TAG, '%{public}s', SUITE_PREFIX + TAG + ' start');
      const extended: IrCompileResult =
        IrCodeCompiler.compile(buildCode(IrProtocol.SONY, '1234,15', 1));
      expect(extended.ok).assertTrue();
      expect(extended.frames.length).assertEqual(1);
      expect(extended.frames[0].pattern.length).assertEqual(SONY_15_FRAME_LENGTH);
      expect(extended.frames[0].pattern[0]).assertEqual(2400);
      expect(extended.frames[0].pattern[1]).assertEqual(600);
      // 1234 的第二个比特（低位在先）为 1：长码 1200 后跟短空号 600。
      expect(extended.frames[0].pattern[4]).assertEqual(1200);
      expect(extended.frames[0].pattern[5]).assertEqual(600);
      // 15 位帧含五个 1 比特：总时长 3000 引导 + 5×1800 + 10×1200 = 24000。
      expect(extended.frames[0].durationUs).assertEqual(24000);
      const short: IrCompileResult =
        IrCodeCompiler.compile(buildCode(IrProtocol.SONY, '1,12', 1));
      expect(short.ok).assertTrue();
      expect(short.frames.length).assertEqual(1);
      expect(short.frames[0].pattern.length).assertEqual(SONY_12_FRAME_LENGTH);
      // 1 的首个比特为 1：第三个波形值为 1200 微秒长码，随后 600 微秒空号。
      expect(short.frames[0].pattern[2]).assertEqual(1200);
      expect(short.frames[0].pattern[3]).assertEqual(600);
      hilog.info(DOMAIN, TAG, '%{public}s', SUITE_PREFIX + TAG + ' end');
    });

    /**
     * @tc.number    SUB_MEETINGSCENE_LOGIC_IRCORE_0117
     * @tc.name      testIrCore0018
     * @tc.desc      SONY 位数为 13、11、21 时均不在 12/15/20 的支持范围，编译失败
     *               且错误码为 INVALID_VALUE。
     * @tc.require   NA
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testIrCore0018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const TAG: string = 'testIrCore0018';
      hilog.info(DOMAIN, TAG, '%{public}s', SUITE_PREFIX + TAG + ' start');
      const thirteen: IrCompileResult =
        IrCodeCompiler.compile(buildCode(IrProtocol.SONY, '100,13', 1));
      expect(thirteen.ok).assertFalse();
      expect(thirteen.error).assertEqual(IrCompileError.INVALID_VALUE);
      expect(thirteen.frames.length).assertEqual(0);
      const eleven: IrCompileResult =
        IrCodeCompiler.compile(buildCode(IrProtocol.SONY, '100,11', 1));
      expect(eleven.ok).assertFalse();
      expect(eleven.error).assertEqual(IrCompileError.INVALID_VALUE);
      expect(eleven.frames.length).assertEqual(0);
      const twentyOne: IrCompileResult =
        IrCodeCompiler.compile(buildCode(IrProtocol.SONY, '100,21', 1));
      expect(twentyOne.ok).assertFalse();
      expect(twentyOne.error).assertEqual(IrCompileError.INVALID_VALUE);
      expect(twentyOne.frames.length).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', SUITE_PREFIX + TAG + ' end');
    });

    /**
     * @tc.number    SUB_MEETINGSCENE_LOGIC_IRCORE_0118
     * @tc.name      testIrCore0019
     * @tc.desc      SONY 数据值等于 12 位上界 4096 或为负数时编译失败；数据为 0
     *               属于合法下界，编译为全零比特的标准帧。
     * @tc.require   NA
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testIrCore0019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const TAG: string = 'testIrCore0019';
      hilog.info(DOMAIN, TAG, '%{public}s', SUITE_PREFIX + TAG + ' start');
      const overflow: IrCompileResult =
        IrCodeCompiler.compile(buildCode(IrProtocol.SONY, '4096,12', 1));
      expect(overflow.ok).assertFalse();
      expect(overflow.error).assertEqual(IrCompileError.INVALID_VALUE);
      expect(overflow.frames.length).assertEqual(0);
      const negative: IrCompileResult =
        IrCodeCompiler.compile(buildCode(IrProtocol.SONY, '-1,12', 1));
      expect(negative.ok).assertFalse();
      expect(negative.error).assertEqual(IrCompileError.INVALID_VALUE);
      expect(negative.frames.length).assertEqual(0);
      const zero: IrCompileResult =
        IrCodeCompiler.compile(buildCode(IrProtocol.SONY, '0,12', 1));
      expect(zero.ok).assertTrue();
      expect(zero.frames.length).assertEqual(1);
      expect(zero.frames[0].pattern.length).assertEqual(SONY_12_FRAME_LENGTH);
      // 数据 0 的所有比特为 0：首个数据码元为 600 微秒短码。
      expect(zero.frames[0].pattern[2]).assertEqual(600);
      hilog.info(DOMAIN, TAG, '%{public}s', SUITE_PREFIX + TAG + ' end');
    });

    /**
     * @tc.number    SUB_MEETINGSCENE_LOGIC_IRCORE_0119
     * @tc.name      testIrCore0020
     * @tc.desc      RC5 载荷 0,0 编译为 14 比特曼彻斯特帧：起始位与场位先高后低，
     *               前三个半比特各 889 微秒，总时长恒为 24892 微秒。
     * @tc.require   NA
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testIrCore0020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const TAG: string = 'testIrCore0020';
      hilog.info(DOMAIN, TAG, '%{public}s', SUITE_PREFIX + TAG + ' start');
      const result: IrCompileResult =
        IrCodeCompiler.compile(buildCode(IrProtocol.RC5, '0,0', 1));
      expect(result.ok).assertTrue();
      expect(result.frames.length).assertEqual(1);
      expect(result.frames[0].pattern.length >= 2).assertTrue();
      expect(result.frames[0].pattern[0]).assertEqual(889);
      expect(result.frames[0].pattern[1]).assertEqual(889);
      // 前导 1,1,0 的电平序列使第四段为连续两个低电平半比特，合并为 1778。
      expect(result.frames[0].pattern[3]).assertEqual(1778);
      expect(result.frames[0].durationUs).assertEqual(RC5_DURATION_US);
      hilog.info(DOMAIN, TAG, '%{public}s', SUITE_PREFIX + TAG + ' end');
    });

    /**
     * @tc.number    SUB_MEETINGSCENE_LOGIC_IRCORE_0120
     * @tc.name      testIrCore0021
     * @tc.desc      RC5 地址 31 与命令 63 为合法上界：编译成功且总时长仍为 24892
     *               微秒，前导后的连续 1 比特合并出两个 1778 微秒的段。
     * @tc.require   NA
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testIrCore0021', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const TAG: string = 'testIrCore0021';
      hilog.info(DOMAIN, TAG, '%{public}s', SUITE_PREFIX + TAG + ' start');
      const result: IrCompileResult =
        IrCodeCompiler.compile(buildCode(IrProtocol.RC5, '31,63', 1));
      expect(result.ok).assertTrue();
      expect(result.frames.length).assertEqual(1);
      expect(result.frames[0].pattern[3]).assertEqual(1778);
      expect(result.frames[0].pattern[4]).assertEqual(1778);
      expect(result.frames[0].durationUs).assertEqual(RC5_DURATION_US);
      hilog.info(DOMAIN, TAG, '%{public}s', SUITE_PREFIX + TAG + ' end');
    });

    /**
     * @tc.number    SUB_MEETINGSCENE_LOGIC_IRCORE_0121
     * @tc.name      testIrCore0022
     * @tc.desc      RC5 地址超过 31、命令超过 63、取负数或非整数时均编译失败，
     *               错误码为 INVALID_VALUE。
     * @tc.require   NA
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testIrCore0022', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const TAG: string = 'testIrCore0022';
      hilog.info(DOMAIN, TAG, '%{public}s', SUITE_PREFIX + TAG + ' start');
      const addressOverflow: IrCompileResult =
        IrCodeCompiler.compile(buildCode(IrProtocol.RC5, '32,0', 1));
      expect(addressOverflow.ok).assertFalse();
      expect(addressOverflow.error).assertEqual(IrCompileError.INVALID_VALUE);
      expect(addressOverflow.frames.length).assertEqual(0);
      const commandOverflow: IrCompileResult =
        IrCodeCompiler.compile(buildCode(IrProtocol.RC5, '0,64', 1));
      expect(commandOverflow.ok).assertFalse();
      expect(commandOverflow.error).assertEqual(IrCompileError.INVALID_VALUE);
      expect(commandOverflow.frames.length).assertEqual(0);
      const negative: IrCompileResult =
        IrCodeCompiler.compile(buildCode(IrProtocol.RC5, '-1,0', 1));
      expect(negative.ok).assertFalse();
      expect(negative.error).assertEqual(IrCompileError.INVALID_VALUE);
      expect(negative.frames.length).assertEqual(0);
      const fractional: IrCompileResult =
        IrCodeCompiler.compile(buildCode(IrProtocol.RC5, '1.5,0', 1));
      expect(fractional.ok).assertFalse();
      expect(fractional.error).assertEqual(IrCompileError.INVALID_VALUE);
      expect(fractional.frames.length).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', SUITE_PREFIX + TAG + ' end');
    });

    /**
     * @tc.number    SUB_MEETINGSCENE_LOGIC_IRCORE_0122
     * @tc.name      testIrCore0023
     * @tc.desc      RC6 协议暂未实现编译：非空载荷编译失败，错误码为
     *               UNSUPPORTED_PROTOCOL 且提示信息中包含 RC6。
     * @tc.require   NA
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testIrCore0023', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const TAG: string = 'testIrCore0023';
      hilog.info(DOMAIN, TAG, '%{public}s', SUITE_PREFIX + TAG + ' start');
      const result: IrCompileResult =
        IrCodeCompiler.compile(buildCode(IrProtocol.RC6, '100 200', 1));
      expect(result.ok).assertFalse();
      expect(result.error).assertEqual(IrCompileError.UNSUPPORTED_PROTOCOL);
      expect(result.frames.length).assertEqual(0);
      expect(result.message.indexOf('RC6') >= 0).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', SUITE_PREFIX + TAG + ' end');
    });

    /**
     * @tc.number    SUB_MEETINGSCENE_LOGIC_IRCORE_0123
     * @tc.name      testIrCore0024
     * @tc.desc      重复次数为 3 时单帧 RAW 波形输出三帧且帧序号连续；重复次数
     *               为 0 或负数时回退为一帧。
     * @tc.require   NA
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testIrCore0024', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const TAG: string = 'testIrCore0024';
      hilog.info(DOMAIN, TAG, '%{public}s', SUITE_PREFIX + TAG + ' start');
      const repeated: IrCompileResult = IrCodeCompiler.compile(buildCode(IrProtocol.RAW, '100 200', 3));
      expect(repeated.ok).assertTrue();
      expect(repeated.frames.length).assertEqual(3);
      expect(repeated.frames[0].index).assertEqual(0);
      expect(repeated.frames[1].index).assertEqual(1);
      expect(repeated.frames[2].index).assertEqual(2);
      expect(repeated.frames[2].pattern[0]).assertEqual(100);
      expect(repeated.frames[2].durationUs).assertEqual(300);
      const zeroRepeat: IrCompileResult =
        IrCodeCompiler.compile(buildCode(IrProtocol.RAW, '100 200', 0));
      expect(zeroRepeat.ok).assertTrue();
      expect(zeroRepeat.frames.length).assertEqual(1);
      const negativeRepeat: IrCompileResult =
        IrCodeCompiler.compile(buildCode(IrProtocol.RAW, '100 200', -2));
      expect(negativeRepeat.ok).assertTrue();
      expect(negativeRepeat.frames.length).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', SUITE_PREFIX + TAG + ' end');
    });

    /**
     * @tc.number    SUB_MEETINGSCENE_LOGIC_IRCORE_0124
     * @tc.name      testIrCore0025
     * @tc.desc      载频不影响编译结果：同一 RAW 载荷在 38kHz 与 48kHz 两个
     *               IrCode 下编译出的波形完全一致。
     * @tc.require   NA
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testIrCore0025', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const TAG: string = 'testIrCore0025';
      hilog.info(DOMAIN, TAG, '%{public}s', SUITE_PREFIX + TAG + ' start');
      const low: IrCode = buildRawCode('250 500');
      low.frequencyHz = DEFAULT_FREQUENCY_HZ;
      const high: IrCode = buildRawCode('250 500');
      high.frequencyHz = 48000;
      const lowResult: IrCompileResult = IrCodeCompiler.compile(low);
      const highResult: IrCompileResult = IrCodeCompiler.compile(high);
      expect(lowResult.ok).assertTrue();
      expect(highResult.ok).assertTrue();
      expect(lowResult.frames.length).assertEqual(1);
      expect(lowResult.frames.length).assertEqual(highResult.frames.length);
      expect(lowResult.frames[0].pattern.length).assertEqual(2);
      let samePattern: boolean = true;
      for (let i: number = 0; i < lowResult.frames[0].pattern.length; i++) {
        if (lowResult.frames[0].pattern[i] !== highResult.frames[0].pattern[i]) {
          samePattern = false;
        }
      }
      expect(samePattern).assertTrue();
      expect(lowResult.frames[0].durationUs).assertEqual(highResult.frames[0].durationUs);
      expect(lowResult.frames[0].durationUs).assertEqual(750);
      hilog.info(DOMAIN, TAG, '%{public}s', SUITE_PREFIX + TAG + ' end');
    });

    /**
     * @tc.number    SUB_MEETINGSCENE_LOGIC_IRCORE_0125
     * @tc.name      testIrCore0026
     * @tc.desc      系统错误码映射：201 映射为权限拒绝 PERM_DENIED，401 映射为
     *               参数错误 PARAM_ERROR。
     * @tc.require   NA
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testIrCore0026', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const TAG: string = 'testIrCore0026';
      hilog.info(DOMAIN, TAG, '%{public}s', SUITE_PREFIX + TAG + ' start');
      const denied: BusinessError = buildBizError(201);
      expect(TransmitErrorMapper.fromError(denied)).assertEqual(TransmitResultCode.PERM_DENIED);
      const invalid: BusinessError = buildBizError(401);
      expect(TransmitErrorMapper.fromError(invalid)).assertEqual(TransmitResultCode.PARAM_ERROR);
      expect(TransmitResultCode.PERM_DENIED.toString() !== TransmitResultCode.PARAM_ERROR.toString())
        .assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', SUITE_PREFIX + TAG + ' end');
    });

    /**
     * @tc.number    SUB_MEETINGSCENE_LOGIC_IRCORE_0126
     * @tc.name      testIrCore0027
     * @tc.desc      系统错误码 0 与 404 不属于已知映射，均归一化为 UNKNOWN。
     * @tc.require   NA
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testIrCore0027', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const TAG: string = 'testIrCore0027';
      hilog.info(DOMAIN, TAG, '%{public}s', SUITE_PREFIX + TAG + ' start');
      const zero: BusinessError = buildBizError(0);
      expect(TransmitErrorMapper.fromError(zero)).assertEqual(TransmitResultCode.UNKNOWN);
      const notFound: BusinessError = buildBizError(404);
      expect(TransmitErrorMapper.fromError(notFound)).assertEqual(TransmitResultCode.UNKNOWN);
      expect(TransmitErrorMapper.fromError(zero) === TransmitErrorMapper.fromError(notFound))
        .assertTrue();
      expect(TransmitErrorMapper.fromError(notFound) === TransmitResultCode.PARAM_ERROR)
        .assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', SUITE_PREFIX + TAG + ' end');
    });

    /**
     * @tc.number    SUB_MEETINGSCENE_LOGIC_IRCORE_0127
     * @tc.name      testIrCore0028
     * @tc.desc      负数与超大错误码同样落入 UNKNOWN，且与 201 的权限拒绝映射
     *               结果互不相同。
     * @tc.require   NA
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testIrCore0028', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const TAG: string = 'testIrCore0028';
      hilog.info(DOMAIN, TAG, '%{public}s', SUITE_PREFIX + TAG + ' start');
      const negative: BusinessError = buildBizError(-1);
      const huge: BusinessError = buildBizError(90001);
      expect(TransmitErrorMapper.fromError(negative)).assertEqual(TransmitResultCode.UNKNOWN);
      expect(TransmitErrorMapper.fromError(huge)).assertEqual(TransmitResultCode.UNKNOWN);
      expect(TransmitErrorMapper.fromError(negative) === TransmitErrorMapper.fromError(huge))
        .assertTrue();
      const denied: BusinessError = buildBizError(201);
      expect(TransmitErrorMapper.fromError(denied) === TransmitErrorMapper.fromError(huge))
        .assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', SUITE_PREFIX + TAG + ' end');
    });

    /**
     * @tc.number    SUB_MEETINGSCENE_LOGIC_IRCORE_0128
     * @tc.name      testIrCore0029
     * @tc.desc      发送队列为进程级单例：多次获取返回同一实例，空闲时 isBusy
     *               为假。
     * @tc.require   NA
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testIrCore0029', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      const TAG: string = 'testIrCore0029';
      hilog.info(DOMAIN, TAG, '%{public}s', SUITE_PREFIX + TAG + ' start');
      const first: IrSendQueue = IrSendQueue.getInstance();
      const second: IrSendQueue = IrSendQueue.getInstance();
      expect(first === second).assertTrue();
      const third: IrSendQueue = IrSendQueue.getInstance();
      expect(third === first).assertTrue();
      expect(first.isBusy()).assertFalse();
      await first.waitIdle();
      expect(first.isBusy()).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', SUITE_PREFIX + TAG + ' end');
    });

    /**
     * @tc.number    SUB_MEETINGSCENE_LOGIC_IRCORE_0129
     * @tc.name      testIrCore0030
     * @tc.desc      单步空帧任务入队即被受理：返回 job- 前缀票据并回写任务，
     *               空闲后队列退出忙碌状态。
     * @tc.require   NA
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testIrCore0030', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      const TAG: string = 'testIrCore0030';
      hilog.info(DOMAIN, TAG, '%{public}s', SUITE_PREFIX + TAG + ' start');
      const queue: IrSendQueue = IrSendQueue.getInstance();
      const job: SendJob = buildEmptyJob(SendSource.MANUAL, 1, 250);
      const ticket: SendTicket = queue.enqueue(job);
      expect(ticket.accepted).assertTrue();
      expect(ticket.ticketId.indexOf('job-') === 0).assertTrue();
      expect(ticket.ticketId.length > 4).assertTrue();
      expect(job.ticketId).assertEqual(ticket.ticketId);
      await queue.waitIdle();
      expect(queue.isBusy()).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', SUITE_PREFIX + TAG + ' end');
    });

    /**
     * @tc.number    SUB_MEETINGSCENE_LOGIC_IRCORE_0130
     * @tc.name      testIrCore0031
     * @tc.desc      队列完成首个任务后可再次受理：两次入队均成功且新票据与上次
     *               不同，场景来源的任务同样被接受。
     * @tc.require   NA
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testIrCore0031', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      const TAG: string = 'testIrCore0031';
      hilog.info(DOMAIN, TAG, '%{public}s', SUITE_PREFIX + TAG + ' start');
      const queue: IrSendQueue = IrSendQueue.getInstance();
      const first: SendTicket = queue.enqueue(buildEmptyJob(SendSource.MANUAL, 1, 250));
      expect(first.accepted).assertTrue();
      await queue.waitIdle();
      const second: SendTicket = queue.enqueue(buildEmptyJob(SendSource.SCENE, 1, 250));
      expect(second.accepted).assertTrue();
      expect(second.ticketId === first.ticketId).assertFalse();
      expect(second.ticketId.indexOf('job-') === 0).assertTrue();
      await queue.waitIdle();
      expect(queue.isBusy()).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', SUITE_PREFIX + TAG + ' end');
    });

    /**
     * @tc.number    SUB_MEETINGSCENE_LOGIC_IRCORE_0131
     * @tc.name      testIrCore0032
     * @tc.desc      任务执行期间再次入队被拒绝：受理为假、原因为 BUSY、票据为
     *               空；队列空闲后同一场景重新入队即可受理。
     * @tc.require   NA
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testIrCore0032', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const TAG: string = 'testIrCore0032';
      hilog.info(DOMAIN, TAG, '%{public}s', SUITE_PREFIX + TAG + ' start');
      const queue: IrSendQueue = IrSendQueue.getInstance();
      const running: SendTicket = queue.enqueue(buildEmptyJob(SendSource.MANUAL, 2, 300));
      expect(running.accepted).assertTrue();
      // 首个任务仍在执行（总耗时约 300ms 的步间延迟），同步入队必然命中忙碌分支。
      const rejectedJob: SendJob = buildEmptyJob(SendSource.MANUAL, 1, 250);
      const rejected: SendTicket = queue.enqueue(rejectedJob);
      expect(rejected.accepted).assertFalse();
      expect(rejected.reason).assertEqual('BUSY');
      expect(rejected.ticketId).assertEqual('');
      expect(rejectedJob.ticketId).assertEqual('');
      await queue.waitIdle();
      const retried: SendTicket = queue.enqueue(buildEmptyJob(SendSource.MANUAL, 1, 250));
      expect(retried.accepted).assertTrue();
      await queue.waitIdle();
      expect(queue.isBusy()).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', SUITE_PREFIX + TAG + ' end');
    });

    /**
     * @tc.number    SUB_MEETINGSCENE_LOGIC_IRCORE_0132
     * @tc.name      testIrCore0033
     * @tc.desc      取消请求在步骤边界生效：入队后立即取消两步任务，后续步骤
     *               不再执行、无失败事件，队列回到空闲。
     * @tc.require   NA
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testIrCore0033', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const TAG: string = 'testIrCore0033';
      hilog.info(DOMAIN, TAG, '%{public}s', SUITE_PREFIX + TAG + ' start');
      const queue: IrSendQueue = IrSendQueue.getInstance();
      const events: SendProgress[] = [];
      const listener: (ticketId: string, progress: SendProgress) => void =
        (ticketId: string, progress: SendProgress): void => {
          events.push(progress);
        };
      queue.onProgress(listener);
      const running: SendTicket = queue.enqueue(buildEmptyJob(SendSource.MANUAL, 2, 300));
      expect(running.accepted).assertTrue();
      expect(queue.isBusy()).assertTrue();
      queue.cancel(running.ticketId);
      await queue.waitIdle();
      expect(queue.isBusy()).assertFalse();
      // 取消生效后第二个步骤（序号 1）不应产生任何进度事件，也不应出现失败状态。
      let reachedStepOne: boolean = false;
      let hasFailed: boolean = false;
      for (let i: number = 0; i < events.length; i++) {
        if (events[i].stepIndex === 1) {
          reachedStepOne = true;
        }
        if (events[i].state === SendState.FAILED) {
          hasFailed = true;
        }
      }
      expect(reachedStepOne).assertFalse();
      expect(hasFailed).assertFalse();
      queue.offProgress(listener);
      hilog.info(DOMAIN, TAG, '%{public}s', SUITE_PREFIX + TAG + ' end');
    });

    /**
     * @tc.number    SUB_MEETINGSCENE_LOGIC_IRCORE_0133
     * @tc.name      testIrCore0034
     * @tc.desc      空帧步骤任务推送 PENDING、SENDING、SUCCESS 三态进度：至少三
     *               个事件、末事件为成功且各事件票据与入队返回一致。
     * @tc.require   NA
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testIrCore0034', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      const TAG: string = 'testIrCore0034';
      hilog.info(DOMAIN, TAG, '%{public}s', SUITE_PREFIX + TAG + ' start');
      const queue: IrSendQueue = IrSendQueue.getInstance();
      const events: SendProgress[] = [];
      const listener: (ticketId: string, progress: SendProgress) => void =
        (ticketId: string, progress: SendProgress): void => {
          events.push(progress);
        };
      queue.onProgress(listener);
      const ticket: SendTicket = queue.enqueue(buildEmptyJob(SendSource.MANUAL, 1, 250));
      expect(ticket.accepted).assertTrue();
      await queue.waitIdle();
      expect(events.length >= 3).assertTrue();
      expect(events[0].state).assertEqual(SendState.PENDING);
      expect(events[1].state).assertEqual(SendState.SENDING);
      expect(events[events.length - 1].state).assertEqual(SendState.SUCCESS);
      expect(events[events.length - 1].stepIndex).assertEqual(0);
      expect(events[events.length - 1].totalSteps).assertEqual(1);
      let allTicketsMatch: boolean = true;
      for (let i: number = 0; i < events.length; i++) {
        if (events[i].ticketId !== ticket.ticketId) {
          allTicketsMatch = false;
        }
      }
      expect(allTicketsMatch).assertTrue();
      queue.offProgress(listener);
      hilog.info(DOMAIN, TAG, '%{public}s', SUITE_PREFIX + TAG + ' end');
    });

    /**
     * @tc.number    SUB_MEETINGSCENE_LOGIC_IRCORE_0134
     * @tc.name      testIrCore0035
     * @tc.desc      注销进度监听后再次执行任务：事件计数保持不变，说明回调不再
     *               被通知。
     * @tc.require   NA
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testIrCore0035', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const TAG: string = 'testIrCore0035';
      hilog.info(DOMAIN, TAG, '%{public}s', SUITE_PREFIX + TAG + ' start');
      const queue: IrSendQueue = IrSendQueue.getInstance();
      const events: SendProgress[] = [];
      const listener: (ticketId: string, progress: SendProgress) => void =
        (ticketId: string, progress: SendProgress): void => {
          events.push(progress);
        };
      queue.onProgress(listener);
      const first: SendTicket = queue.enqueue(buildEmptyJob(SendSource.MANUAL, 1, 250));
      expect(first.accepted).assertTrue();
      await queue.waitIdle();
      const countBefore: number = events.length;
      expect(countBefore >= 3).assertTrue();
      queue.offProgress(listener);
      const second: SendTicket = queue.enqueue(buildEmptyJob(SendSource.MANUAL, 1, 250));
      expect(second.accepted).assertTrue();
      await queue.waitIdle();
      expect(events.length).assertEqual(countBefore);
      expect(queue.isBusy()).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', SUITE_PREFIX + TAG + ' end');
    });

    /**
     * @tc.number    SUB_MEETINGSCENE_LOGIC_IRCORE_0135
     * @tc.name      testIrCore0036
     * @tc.desc      同一监听重复注册两次时每个进度事件推送两次：三态事件共收到
     *               六条，各状态计数均为二。
     * @tc.require   NA
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testIrCore0036', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const TAG: string = 'testIrCore0036';
      hilog.info(DOMAIN, TAG, '%{public}s', SUITE_PREFIX + TAG + ' start');
      const queue: IrSendQueue = IrSendQueue.getInstance();
      const events: SendProgress[] = [];
      const listener: (ticketId: string, progress: SendProgress) => void =
        (ticketId: string, progress: SendProgress): void => {
          events.push(progress);
        };
      queue.onProgress(listener);
      queue.onProgress(listener);
      const ticket: SendTicket = queue.enqueue(buildEmptyJob(SendSource.MANUAL, 1, 250));
      expect(ticket.accepted).assertTrue();
      await queue.waitIdle();
      expect(events.length).assertEqual(6);
      let pendingCount: number = 0;
      let sendingCount: number = 0;
      let successCount: number = 0;
      for (let i: number = 0; i < events.length; i++) {
        if (events[i].state === SendState.PENDING) {
          pendingCount++;
        } else if (events[i].state === SendState.SENDING) {
          sendingCount++;
        } else if (events[i].state === SendState.SUCCESS) {
          successCount++;
        }
      }
      expect(pendingCount).assertEqual(2);
      expect(sendingCount).assertEqual(2);
      expect(successCount).assertEqual(2);
      queue.offProgress(listener);
      queue.offProgress(listener);
      await queue.waitIdle();
      expect(queue.isBusy()).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', SUITE_PREFIX + TAG + ' end');
    });

    /**
     * @tc.number    SUB_MEETINGSCENE_LOGIC_IRCORE_0136
     * @tc.name      testIrCore0037
     * @tc.desc      空波形在触达系统接口前被拒绝：结果码 PARAM_ERROR、耗时为零、
     *               提示波形为空。
     * @tc.require   NA
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testIrCore0037', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const TAG: string = 'testIrCore0037';
      hilog.info(DOMAIN, TAG, '%{public}s', SUITE_PREFIX + TAG + ' start');
      const result: TransmitResult = IrTransmitter.transmitPattern(DEFAULT_FREQUENCY_HZ, []);
      expect(result.code).assertEqual(TransmitResultCode.PARAM_ERROR);
      expect(result.code === TransmitResultCode.OK).assertFalse();
      expect(result.durationMs).assertEqual(0);
      expect(result.message).assertEqual('IR waveform is empty');
      hilog.info(DOMAIN, TAG, '%{public}s', SUITE_PREFIX + TAG + ' end');
    });

    /**
     * @tc.number    SUB_MEETINGSCENE_LOGIC_IRCORE_0137
     * @tc.name      testIrCore0038
     * @tc.desc      1025 个正值的波形超过单帧上限，在触达系统接口前被拒绝且提示
     *               信息说明超出上限。
     * @tc.require   NA
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testIrCore0038', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const TAG: string = 'testIrCore0038';
      hilog.info(DOMAIN, TAG, '%{public}s', SUITE_PREFIX + TAG + ' start');
      const pattern: number[] = [];
      for (let i: number = 0; i < MAX_PATTERN_LENGTH + 1; i++) {
        pattern.push(500);
      }
      const result: TransmitResult = IrTransmitter.transmitPattern(DEFAULT_FREQUENCY_HZ, pattern);
      expect(result.code).assertEqual(TransmitResultCode.PARAM_ERROR);
      expect(result.code === TransmitResultCode.OK).assertFalse();
      expect(result.durationMs).assertEqual(0);
      expect(result.message.indexOf('exceeds') >= 0).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', SUITE_PREFIX + TAG + ' end');
    });

    /**
     * @tc.number    SUB_MEETINGSCENE_LOGIC_IRCORE_0138
     * @tc.name      testIrCore0039
     * @tc.desc      波形中含零值或负值时在触达系统接口前被拒绝，提示信息指出对
     *               应位置取值无效。
     * @tc.require   NA
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testIrCore0039', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const TAG: string = 'testIrCore0039';
      hilog.info(DOMAIN, TAG, '%{public}s', SUITE_PREFIX + TAG + ' start');
      const zeroValue: number[] = [100, 0, 200];
      const zeroResult: TransmitResult =
        IrTransmitter.transmitPattern(DEFAULT_FREQUENCY_HZ, zeroValue);
      expect(zeroResult.code).assertEqual(TransmitResultCode.PARAM_ERROR);
      expect(zeroResult.durationMs).assertEqual(0);
      expect(zeroResult.message.indexOf('invalid') >= 0).assertTrue();
      const negativeValue: number[] = [100, -5, 200];
      const negativeResult: TransmitResult =
        IrTransmitter.transmitPattern(DEFAULT_FREQUENCY_HZ, negativeValue);
      expect(negativeResult.code).assertEqual(TransmitResultCode.PARAM_ERROR);
      expect(negativeResult.durationMs).assertEqual(0);
      expect(negativeResult.message.indexOf('invalid') >= 0).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', SUITE_PREFIX + TAG + ' end');
    });

    /**
     * @tc.number    SUB_MEETINGSCENE_LOGIC_IRCORE_0139
     * @tc.name      testIrCore0040
     * @tc.desc      波形中含 NaN 或无穷大值时在触达系统接口前被拒绝，提示信息
     *               指出取值无效。
     * @tc.require   NA
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testIrCore0040', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const TAG: string = 'testIrCore0040';
      hilog.info(DOMAIN, TAG, '%{public}s', SUITE_PREFIX + TAG + ' start');
      const nanValue: number[] = [100, Number.NaN, 200];
      const nanResult: TransmitResult =
        IrTransmitter.transmitPattern(DEFAULT_FREQUENCY_HZ, nanValue);
      expect(nanResult.code).assertEqual(TransmitResultCode.PARAM_ERROR);
      expect(nanResult.durationMs).assertEqual(0);
      expect(nanResult.message.indexOf('invalid') >= 0).assertTrue();
      const infinityValue: number[] = [Number.POSITIVE_INFINITY];
      const infinityResult: TransmitResult =
        IrTransmitter.transmitPattern(DEFAULT_FREQUENCY_HZ, infinityValue);
      expect(infinityResult.code).assertEqual(TransmitResultCode.PARAM_ERROR);
      expect(infinityResult.durationMs).assertEqual(0);
      expect(infinityResult.message.indexOf('invalid') >= 0).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', SUITE_PREFIX + TAG + ' end');
    });

    /**
     * @tc.number    SUB_MEETINGSCENE_LOGIC_IRCORE_0140
     * @tc.name      testIrCore0041
     * @tc.desc      能力缓存写入后回读字段一致；用例末尾写入默认只读语义对象，
     *               恢复未探测时的安全现场。
     * @tc.require   NA
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testIrCore0041', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const TAG: string = 'testIrCore0041';
      hilog.info(DOMAIN, TAG, '%{public}s', SUITE_PREFIX + TAG + ' start');
      const capability: IrCapability = new IrCapability();
      capability.hasEmitter = true;
      capability.minFrequencyHz = 30000;
      capability.maxFrequencyHz = 60000;
      capability.supportsDefaultFrequency = true;
      capability.readOnly = false;
      IrCapabilityProbe.setCachedForTest(capability);
      const cached: IrCapability = IrCapabilityProbe.getCached();
      expect(cached.hasEmitter).assertTrue();
      expect(cached.minFrequencyHz).assertEqual(30000);
      expect(cached.maxFrequencyHz).assertEqual(60000);
      expect(cached.supportsDefaultFrequency).assertTrue();
      expect(cached.readOnly).assertFalse();
      // 恢复默认只读语义，避免影响其他套件对能力缓存的假设。
      IrCapabilityProbe.setCachedForTest(new IrCapability());
      const restored: IrCapability = IrCapabilityProbe.getCached();
      expect(restored.readOnly).assertTrue();
      expect(restored.hasEmitter).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', SUITE_PREFIX + TAG + ' end');
    });

    /**
     * @tc.number    SUB_MEETINGSCENE_LOGIC_IRCORE_0141
     * @tc.name      testIrCore0042
     * @tc.desc      未探测时的能力对象取安全默认：无发射器、只读、频段上下界
     *               与默认载频支持均为零值或假。
     * @tc.require   NA
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testIrCore0042', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const TAG: string = 'testIrCore0042';
      hilog.info(DOMAIN, TAG, '%{public}s', SUITE_PREFIX + TAG + ' start');
      const capability: IrCapability = new IrCapability();
      expect(capability.hasEmitter).assertFalse();
      expect(capability.readOnly).assertTrue();
      expect(capability.minFrequencyHz).assertEqual(0);
      expect(capability.maxFrequencyHz).assertEqual(0);
      expect(capability.supportsDefaultFrequency).assertFalse();
      expect(capability.reason).assertEqual('');
      hilog.info(DOMAIN, TAG, '%{public}s', SUITE_PREFIX + TAG + ' end');
    });

    /**
     * @tc.number    SUB_MEETINGSCENE_LOGIC_IRCORE_0142
     * @tc.name      testIrCore0043
     * @tc.desc      单键测试遇空载荷在能力检查前失败：结果码 PARAM_ERROR、耗时
     *               为零、提示与编译失败的载荷为空文案一致。
     * @tc.require   NA
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testIrCore0043', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      const TAG: string = 'testIrCore0043';
      hilog.info(DOMAIN, TAG, '%{public}s', SUITE_PREFIX + TAG + ' start');
      const code: IrCode = buildCode(IrProtocol.NEC, '', 1);
      const result: TransmitResult = await KeyTester.testCode(code);
      expect(result.code).assertEqual(TransmitResultCode.PARAM_ERROR);
      expect(result.code === TransmitResultCode.OK).assertFalse();
      expect(result.durationMs).assertEqual(0);
      expect(result.message).assertEqual('IR code payload is empty');
      hilog.info(DOMAIN, TAG, '%{public}s', SUITE_PREFIX + TAG + ' end');
    });

    /**
     * @tc.number    SUB_MEETINGSCENE_LOGIC_IRCORE_0143
     * @tc.name      testIrCore0044
     * @tc.desc      单键测试遇 SONY 位数为 13 在能力检查前失败：结果码
     *               PARAM_ERROR，提示与编译失败的位数支持文案一致。
     * @tc.require   NA
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testIrCore0044', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      const TAG: string = 'testIrCore0044';
      hilog.info(DOMAIN, TAG, '%{public}s', SUITE_PREFIX + TAG + ' start');
      const code: IrCode = buildCode(IrProtocol.SONY, '100,13', 1);
      const result: TransmitResult = await KeyTester.testCode(code);
      expect(result.code).assertEqual(TransmitResultCode.PARAM_ERROR);
      expect(result.durationMs).assertEqual(0);
      expect(result.message).assertEqual('SONY supports 12, 15 or 20 bits only');
      hilog.info(DOMAIN, TAG, '%{public}s', SUITE_PREFIX + TAG + ' end');
    });
  });
}
