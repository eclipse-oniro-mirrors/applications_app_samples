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

import { beforeEachIt, describe, expect, it } from '@ohos/hypium';
import { tick } from '../util/TestTick';
import { ProbeStatus, classifyErrorCode, probeStatusHint, probeStatusName } from '../../../main/ets/model/ProbeState';
import {
  ErrorInfo, codeOfThrown, describeThrown, distributedErrorHint, errorInfo, formatError, isKnownDistributedCode
} from '../../../main/ets/utils/ErrorUtil';
import { LOCAL_GUARD_CODE, LOCAL_THROWN_CODE, ProbeOutcome } from '../../../main/ets/utils/DistributedProbe';

/** 未登记错误码统一落到的兜底提示（probeStatusHint 的 default 分支） */
const DEFAULT_HINT: string = '查看日志面板里的错误码与原始描述';

/** d.ts 里登记过文案的 20 个错误码（含通用 401） */
const REGISTERED_CODES: number[] = [
  201, 401, 801, 32390001, 32390002, 32390004, 32390006, 32390100, 32390101, 32390102, 32390103, 32390104,
  32390200, 32390201, 32390202, 32390203, 32390204, 32390205, 32390206, 32390300
];

/** ProbeStatus 的全部 16 个取值 */
const ALL_STATUSES: ProbeStatus[] = [
  ProbeStatus.IDLE, ProbeStatus.READY, ProbeStatus.PERMISSION_DENIED, ProbeStatus.CAPABILITY_UNSUPPORTED,
  ProbeStatus.UNPAIRED, ProbeStatus.BR_DISABLED, ProbeStatus.DUPLICATE_NAME, ProbeStatus.LIMIT_EXCEEDED,
  ProbeStatus.NOT_READY, ProbeStatus.INVALID_PARAM, ProbeStatus.CHANNEL_INVALID, ProbeStatus.RESTRICTED,
  ProbeStatus.DATA_TOO_LONG, ProbeStatus.SEND_FAILED, ProbeStatus.INTERNAL, ProbeStatus.FAILED
];

/** LOCAL_THROWN_CODE 且 message 含 permission 时的提示 */
const PERMISSION_THROWN_HINT: string =
  '系统以权限校验为由拒绝调用，先在首页授予 DISTRIBUTED_DATASYNC / ACCESS_BLUETOOTH 再重试';

/** 只有 message 的异常对象：复现系统把错误码写在文案里的情况 */
class MessageOnlyError {
  public message: string;

  constructor(message: string) {
    this.message = message;
  }
}

/**
 * 错误码交叉矩阵（分）：每个登记码各占一条用例，同一个码同时穿过
 * classifyErrorCode / probeStatusName / distributedErrorHint / isKnownDistributedCode /
 * ErrorInfo / formatError / describeThrown / ProbeOutcome / codeOfThrown 九个出口，任何一处漂移都会被拦下。
 */
