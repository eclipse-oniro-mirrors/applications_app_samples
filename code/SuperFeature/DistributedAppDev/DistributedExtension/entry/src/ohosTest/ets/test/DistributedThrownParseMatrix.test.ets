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
import {
  codeOfThrown, describeThrown, errorInfo, formatError, isKnownDistributedCode, messageOfThrown
} from '../../../main/ets/utils/ErrorUtil';
import { LOCAL_THROWN_CODE, ProbeOutcome } from '../../../main/ets/utils/DistributedProbe';
import { ProbeStatus, classifyErrorCode } from '../../../main/ets/model/ProbeState';

/** 真机上 linkEnhance 在未授权时抛出的原文（code 字段是字符串 '201'，message 里没有数字） */
const LINK_DENIED_MESSAGE: string =
  'Permission verification failed. The application does not have the permission required to call the API.';

/** 真机上 proxyChannelManager 对无效 channelId 抛出的原文 */
const CHANNEL_INVALID_MESSAGE: string = 'BusinessError 32390004: ChannelId is invalid or unavailable';

const PERMISSION_THROWN_HINT: string =
  '系统以权限校验为由拒绝调用，先在首页授予 DISTRIBUTED_DATASYNC / ACCESS_BLUETOOTH 再重试';

class NumericCodeError {
  public code: number;
  public message: string;

  constructor(code: number, message: string) {
    this.code = code;
    this.message = message;
  }
}

/** code 是字符串：与真机 linkEnhance 抛出的对象同形 */
class StringCodeError {
  public code: string;
  public message: string;

  constructor(code: string, message: string) {
    this.code = code;
    this.message = message;
  }
}

class MessageOnlyError {
  public message: string;

  constructor(message: string) {
    this.message = message;
  }
}

class NameOnlyError {
  public name: string;

  constructor(name: string) {
    this.name = name;
  }
}

/** message 不是字符串、name 为空：两个字段都不可用，只能退回字符串化 */
class OpaqueError {
  public message: number = 42;
  public name: string = '';
}

class EmptyThrown {
}

class TextThrown {
  toString(): string {
    return 'custom thrown';
  }
}

/** 与 LinkRunner / ChannelRunner 内部 fail 分支相同的折算：取不到正数码时记为 LOCAL_THROWN_CODE */
function outcomeOf(action: string, err: Object): ProbeOutcome {
  const raw = codeOfThrown(err);
  return new ProbeOutcome(action, raw > 0 ? raw : LOCAL_THROWN_CODE, messageOfThrown(err));
}

/**
 * 异常解析（分）：把 catch 到的对象按"数字 code / 字符串 code / 只有 message / 只有 name / 什么都没有"
 * 五种形态拆开，再对 message 里的数字提取规则做多段、前导零、全角、超长等边界穷举，
 * 最后把同一个异常折算成 ProbeOutcome、ErrorInfo 与页面文案，核对三条出口一致。
 */