export default function distributedErrorCrossMatrixTest() {
  describe('DistributedErrorCrossMatrixTest', () => {
    // 每 10 条用例让出一次主线程，避免整批串跑触发 THREAD_BLOCK_6S（见 TestTick.ets）
    beforeEachIt(async () => {
      await tick();
    });
    /**
     * @tc.number SUB_DISTRIBUTED_EXT_ERRX_0100
     * @tc.name testErrCross0001
     * @tc.desc Verify code 201 maps to PERMISSION_DENIED with one hint across every error formatter.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testErrCross0001', 0, () => {
      const code = 201;
      const outcome = new ProbeOutcome('探测', code, 'raw-201');
      const info = errorInfo(code, 'raw-201');
      const hint = distributedErrorHint(code);
      expect(classifyErrorCode(code)).assertEqual(ProbeStatus.PERMISSION_DENIED);
      expect(probeStatusName(classifyErrorCode(code))).assertEqual('缺少权限');
      expect(hint.includes('缺少 ohos.permission.DISTRIBUTED_DATASYNC / ACCESS_BLUETOOTH 授权')).assertTrue();
      expect(isKnownDistributedCode(code)).assertTrue();
      expect(info.describe()).assertEqual('[201] raw-201');
      expect(info.hint).assertEqual(hint);
      expect(info.status).assertEqual(ProbeStatus.PERMISSION_DENIED);
      expect(formatError('探测', code, 'raw-201')).assertEqual('探测失败（201）：raw-201');
      expect(describeThrown('探测', code, 'raw-201')).assertEqual(`探测失败（201）：raw-201；${hint}`);
      expect(outcome.describe()).assertEqual('探测失败（201）：raw-201');
      expect(outcome.status).assertEqual(ProbeStatus.PERMISSION_DENIED);
      expect(outcome.hint()).assertEqual(hint);
      expect(outcome.succeeded()).assertFalse();
      expect(codeOfThrown(new MessageOnlyError(`BusinessError ${code}: raw`))).assertEqual(code);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_ERRX_0200
     * @tc.name testErrCross0002
     * @tc.desc Verify code 401 maps to INVALID_PARAM with one hint across every error formatter.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testErrCross0002', 0, () => {
      const code = 401;
      const outcome = new ProbeOutcome('探测', code, 'raw-401');
      const info = errorInfo(code, 'raw-401');
      const hint = distributedErrorHint(code);
      expect(classifyErrorCode(code)).assertEqual(ProbeStatus.INVALID_PARAM);
      expect(probeStatusName(classifyErrorCode(code))).assertEqual('参数无效');
      expect(hint.includes('检查服务名（不超过 255 字节）与对端参数')).assertTrue();
      expect(isKnownDistributedCode(code)).assertFalse();
      expect(info.describe()).assertEqual('[401] raw-401');
      expect(info.hint).assertEqual(hint);
      expect(info.status).assertEqual(ProbeStatus.INVALID_PARAM);
      expect(formatError('探测', code, 'raw-401')).assertEqual('探测失败（401）：raw-401');
      expect(describeThrown('探测', code, 'raw-401')).assertEqual(`探测失败（401）：raw-401；${hint}`);
      expect(outcome.describe()).assertEqual('探测失败（401）：raw-401');
      expect(outcome.status).assertEqual(ProbeStatus.INVALID_PARAM);
      expect(outcome.hint()).assertEqual(hint);
      expect(outcome.succeeded()).assertFalse();
      expect(codeOfThrown(new MessageOnlyError(`BusinessError ${code}: raw`))).assertEqual(code);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_ERRX_0300
     * @tc.name testErrCross0003
     * @tc.desc Verify code 801 maps to CAPABILITY_UNSUPPORTED with one hint across every error formatter.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testErrCross0003', 0, () => {
      const code = 801;
      const outcome = new ProbeOutcome('探测', code, 'raw-801');
      const info = errorInfo(code, 'raw-801');
      const hint = distributedErrorHint(code);
      expect(classifyErrorCode(code)).assertEqual(ProbeStatus.CAPABILITY_UNSUPPORTED);
      expect(probeStatusName(classifyErrorCode(code))).assertEqual('设备不支持');
      expect(hint.includes('当前设备未编译分布式协同能力')).assertTrue();
      expect(isKnownDistributedCode(code)).assertTrue();
      expect(info.describe()).assertEqual('[801] raw-801');
      expect(info.hint).assertEqual(hint);
      expect(info.status).assertEqual(ProbeStatus.CAPABILITY_UNSUPPORTED);
      expect(formatError('探测', code, 'raw-801')).assertEqual('探测失败（801）：raw-801');
      expect(describeThrown('探测', code, 'raw-801')).assertEqual(`探测失败（801）：raw-801；${hint}`);
      expect(outcome.describe()).assertEqual('探测失败（801）：raw-801');
      expect(outcome.status).assertEqual(ProbeStatus.CAPABILITY_UNSUPPORTED);
      expect(outcome.hint()).assertEqual(hint);
      expect(outcome.succeeded()).assertFalse();
      expect(codeOfThrown(new MessageOnlyError(`BusinessError ${code}: raw`))).assertEqual(code);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_ERRX_0400
     * @tc.name testErrCross0004
     * @tc.desc Verify code 32390001 maps to BR_DISABLED with one hint across every error formatter.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testErrCross0004', 0, () => {
      const code = 32390001;
      const outcome = new ProbeOutcome('探测', code, 'raw-32390001');
      const info = errorInfo(code, 'raw-32390001');
      const hint = distributedErrorHint(code);
      expect(classifyErrorCode(code)).assertEqual(ProbeStatus.BR_DISABLED);
      expect(probeStatusName(classifyErrorCode(code))).assertEqual('蓝牙未开启');
      expect(hint.includes('经典蓝牙未开启')).assertTrue();
      expect(isKnownDistributedCode(code)).assertTrue();
      expect(info.describe()).assertEqual('[32390001] raw-32390001');
      expect(info.hint).assertEqual(hint);
      expect(info.status).assertEqual(ProbeStatus.BR_DISABLED);
      expect(formatError('探测', code, 'raw-32390001')).assertEqual('探测失败（32390001）：raw-32390001');
      expect(describeThrown('探测', code, 'raw-32390001')).assertEqual(`探测失败（32390001）：raw-32390001；${hint}`);
      expect(outcome.describe()).assertEqual('探测失败（32390001）：raw-32390001');
      expect(outcome.status).assertEqual(ProbeStatus.BR_DISABLED);
      expect(outcome.hint()).assertEqual(hint);
      expect(outcome.succeeded()).assertFalse();
      expect(codeOfThrown(new MessageOnlyError(`BusinessError ${code}: raw`))).assertEqual(code);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_ERRX_0500
     * @tc.name testErrCross0005
     * @tc.desc Verify code 32390002 maps to UNPAIRED with one hint across every error formatter.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testErrCross0005', 0, () => {
      const code = 32390002;
      const outcome = new ProbeOutcome('探测', code, 'raw-32390002');
      const info = errorInfo(code, 'raw-32390002');
      const hint = distributedErrorHint(code);
      expect(classifyErrorCode(code)).assertEqual(ProbeStatus.UNPAIRED);
      expect(probeStatusName(classifyErrorCode(code))).assertEqual('对端未配对');
      expect(hint.includes('对端设备未与本机配对')).assertTrue();
      expect(isKnownDistributedCode(code)).assertTrue();
      expect(info.describe()).assertEqual('[32390002] raw-32390002');
      expect(info.hint).assertEqual(hint);
      expect(info.status).assertEqual(ProbeStatus.UNPAIRED);
      expect(formatError('探测', code, 'raw-32390002')).assertEqual('探测失败（32390002）：raw-32390002');
      expect(describeThrown('探测', code, 'raw-32390002')).assertEqual(`探测失败（32390002）：raw-32390002；${hint}`);
      expect(outcome.describe()).assertEqual('探测失败（32390002）：raw-32390002');
      expect(outcome.status).assertEqual(ProbeStatus.UNPAIRED);
      expect(outcome.hint()).assertEqual(hint);
      expect(outcome.succeeded()).assertFalse();
      expect(codeOfThrown(new MessageOnlyError(`BusinessError ${code}: raw`))).assertEqual(code);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_ERRX_0600
     * @tc.name testErrCross0006
     * @tc.desc Verify code 32390004 maps to CHANNEL_INVALID with one hint across every error formatter.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testErrCross0006', 0, () => {
      const code = 32390004;
      const outcome = new ProbeOutcome('探测', code, 'raw-32390004');
      const info = errorInfo(code, 'raw-32390004');
      const hint = distributedErrorHint(code);
      expect(classifyErrorCode(code)).assertEqual(ProbeStatus.CHANNEL_INVALID);
      expect(probeStatusName(classifyErrorCode(code))).assertEqual('通道不可用');
      expect(hint.includes('channelId 已失效或不存在')).assertTrue();
      expect(isKnownDistributedCode(code)).assertTrue();
      expect(info.describe()).assertEqual('[32390004] raw-32390004');
      expect(info.hint).assertEqual(hint);
      expect(info.status).assertEqual(ProbeStatus.CHANNEL_INVALID);
      expect(formatError('探测', code, 'raw-32390004')).assertEqual('探测失败（32390004）：raw-32390004');
      expect(describeThrown('探测', code, 'raw-32390004')).assertEqual(`探测失败（32390004）：raw-32390004；${hint}`);
      expect(outcome.describe()).assertEqual('探测失败（32390004）：raw-32390004');
      expect(outcome.status).assertEqual(ProbeStatus.CHANNEL_INVALID);
      expect(outcome.hint()).assertEqual(hint);
      expect(outcome.succeeded()).assertFalse();
      expect(codeOfThrown(new MessageOnlyError(`BusinessError ${code}: raw`))).assertEqual(code);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_ERRX_0700
     * @tc.name testErrCross0007
     * @tc.desc Verify code 32390006 maps to INVALID_PARAM with one hint across every error formatter.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testErrCross0007', 0, () => {
      const code = 32390006;
      const outcome = new ProbeOutcome('探测', code, 'raw-32390006');
      const info = errorInfo(code, 'raw-32390006');
      const hint = distributedErrorHint(code);
      expect(classifyErrorCode(code)).assertEqual(ProbeStatus.INVALID_PARAM);
      expect(probeStatusName(classifyErrorCode(code))).assertEqual('参数无效');
      expect(hint.includes('入参无效，检查 MAC 地址与 UUID 格式')).assertTrue();
      expect(isKnownDistributedCode(code)).assertTrue();
      expect(info.describe()).assertEqual('[32390006] raw-32390006');
      expect(info.hint).assertEqual(hint);
      expect(info.status).assertEqual(ProbeStatus.INVALID_PARAM);
      expect(formatError('探测', code, 'raw-32390006')).assertEqual('探测失败（32390006）：raw-32390006');
      expect(describeThrown('探测', code, 'raw-32390006')).assertEqual(`探测失败（32390006）：raw-32390006；${hint}`);
      expect(outcome.describe()).assertEqual('探测失败（32390006）：raw-32390006');
      expect(outcome.status).assertEqual(ProbeStatus.INVALID_PARAM);
      expect(outcome.hint()).assertEqual(hint);
      expect(outcome.succeeded()).assertFalse();
      expect(codeOfThrown(new MessageOnlyError(`BusinessError ${code}: raw`))).assertEqual(code);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_ERRX_0800
     * @tc.name testErrCross0008
     * @tc.desc Verify code 32390100 maps to INTERNAL with one hint across every error formatter.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testErrCross0008', 0, () => {
      const code = 32390100;
      const outcome = new ProbeOutcome('探测', code, 'raw-32390100');
      const info = errorInfo(code, 'raw-32390100');
      const hint = distributedErrorHint(code);
      expect(classifyErrorCode(code)).assertEqual(ProbeStatus.INTERNAL);
      expect(probeStatusName(classifyErrorCode(code))).assertEqual('内部错误');
      expect(hint.includes('代理通道内部错误')).assertTrue();
      expect(isKnownDistributedCode(code)).assertTrue();
      expect(info.describe()).assertEqual('[32390100] raw-32390100');
      expect(info.hint).assertEqual(hint);
      expect(info.status).assertEqual(ProbeStatus.INTERNAL);
      expect(formatError('探测', code, 'raw-32390100')).assertEqual('探测失败（32390100）：raw-32390100');
      expect(describeThrown('探测', code, 'raw-32390100')).assertEqual(`探测失败（32390100）：raw-32390100；${hint}`);
      expect(outcome.describe()).assertEqual('探测失败（32390100）：raw-32390100');
      expect(outcome.status).assertEqual(ProbeStatus.INTERNAL);
      expect(outcome.hint()).assertEqual(hint);
      expect(outcome.succeeded()).assertFalse();
      expect(codeOfThrown(new MessageOnlyError(`BusinessError ${code}: raw`))).assertEqual(code);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_ERRX_0900
     * @tc.name testErrCross0009
     * @tc.desc Verify code 32390101 maps to RESTRICTED with one hint across every error formatter.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testErrCross0009', 0, () => {
      const code = 32390101;
      const outcome = new ProbeOutcome('探测', code, 'raw-32390101');
      const info = errorInfo(code, 'raw-32390101');
      const hint = distributedErrorHint(code);
      expect(classifyErrorCode(code)).assertEqual(ProbeStatus.RESTRICTED);
      expect(probeStatusName(classifyErrorCode(code))).assertEqual('调用受限');
      expect(hint.includes('本次调用被系统限制')).assertTrue();
      expect(isKnownDistributedCode(code)).assertTrue();
      expect(info.describe()).assertEqual('[32390101] raw-32390101');
      expect(info.hint).assertEqual(hint);
      expect(info.status).assertEqual(ProbeStatus.RESTRICTED);
      expect(formatError('探测', code, 'raw-32390101')).assertEqual('探测失败（32390101）：raw-32390101');
      expect(describeThrown('探测', code, 'raw-32390101')).assertEqual(`探测失败（32390101）：raw-32390101；${hint}`);
      expect(outcome.describe()).assertEqual('探测失败（32390101）：raw-32390101');
      expect(outcome.status).assertEqual(ProbeStatus.RESTRICTED);
      expect(outcome.hint()).assertEqual(hint);
      expect(outcome.succeeded()).assertFalse();
      expect(codeOfThrown(new MessageOnlyError(`BusinessError ${code}: raw`))).assertEqual(code);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_ERRX_1000
     * @tc.name testErrCross0010
     * @tc.desc Verify code 32390102 maps to FAILED with one hint across every error formatter.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testErrCross0010', 0, () => {
      const code = 32390102;
      const outcome = new ProbeOutcome('探测', code, 'raw-32390102');
      const info = errorInfo(code, 'raw-32390102');
      const hint = distributedErrorHint(code);
      expect(classifyErrorCode(code)).assertEqual(ProbeStatus.FAILED);
      expect(probeStatusName(classifyErrorCode(code))).assertEqual('操作失败');
      expect(hint.includes('操作失败或连接超时')).assertTrue();
      expect(isKnownDistributedCode(code)).assertTrue();
      expect(info.describe()).assertEqual('[32390102] raw-32390102');
      expect(info.hint).assertEqual(hint);
      expect(info.status).assertEqual(ProbeStatus.FAILED);
      expect(formatError('探测', code, 'raw-32390102')).assertEqual('探测失败（32390102）：raw-32390102');
      expect(describeThrown('探测', code, 'raw-32390102')).assertEqual(`探测失败（32390102）：raw-32390102；${hint}`);
      expect(outcome.describe()).assertEqual('探测失败（32390102）：raw-32390102');
      expect(outcome.status).assertEqual(ProbeStatus.FAILED);
      expect(outcome.hint()).assertEqual(hint);
      expect(outcome.succeeded()).assertFalse();
      expect(codeOfThrown(new MessageOnlyError(`BusinessError ${code}: raw`))).assertEqual(code);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_ERRX_1100
     * @tc.name testErrCross0011
     * @tc.desc Verify code 32390103 maps to DATA_TOO_LONG with one hint across every error formatter.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testErrCross0011', 0, () => {
      const code = 32390103;
      const outcome = new ProbeOutcome('探测', code, 'raw-32390103');
      const info = errorInfo(code, 'raw-32390103');
      const hint = distributedErrorHint(code);
      expect(classifyErrorCode(code)).assertEqual(ProbeStatus.DATA_TOO_LONG);
      expect(probeStatusName(classifyErrorCode(code))).assertEqual('数据过长');
      expect(hint.includes('单次发送的数据超过链路允许长度')).assertTrue();
      expect(isKnownDistributedCode(code)).assertTrue();
      expect(info.describe()).assertEqual('[32390103] raw-32390103');
      expect(info.hint).assertEqual(hint);
      expect(info.status).assertEqual(ProbeStatus.DATA_TOO_LONG);
      expect(formatError('探测', code, 'raw-32390103')).assertEqual('探测失败（32390103）：raw-32390103');
      expect(describeThrown('探测', code, 'raw-32390103')).assertEqual(`探测失败（32390103）：raw-32390103；${hint}`);
      expect(outcome.describe()).assertEqual('探测失败（32390103）：raw-32390103');
      expect(outcome.status).assertEqual(ProbeStatus.DATA_TOO_LONG);
      expect(outcome.hint()).assertEqual(hint);
      expect(outcome.succeeded()).assertFalse();
      expect(codeOfThrown(new MessageOnlyError(`BusinessError ${code}: raw`))).assertEqual(code);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_ERRX_1200
     * @tc.name testErrCross0012
     * @tc.desc Verify code 32390104 maps to SEND_FAILED with one hint across every error formatter.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testErrCross0012', 0, () => {
      const code = 32390104;
      const outcome = new ProbeOutcome('探测', code, 'raw-32390104');
      const info = errorInfo(code, 'raw-32390104');
      const hint = distributedErrorHint(code);
      expect(classifyErrorCode(code)).assertEqual(ProbeStatus.SEND_FAILED);
      expect(probeStatusName(classifyErrorCode(code))).assertEqual('发送失败');
      expect(hint.includes('数据发送失败')).assertTrue();
      expect(isKnownDistributedCode(code)).assertTrue();
      expect(info.describe()).assertEqual('[32390104] raw-32390104');
      expect(info.hint).assertEqual(hint);
      expect(info.status).assertEqual(ProbeStatus.SEND_FAILED);
      expect(formatError('探测', code, 'raw-32390104')).assertEqual('探测失败（32390104）：raw-32390104');
      expect(describeThrown('探测', code, 'raw-32390104')).assertEqual(`探测失败（32390104）：raw-32390104；${hint}`);
      expect(outcome.describe()).assertEqual('探测失败（32390104）：raw-32390104');
      expect(outcome.status).assertEqual(ProbeStatus.SEND_FAILED);
      expect(outcome.hint()).assertEqual(hint);
      expect(outcome.succeeded()).assertFalse();
      expect(codeOfThrown(new MessageOnlyError(`BusinessError ${code}: raw`))).assertEqual(code);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_ERRX_1300
     * @tc.name testErrCross0013
     * @tc.desc Verify code 32390200 maps to FAILED with one hint across every error formatter.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testErrCross0013', 0, () => {
      const code = 32390200;
      const outcome = new ProbeOutcome('探测', code, 'raw-32390200');
      const info = errorInfo(code, 'raw-32390200');
      const hint = distributedErrorHint(code);
      expect(classifyErrorCode(code)).assertEqual(ProbeStatus.FAILED);
      expect(probeStatusName(classifyErrorCode(code))).assertEqual('操作失败');
      expect(hint.includes('客户端连接超时')).assertTrue();
      expect(isKnownDistributedCode(code)).assertTrue();
      expect(info.describe()).assertEqual('[32390200] raw-32390200');
      expect(info.hint).assertEqual(hint);
      expect(info.status).assertEqual(ProbeStatus.FAILED);
      expect(formatError('探测', code, 'raw-32390200')).assertEqual('探测失败（32390200）：raw-32390200');
      expect(describeThrown('探测', code, 'raw-32390200')).assertEqual(`探测失败（32390200）：raw-32390200；${hint}`);
      expect(outcome.describe()).assertEqual('探测失败（32390200）：raw-32390200');
      expect(outcome.status).assertEqual(ProbeStatus.FAILED);
      expect(outcome.hint()).assertEqual(hint);
      expect(outcome.succeeded()).assertFalse();
      expect(codeOfThrown(new MessageOnlyError(`BusinessError ${code}: raw`))).assertEqual(code);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_ERRX_1400
     * @tc.name testErrCross0014
     * @tc.desc Verify code 32390201 maps to NOT_READY with one hint across every error formatter.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testErrCross0014', 0, () => {
      const code = 32390201;
      const outcome = new ProbeOutcome('探测', code, 'raw-32390201');
      const info = errorInfo(code, 'raw-32390201');
      const hint = distributedErrorHint(code);
      expect(classifyErrorCode(code)).assertEqual(ProbeStatus.NOT_READY);
      expect(probeStatusName(classifyErrorCode(code))).assertEqual('连接未就绪');
      expect(hint.includes('对端服务端未启动')).assertTrue();
      expect(isKnownDistributedCode(code)).assertTrue();
      expect(info.describe()).assertEqual('[32390201] raw-32390201');
      expect(info.hint).assertEqual(hint);
      expect(info.status).assertEqual(ProbeStatus.NOT_READY);
      expect(formatError('探测', code, 'raw-32390201')).assertEqual('探测失败（32390201）：raw-32390201');
      expect(describeThrown('探测', code, 'raw-32390201')).assertEqual(`探测失败（32390201）：raw-32390201；${hint}`);
      expect(outcome.describe()).assertEqual('探测失败（32390201）：raw-32390201');
      expect(outcome.status).assertEqual(ProbeStatus.NOT_READY);
      expect(outcome.hint()).assertEqual(hint);
      expect(outcome.succeeded()).assertFalse();
      expect(codeOfThrown(new MessageOnlyError(`BusinessError ${code}: raw`))).assertEqual(code);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_ERRX_1500
     * @tc.name testErrCross0015
     * @tc.desc Verify code 32390202 maps to LIMIT_EXCEEDED with one hint across every error formatter.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testErrCross0015', 0, () => {
      const code = 32390202;
      const outcome = new ProbeOutcome('探测', code, 'raw-32390202');
      const info = errorInfo(code, 'raw-32390202');
      const hint = distributedErrorHint(code);
      expect(classifyErrorCode(code)).assertEqual(ProbeStatus.LIMIT_EXCEEDED);
      expect(probeStatusName(classifyErrorCode(code))).assertEqual('数量超限');
      expect(hint.includes('服务端数量超过上限')).assertTrue();
      expect(isKnownDistributedCode(code)).assertTrue();
      expect(info.describe()).assertEqual('[32390202] raw-32390202');
      expect(info.hint).assertEqual(hint);
      expect(info.status).assertEqual(ProbeStatus.LIMIT_EXCEEDED);
      expect(formatError('探测', code, 'raw-32390202')).assertEqual('探测失败（32390202）：raw-32390202');
      expect(describeThrown('探测', code, 'raw-32390202')).assertEqual(`探测失败（32390202）：raw-32390202；${hint}`);
      expect(outcome.describe()).assertEqual('探测失败（32390202）：raw-32390202');
      expect(outcome.status).assertEqual(ProbeStatus.LIMIT_EXCEEDED);
      expect(outcome.hint()).assertEqual(hint);
      expect(outcome.succeeded()).assertFalse();
      expect(codeOfThrown(new MessageOnlyError(`BusinessError ${code}: raw`))).assertEqual(code);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_ERRX_1600
     * @tc.name testErrCross0016
     * @tc.desc Verify code 32390203 maps to DUPLICATE_NAME with one hint across every error formatter.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testErrCross0016', 0, () => {
      const code = 32390203;
      const outcome = new ProbeOutcome('探测', code, 'raw-32390203');
      const info = errorInfo(code, 'raw-32390203');
      const hint = distributedErrorHint(code);
      expect(classifyErrorCode(code)).assertEqual(ProbeStatus.DUPLICATE_NAME);
      expect(probeStatusName(classifyErrorCode(code))).assertEqual('服务名重复');
      expect(hint.includes('同名服务已存在')).assertTrue();
      expect(isKnownDistributedCode(code)).assertTrue();
      expect(info.describe()).assertEqual('[32390203] raw-32390203');
      expect(info.hint).assertEqual(hint);
      expect(info.status).assertEqual(ProbeStatus.DUPLICATE_NAME);
      expect(formatError('探测', code, 'raw-32390203')).assertEqual('探测失败（32390203）：raw-32390203');
      expect(describeThrown('探测', code, 'raw-32390203')).assertEqual(`探测失败（32390203）：raw-32390203；${hint}`);
      expect(outcome.describe()).assertEqual('探测失败（32390203）：raw-32390203');
      expect(outcome.status).assertEqual(ProbeStatus.DUPLICATE_NAME);
      expect(outcome.hint()).assertEqual(hint);
      expect(outcome.succeeded()).assertFalse();
      expect(codeOfThrown(new MessageOnlyError(`BusinessError ${code}: raw`))).assertEqual(code);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_ERRX_1700
     * @tc.name testErrCross0017
     * @tc.desc Verify code 32390204 maps to LIMIT_EXCEEDED with one hint across every error formatter.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testErrCross0017', 0, () => {
      const code = 32390204;
      const outcome = new ProbeOutcome('探测', code, 'raw-32390204');
      const info = errorInfo(code, 'raw-32390204');
      const hint = distributedErrorHint(code);
      expect(classifyErrorCode(code)).assertEqual(ProbeStatus.LIMIT_EXCEEDED);
      expect(probeStatusName(classifyErrorCode(code))).assertEqual('数量超限');
      expect(hint.includes('连接数量超过上限')).assertTrue();
      expect(isKnownDistributedCode(code)).assertTrue();
      expect(info.describe()).assertEqual('[32390204] raw-32390204');
      expect(info.hint).assertEqual(hint);
      expect(info.status).assertEqual(ProbeStatus.LIMIT_EXCEEDED);
      expect(formatError('探测', code, 'raw-32390204')).assertEqual('探测失败（32390204）：raw-32390204');
      expect(describeThrown('探测', code, 'raw-32390204')).assertEqual(`探测失败（32390204）：raw-32390204；${hint}`);
      expect(outcome.describe()).assertEqual('探测失败（32390204）：raw-32390204');
      expect(outcome.status).assertEqual(ProbeStatus.LIMIT_EXCEEDED);
      expect(outcome.hint()).assertEqual(hint);
      expect(outcome.succeeded()).assertFalse();
      expect(codeOfThrown(new MessageOnlyError(`BusinessError ${code}: raw`))).assertEqual(code);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_ERRX_1800
     * @tc.name testErrCross0018
     * @tc.desc Verify code 32390205 maps to NOT_READY with one hint across every error formatter.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testErrCross0018', 0, () => {
      const code = 32390205;
      const outcome = new ProbeOutcome('探测', code, 'raw-32390205');
      const info = errorInfo(code, 'raw-32390205');
      const hint = distributedErrorHint(code);
      expect(classifyErrorCode(code)).assertEqual(ProbeStatus.NOT_READY);
      expect(probeStatusName(classifyErrorCode(code))).assertEqual('连接未就绪');
      expect(hint.includes('连接尚未就绪')).assertTrue();
      expect(isKnownDistributedCode(code)).assertTrue();
      expect(info.describe()).assertEqual('[32390205] raw-32390205');
      expect(info.hint).assertEqual(hint);
      expect(info.status).assertEqual(ProbeStatus.NOT_READY);
      expect(formatError('探测', code, 'raw-32390205')).assertEqual('探测失败（32390205）：raw-32390205');
      expect(describeThrown('探测', code, 'raw-32390205')).assertEqual(`探测失败（32390205）：raw-32390205；${hint}`);
      expect(outcome.describe()).assertEqual('探测失败（32390205）：raw-32390205');
      expect(outcome.status).assertEqual(ProbeStatus.NOT_READY);
      expect(outcome.hint()).assertEqual(hint);
      expect(outcome.succeeded()).assertFalse();
      expect(codeOfThrown(new MessageOnlyError(`BusinessError ${code}: raw`))).assertEqual(code);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_ERRX_1900
     * @tc.name testErrCross0019
     * @tc.desc Verify code 32390206 maps to INVALID_PARAM with one hint across every error formatter.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testErrCross0019', 0, () => {
      const code = 32390206;
      const outcome = new ProbeOutcome('探测', code, 'raw-32390206');
      const info = errorInfo(code, 'raw-32390206');
      const hint = distributedErrorHint(code);
      expect(classifyErrorCode(code)).assertEqual(ProbeStatus.INVALID_PARAM);
      expect(probeStatusName(classifyErrorCode(code))).assertEqual('参数无效');
      expect(hint.includes('入参无效，检查服务名（不超过 255 字节）与 deviceId')).assertTrue();
      expect(isKnownDistributedCode(code)).assertTrue();
      expect(info.describe()).assertEqual('[32390206] raw-32390206');
      expect(info.hint).assertEqual(hint);
      expect(info.status).assertEqual(ProbeStatus.INVALID_PARAM);
      expect(formatError('探测', code, 'raw-32390206')).assertEqual('探测失败（32390206）：raw-32390206');
      expect(describeThrown('探测', code, 'raw-32390206')).assertEqual(`探测失败（32390206）：raw-32390206；${hint}`);
      expect(outcome.describe()).assertEqual('探测失败（32390206）：raw-32390206');
      expect(outcome.status).assertEqual(ProbeStatus.INVALID_PARAM);
      expect(outcome.hint()).assertEqual(hint);
      expect(outcome.succeeded()).assertFalse();
      expect(codeOfThrown(new MessageOnlyError(`BusinessError ${code}: raw`))).assertEqual(code);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_ERRX_2000
     * @tc.name testErrCross0020
     * @tc.desc Verify code 32390300 maps to INTERNAL with one hint across every error formatter.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testErrCross0020', 0, () => {
      const code = 32390300;
      const outcome = new ProbeOutcome('探测', code, 'raw-32390300');
      const info = errorInfo(code, 'raw-32390300');
      const hint = distributedErrorHint(code);
      expect(classifyErrorCode(code)).assertEqual(ProbeStatus.INTERNAL);
      expect(probeStatusName(classifyErrorCode(code))).assertEqual('内部错误');
      expect(hint.includes('链路增强内部错误')).assertTrue();
      expect(isKnownDistributedCode(code)).assertTrue();
      expect(info.describe()).assertEqual('[32390300] raw-32390300');
      expect(info.hint).assertEqual(hint);
      expect(info.status).assertEqual(ProbeStatus.INTERNAL);
      expect(formatError('探测', code, 'raw-32390300')).assertEqual('探测失败（32390300）：raw-32390300');
      expect(describeThrown('探测', code, 'raw-32390300')).assertEqual(`探测失败（32390300）：raw-32390300；${hint}`);
      expect(outcome.describe()).assertEqual('探测失败（32390300）：raw-32390300');
      expect(outcome.status).assertEqual(ProbeStatus.INTERNAL);
      expect(outcome.hint()).assertEqual(hint);
      expect(outcome.succeeded()).assertFalse();
      expect(codeOfThrown(new MessageOnlyError(`BusinessError ${code}: raw`))).assertEqual(code);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_ERRX_2100
     * @tc.name testErrCross0021
     * @tc.desc Verify unregistered codes inside the documented ranges are known yet fall back to FAILED.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testErrCross0021', 0, () => {
      const codes: number[] = [32390003, 32390005, 32390007, 32390099, 32390250, 32390299];
      let known = 0;
      for (const code of codes) {
        expect(classifyErrorCode(code)).assertEqual(ProbeStatus.FAILED);
        expect(distributedErrorHint(code)).assertEqual(DEFAULT_HINT);
        known += isKnownDistributedCode(code) ? 1 : 0;
      }
      expect(known).assertEqual(codes.length);
      expect(errorInfo(32390003, '').describe()).assertEqual('[32390003] 未知错误');
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_ERRX_2200
     * @tc.name testErrCross0022
     * @tc.desc Verify codes just outside both documented ranges are unknown and fall back to FAILED.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testErrCross0022', 0, () => {
      const codes: number[] = [32390000, 32390105, 32390150, 32390199, 32390301, 200, 202, 400, 402, 800, 802, 1];
      let unknown = 0;
      for (const code of codes) {
        expect(classifyErrorCode(code)).assertEqual(ProbeStatus.FAILED);
        expect(probeStatusName(classifyErrorCode(code))).assertEqual('操作失败');
        unknown += isKnownDistributedCode(code) ? 0 : 1;
      }
      expect(unknown).assertEqual(codes.length);
      expect(distributedErrorHint(32390150)).assertEqual(DEFAULT_HINT);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_ERRX_2300
     * @tc.name testErrCross0023
     * @tc.desc Verify zero and negative codes classify as IDLE and format without a bracketed code.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testErrCross0023', 0, () => {
      const codes: number[] = [0, -1, -2, -100];
      for (const code of codes) {
        expect(classifyErrorCode(code)).assertEqual(ProbeStatus.IDLE);
        expect(probeStatusName(classifyErrorCode(code))).assertEqual('未探测');
        expect(distributedErrorHint(code)).assertEqual('操作已正常完成');
        expect(errorInfo(code, 'm').describe()).assertEqual('m');
        expect(formatError('探测', code, 'm')).assertEqual('探测失败：m');
        expect(isKnownDistributedCode(code)).assertFalse();
      }
      expect(describeThrown('探测', 0, '')).assertEqual('探测失败：未知错误；操作已正常完成');
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_ERRX_2400
     * @tc.name testErrCross0024
     * @tc.desc Verify the local guard outcome reads as not executed and points to the previous step.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testErrCross0024', 0, () => {
      const outcome = new ProbeOutcome('start', LOCAL_GUARD_CODE, '尚未创建服务端');
      expect(outcome.status).assertEqual(ProbeStatus.IDLE);
      expect(outcome.describe()).assertEqual('start未执行：尚未创建服务端');
      expect(outcome.hint()).assertEqual('按顺序完成前一步再调用该接口');
      expect(outcome.succeeded()).assertFalse();
      expect(new ProbeOutcome('start', LOCAL_GUARD_CODE, '').message).assertEqual('未知结果');
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_ERRX_2500
     * @tc.name testErrCross0025
     * @tc.desc Verify the thrown outcome picks the permission hint only when its message mentions permission.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testErrCross0025', 0, () => {
      const denied = new ProbeOutcome('createServer', LOCAL_THROWN_CODE, 'Permission verification failed.');
      const upper = new ProbeOutcome('createServer', LOCAL_THROWN_CODE, 'PERMISSION DENIED');
      const other = new ProbeOutcome('createServer', LOCAL_THROWN_CODE, 'napi assert failed');
      expect(denied.hint()).assertEqual(PERMISSION_THROWN_HINT);
      expect(upper.hint()).assertEqual(PERMISSION_THROWN_HINT);
      expect(other.hint()).assertEqual('系统接口抛出异常但未携带数字错误码，查看 hilog 中的原始描述');
      expect(denied.describe()).assertEqual('createServer失败（-2）：Permission verification failed.');
      expect(denied.status).assertEqual(ProbeStatus.IDLE);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_ERRX_2600
     * @tc.name testErrCross0026
     * @tc.desc Verify a zero code outcome is a success with the completed hint and a default message.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testErrCross0026', 0, () => {
      const ok = new ProbeOutcome('connect', 0, '已发起连接');
      const blank = new ProbeOutcome('connect', 0, '');
      expect(ok.succeeded()).assertTrue();
      expect(ok.describe()).assertEqual('connect成功：已发起连接');
      expect(ok.hint()).assertEqual('操作已正常完成');
      expect(blank.message).assertEqual('未知结果');
      expect(blank.describe()).assertEqual('connect成功：未知结果');
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_ERRX_2700
     * @tc.name testErrCross0027
     * @tc.desc Verify empty messages fall back to the unknown error text for every formatter.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testErrCross0027', 0, () => {
      expect(errorInfo(201, '').message).assertEqual('未知错误');
      expect(errorInfo(0, '').describe()).assertEqual('未知错误');
      expect(formatError('发送', 32390104, '')).assertEqual('发送失败（32390104）：未知错误');
      expect(formatError('发送', -1, '')).assertEqual('发送失败：未知错误');
      expect(new ErrorInfo(801, '', 'h').hint).assertEqual('h');
      expect(new ErrorInfo(801, '', 'h').describe()).assertEqual('[801] 未知错误');
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_ERRX_2800
     * @tc.name testErrCross0028
     * @tc.desc Verify the registered codes cover fourteen distinct statuses and never produce READY or IDLE.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testErrCross0028', 0, () => {
      const codes: number[] = REGISTERED_CODES;
      const statuses = new Set<number>();
      for (const code of codes) {
        statuses.add(classifyErrorCode(code));
      }
      expect(codes.length).assertEqual(20);
      expect(statuses.size).assertEqual(14);
      expect(statuses.has(ProbeStatus.READY)).assertFalse();
      expect(statuses.has(ProbeStatus.IDLE)).assertFalse();
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_ERRX_2900
     * @tc.name testErrCross0029
     * @tc.desc Verify all sixteen status names are distinct while only IDLE and FAILED share a hint.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testErrCross0029', 0, () => {
      const names = new Set<string>();
      const hints = new Set<string>();
      for (const status of ALL_STATUSES) {
        names.add(probeStatusName(status));
        hints.add(probeStatusHint(status));
      }
      expect(ALL_STATUSES.length).assertEqual(16);
      expect(names.size).assertEqual(16);
      expect(hints.size).assertEqual(15);
      expect(probeStatusHint(ProbeStatus.IDLE)).assertEqual(probeStatusHint(ProbeStatus.FAILED));
      expect(probeStatusName(ProbeStatus.READY)).assertEqual('可用');
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_ERRX_3000
     * @tc.name testErrCross0030
     * @tc.desc Verify every registered code owns a distinct hint text and none is the default fallback.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testErrCross0030', 0, () => {
      const codes: number[] = REGISTERED_CODES;
      const hints = new Set<string>();
      for (const code of codes) {
        hints.add(distributedErrorHint(code));
      }
      expect(hints.size).assertEqual(codes.length);
      expect(hints.has(DEFAULT_HINT)).assertFalse();
      expect(hints.has('操作已正常完成')).assertFalse();
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_ERRX_3100
     * @tc.name testErrCross0031
     * @tc.desc Verify the two invalid parameter codes share a status but keep family specific hints.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testErrCross0031', 0, () => {
      const link = distributedErrorHint(32390206);
      const channel = distributedErrorHint(32390006);
      expect(classifyErrorCode(32390206)).assertEqual(classifyErrorCode(32390006));
      expect(classifyErrorCode(401)).assertEqual(ProbeStatus.INVALID_PARAM);
      expect(link === channel).assertFalse();
      expect(link.includes('deviceId')).assertTrue();
      expect(channel.includes('UUID')).assertTrue();
    });
  });
}