export default function distributedThrownParseMatrixTest() {
  describe('DistributedThrownParseMatrixTest', () => {
    // 每 10 条用例让出一次主线程，避免整批串跑触发 THREAD_BLOCK_6S（见 TestTick.ets）
    beforeEachIt(async () => {
      await tick();
    });
    /**
     * @tc.number SUB_DISTRIBUTED_EXT_THROWN_0100
     * @tc.name testThrown0001
     * @tc.desc Verify a numeric code field wins over any number written in the message.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testThrown0001', 0, () => {
      expect(codeOfThrown(new NumericCodeError(201, 'BusinessError 801: x'))).assertEqual(201);
      expect(codeOfThrown(new NumericCodeError(32390004, ''))).assertEqual(32390004);
      expect(codeOfThrown(new NumericCodeError(0, 'BusinessError 201: x'))).assertEqual(0);
      expect(codeOfThrown(new NumericCodeError(-5, 'BusinessError 201: x'))).assertEqual(-5);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_THROWN_0200
     * @tc.name testThrown0002
     * @tc.desc Verify a string code field is ignored and the code comes from the message text.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testThrown0002', 0, () => {
      expect(codeOfThrown(new StringCodeError('201', LINK_DENIED_MESSAGE))).assertEqual(0);
      expect(codeOfThrown(new StringCodeError('32390004', CHANNEL_INVALID_MESSAGE))).assertEqual(32390004);
      expect(codeOfThrown(new StringCodeError('201', 'BusinessError 801: other'))).assertEqual(801);
      expect(messageOfThrown(new StringCodeError('201', LINK_DENIED_MESSAGE))).assertEqual(LINK_DENIED_MESSAGE);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_THROWN_0300
     * @tc.name testThrown0003
     * @tc.desc Verify the first run of three or more digits is taken from a message only error.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testThrown0003', 0, () => {
      expect(codeOfThrown(new MessageOnlyError('BusinessError 201: Permission denied.'))).assertEqual(201);
      expect(codeOfThrown(new MessageOnlyError('e 12 345'))).assertEqual(345);
      expect(codeOfThrown(new MessageOnlyError('ab12cd3456'))).assertEqual(3456);
      expect(codeOfThrown(new MessageOnlyError('12 34 567 89012'))).assertEqual(567);
      expect(codeOfThrown(new MessageOnlyError('a1b22c333'))).assertEqual(333);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_THROWN_0400
     * @tc.name testThrown0004
     * @tc.desc Verify leading zeros, short runs, empty text and a trailing run of digits.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testThrown0004', 0, () => {
      expect(codeOfThrown(new MessageOnlyError('0123'))).assertEqual(123);
      expect(codeOfThrown(new MessageOnlyError('00'))).assertEqual(0);
      expect(codeOfThrown(new MessageOnlyError(''))).assertEqual(0);
      expect(codeOfThrown(new MessageOnlyError('999'))).assertEqual(999);
      expect(codeOfThrown(new MessageOnlyError('v1.2.345'))).assertEqual(345);
      expect(codeOfThrown(new MessageOnlyError('code=000'))).assertEqual(0);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_THROWN_0500
     * @tc.name testThrown0005
     * @tc.desc Verify full width digits are not treated as a code and long runs are kept whole.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testThrown0005', 0, () => {
      expect(codeOfThrown(new MessageOnlyError('错误码 １２３'))).assertEqual(0);
      expect(codeOfThrown(new MessageOnlyError('错误码 32390101，请重试'))).assertEqual(32390101);
      expect(codeOfThrown(new MessageOnlyError('1234567890123'))).assertEqual(1234567890123);
      expect(codeOfThrown(new MessageOnlyError(LINK_DENIED_MESSAGE))).assertEqual(0);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_THROWN_0600
     * @tc.name testThrown0006
     * @tc.desc Verify a 20 code sweep written as BusinessError text is parsed back exactly.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testThrown0006', 0, () => {
      const codes: number[] = [
        201, 401, 801, 32390001, 32390002, 32390004, 32390006, 32390100, 32390101, 32390102, 32390103,
        32390104, 32390200, 32390201, 32390202, 32390203, 32390204, 32390205, 32390206, 32390300
      ];
      let wrong = 0;
      for (const code of codes) {
        wrong += codeOfThrown(new MessageOnlyError(`BusinessError ${code}: text 12`)) === code ? 0 : 1;
        wrong += codeOfThrown(new StringCodeError(`${code}`, `BusinessError ${code}: x`)) === code ? 0 : 1;
      }
      expect(codes.length).assertEqual(20);
      expect(wrong).assertEqual(0);
      expect(codeOfThrown(new MessageOnlyError('[32390203] dup'))).assertEqual(32390203);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_THROWN_0700
     * @tc.name testThrown0007
     * @tc.desc Verify objects without a usable message report code zero.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testThrown0007', 0, () => {
      expect(codeOfThrown(new NameOnlyError('BusinessError 201'))).assertEqual(0);
      expect(codeOfThrown(new OpaqueError())).assertEqual(0);
      expect(codeOfThrown(new EmptyThrown())).assertEqual(0);
      expect(codeOfThrown(new TextThrown())).assertEqual(0);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_THROWN_0800
     * @tc.name testThrown0008
     * @tc.desc Verify messageOfThrown prefers message, then name, then the string form.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testThrown0008', 0, () => {
      expect(messageOfThrown(new MessageOnlyError('boom'))).assertEqual('boom');
      expect(messageOfThrown(new NameOnlyError('TypeError'))).assertEqual('TypeError');
      expect(messageOfThrown(new OpaqueError())).assertEqual('[object Object]');
      expect(messageOfThrown(new EmptyThrown())).assertEqual('[object Object]');
      expect(messageOfThrown(new TextThrown())).assertEqual('custom thrown');
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_THROWN_0900
     * @tc.name testThrown0009
     * @tc.desc Verify an empty message falls through to the name and an empty name to the string form.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testThrown0009', 0, () => {
      expect(messageOfThrown(new MessageOnlyError(''))).assertEqual('[object Object]');
      expect(messageOfThrown(new NameOnlyError(''))).assertEqual('[object Object]');
      expect(messageOfThrown(new NumericCodeError(201, ''))).assertEqual('[object Object]');
      expect(messageOfThrown(new StringCodeError('201', 'x'))).assertEqual('x');
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_THROWN_1000
     * @tc.name testThrown0010
     * @tc.desc Verify a built in Error is parsed from its message and falls back to its name.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testThrown0010', 0, () => {
      const denied = new Error('BusinessError 201: Permission denied.');
      const blank = new Error('');
      expect(codeOfThrown(denied)).assertEqual(201);
      expect(messageOfThrown(denied)).assertEqual('BusinessError 201: Permission denied.');
      expect(codeOfThrown(blank)).assertEqual(0);
      expect(messageOfThrown(blank)).assertEqual('Error');
      expect(messageOfThrown(new TypeError(''))).assertEqual('TypeError');
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_THROWN_1100
     * @tc.name testThrown0011
     * @tc.desc Verify the device shaped link denial folds into a thrown outcome with the permission hint.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testThrown0011', 0, () => {
      const outcome = outcomeOf('createServer', new StringCodeError('201', LINK_DENIED_MESSAGE));
      expect(outcome.code).assertEqual(LOCAL_THROWN_CODE);
      expect(outcome.status).assertEqual(ProbeStatus.IDLE);
      expect(outcome.succeeded()).assertFalse();
      expect(outcome.hint()).assertEqual(PERMISSION_THROWN_HINT);
      expect(outcome.describe()).assertEqual(`createServer失败（-2）：${LINK_DENIED_MESSAGE}`);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_THROWN_1200
     * @tc.name testThrown0012
     * @tc.desc Verify the device shaped invalid channel error folds into a coded outcome.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testThrown0012', 0, () => {
      const outcome = outcomeOf('closeProxyChannel', new StringCodeError('32390004', CHANNEL_INVALID_MESSAGE));
      expect(outcome.code).assertEqual(32390004);
      expect(outcome.status).assertEqual(ProbeStatus.CHANNEL_INVALID);
      expect(outcome.hint()).assertEqual('channelId 已失效或不存在，重新 openProxyChannel');
      expect(outcome.describe()).assertEqual(`closeProxyChannel失败（32390004）：${CHANNEL_INVALID_MESSAGE}`);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_THROWN_1300
     * @tc.name testThrown0013
     * @tc.desc Verify zero and negative numeric codes are folded into the local thrown code.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testThrown0013', 0, () => {
      expect(outcomeOf('x', new NumericCodeError(0, 'BusinessError 201: y')).code).assertEqual(LOCAL_THROWN_CODE);
      expect(outcomeOf('x', new NumericCodeError(-5, 'z')).code).assertEqual(LOCAL_THROWN_CODE);
      expect(outcomeOf('x', new EmptyThrown()).code).assertEqual(LOCAL_THROWN_CODE);
      expect(outcomeOf('x', new EmptyThrown()).message).assertEqual('[object Object]');
      expect(outcomeOf('x', new NumericCodeError(801, '')).code).assertEqual(801);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_THROWN_1400
     * @tc.name testThrown0014
     * @tc.desc Verify the thrown hint is chosen by a case insensitive permission word in the message.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testThrown0014', 0, () => {
      const generic = '系统接口抛出异常但未携带数字错误码，查看 hilog 中的原始描述';
      expect(outcomeOf('a', new MessageOnlyError('PERMISSION denied')).hint()).assertEqual(PERMISSION_THROWN_HINT);
      expect(outcomeOf('a', new MessageOnlyError('no Permission')).hint()).assertEqual(PERMISSION_THROWN_HINT);
      expect(outcomeOf('a', new MessageOnlyError('permit')).hint()).assertEqual(generic);
      expect(outcomeOf('a', new NameOnlyError('Permission')).hint()).assertEqual(PERMISSION_THROWN_HINT);
      expect(outcomeOf('a', new EmptyThrown()).hint()).assertEqual(generic);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_THROWN_1500
     * @tc.name testThrown0015
     * @tc.desc Verify a message carrying permission and a code takes the code path instead.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testThrown0015', 0, () => {
      const outcome = outcomeOf('open', new MessageOnlyError('BusinessError 201: Permission denied.'));
      expect(outcome.code).assertEqual(201);
      expect(outcome.status).assertEqual(ProbeStatus.PERMISSION_DENIED);
      expect(outcome.hint().startsWith('缺少 ohos.permission.DISTRIBUTED_DATASYNC')).assertTrue();
      expect(outcome.hint() === PERMISSION_THROWN_HINT).assertFalse();
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_THROWN_1600
     * @tc.name testThrown0016
     * @tc.desc Verify one thrown object gives the same code to ErrorInfo, formatError and describeThrown.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testThrown0016', 0, () => {
      const err = new MessageOnlyError('BusinessError 32390203: duplicated');
      const code = codeOfThrown(err);
      const message = messageOfThrown(err);
      const info = errorInfo(code, message);
      expect(info.describe()).assertEqual('[32390203] BusinessError 32390203: duplicated');
      expect(info.status).assertEqual(ProbeStatus.DUPLICATE_NAME);
      expect(formatError('createServer', code, message)).assertEqual(
        'createServer失败（32390203）：BusinessError 32390203: duplicated');
      expect(describeThrown('createServer', code, message).endsWith('同名服务已存在，换一个服务名或先关闭已有服务'))
        .assertTrue();
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_THROWN_1700
     * @tc.name testThrown0017
     * @tc.desc Verify a codeless thrown object formats without brackets and with the completed hint.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testThrown0017', 0, () => {
      const err = new StringCodeError('201', LINK_DENIED_MESSAGE);
      const code = codeOfThrown(err);
      expect(errorInfo(code, messageOfThrown(err)).describe()).assertEqual(LINK_DENIED_MESSAGE);
      expect(formatError('createServer', code, messageOfThrown(err))).assertEqual(
        `createServer失败：${LINK_DENIED_MESSAGE}`);
      expect(describeThrown('createServer', code, '').endsWith('；操作已正常完成')).assertTrue();
      expect(classifyErrorCode(code)).assertEqual(ProbeStatus.IDLE);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_THROWN_1800
     * @tc.name testThrown0018
     * @tc.desc Verify a five shape by four text grid always yields a code that is zero or known or parsed.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testThrown0018', 0, () => {
      const texts: string[] = ['BusinessError 201: a', 'BusinessError 32390006: b', 'no digits', ''];
      let combos = 0;
      let known = 0;
      let zero = 0;
      for (const text of texts) {
        const shapes: Object[] = [
          new MessageOnlyError(text), new StringCodeError('1', text), new NameOnlyError(text),
          new NumericCodeError(0, text), new Error(text)
        ];
        for (const shape of shapes) {
          const code = codeOfThrown(shape);
          known += isKnownDistributedCode(code) ? 1 : 0;
          zero += code === 0 ? 1 : 0;
          combos++;
        }
      }
      expect(combos).assertEqual(20);
      expect(known).assertEqual(6);
      expect(zero).assertEqual(14);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_THROWN_1900
     * @tc.name testThrown0019
     * @tc.desc Verify the message grid falls back in order for the same five shapes.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testThrown0019', 0, () => {
      const shapes: Object[] = [
        new MessageOnlyError('m'), new StringCodeError('1', 'm'), new NameOnlyError('n'), new NumericCodeError(1, ''),
        new Error('m'), new Error('')
      ];
      const messages: string[] = [];
      for (const shape of shapes) {
        messages.push(messageOfThrown(shape));
      }
      expect(messages.join('|')).assertEqual('m|m|n|[object Object]|m|Error');
      expect(messages.length).assertEqual(6);
      expect(messageOfThrown(new TextThrown()).length).assertEqual(13);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_THROWN_2000
     * @tc.name testThrown0020
     * @tc.desc Verify a real exception caught from JSON.parse is parsed without a code.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testThrown0020', 0, () => {
      let caught: Object = new EmptyThrown();
      try {
        JSON.parse('{bad json');
      } catch (err) {
        caught = err as Object;
      }
      const outcome = outcomeOf('parse', caught);
      expect(caught instanceof EmptyThrown).assertFalse();
      expect(messageOfThrown(caught).length > 0).assertTrue();
      expect(outcome.code).assertEqual(LOCAL_THROWN_CODE);
      expect(outcome.describe().startsWith('parse失败（-2）：')).assertTrue();
    });
  });
}
