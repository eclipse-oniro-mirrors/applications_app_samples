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
import { describe, it, expect, Level, Size, TestType } from '@ohos/hypium';
import { hilog } from '@kit.PerformanceAnalysisKit';
import call from '@ohos.telephony.call';

const DOMAIN: number = 0xF814;
const TAG: string = 'CallTelephonyStateTest';

function log(message: string): void {
  hilog.info(DOMAIN, TAG, '%{public}s', message);
}

export default function callTelephonyStateTest(): void {
  describe('CallTelephonyStateTest', () => {
    /**
     * @tc.number    SUB_CALL_TELEPHONYSTATE_0201
     * @tc.name      testCallTelephonyState0201
     * @tc.desc      Verify hasCall returns a boolean on an idle device.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testCallTelephonyState0201', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testCallTelephonyState0201 begin');
      const actual: boolean = await call.hasCall();
      expect(typeof actual).assertEqual('boolean');
      expect(actual === true || actual === false).assertTrue();
      expect(actual !== undefined).assertTrue();
      log('testCallTelephonyState0201 end');
    })

    /**
     * @tc.number    SUB_CALL_TELEPHONYSTATE_0202
     * @tc.name      testCallTelephonyState0202
     * @tc.desc      Verify repeated hasCall calls keep a consistent value.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testCallTelephonyState0202', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testCallTelephonyState0202 begin');
      const first: boolean = await call.hasCall();
      const second: boolean = await call.hasCall();
      expect(typeof first).assertEqual('boolean');
      expect(typeof second).assertEqual('boolean');
      expect(first === second).assertTrue();
      log('testCallTelephonyState0202 end');
    })

    /**
     * @tc.number    SUB_CALL_TELEPHONYSTATE_0203
     * @tc.name      testCallTelephonyState0203
     * @tc.desc      Verify getCallState returns a value inside the CallState enum range.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testCallTelephonyState0203', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testCallTelephonyState0203 begin');
      const actual: call.CallState = await call.getCallState();
      expect(typeof actual).assertEqual('number');
      expect(actual >= call.CallState.CALL_STATE_IDLE).assertTrue();
      expect(actual <= call.CallState.CALL_STATE_ANSWERED).assertTrue();
      log('testCallTelephonyState0203 end');
    })

    /**
     * @tc.number    SUB_CALL_TELEPHONYSTATE_0204
     * @tc.name      testCallTelephonyState0204
     * @tc.desc      Verify repeated getCallState calls keep a consistent value on an idle device.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testCallTelephonyState0204', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testCallTelephonyState0204 begin');
      const first: call.CallState = await call.getCallState();
      const second: call.CallState = await call.getCallState();
      expect(typeof first).assertEqual('number');
      expect(typeof second).assertEqual('number');
      expect(first === second).assertTrue();
      log('testCallTelephonyState0204 end');
    })

    /**
     * @tc.number    SUB_CALL_TELEPHONYSTATE_0205
     * @tc.name      testCallTelephonyState0205
     * @tc.desc      Verify hasCall false corresponds to the idle call state.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testCallTelephonyState0205', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testCallTelephonyState0205 begin');
      const hasCall: boolean = await call.hasCall();
      const state: call.CallState = await call.getCallState();
      expect(typeof hasCall).assertEqual('boolean');
      expect(typeof state).assertEqual('number');
      if (!hasCall) {
        expect(state === call.CallState.CALL_STATE_IDLE).assertTrue();
      }
      log('testCallTelephonyState0205 end');
    })

    /**
     * @tc.number    SUB_CALL_TELEPHONYSTATE_0206
     * @tc.name      testCallTelephonyState0206
     * @tc.desc      Verify hasCall in callback form reports no error and a boolean data.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testCallTelephonyState0206', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testCallTelephonyState0206 begin');
      const result: boolean[] = [];
      const done: Promise<void> = new Promise<void>((resolve: () => void) => {
        call.hasCall((err: Error, data: boolean) => {
          log('hasCall callback err=' + JSON.stringify(err) + ' data=' + JSON.stringify(data));
          result.push(data);
          resolve();
        })
      })
      await done;
      expect(result.length).assertEqual(1);
      expect(typeof result[0]).assertEqual('boolean');
      expect(result[0] === true || result[0] === false).assertTrue();
      log('testCallTelephonyState0206 end');
    })

    /**
     * @tc.number    SUB_CALL_TELEPHONYSTATE_0207
     * @tc.name      testCallTelephonyState0207
     * @tc.desc      Verify getCallState in callback form reports a value inside the enum range.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testCallTelephonyState0207', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testCallTelephonyState0207 begin');
      const result: call.CallState[] = [];
      const done: Promise<void> = new Promise<void>((resolve: () => void) => {
        call.getCallState((err: Error, data: call.CallState) => {
          log('getCallState callback err=' + JSON.stringify(err) + ' data=' + JSON.stringify(data));
          result.push(data);
          resolve();
        })
      })
      await done;
      expect(result.length).assertEqual(1);
      expect(typeof result[0]).assertEqual('number');
      expect(result[0] >= call.CallState.CALL_STATE_IDLE).assertTrue();
      log('testCallTelephonyState0207 end');
    })

    /**
     * @tc.number    SUB_CALL_TELEPHONYSTATE_0208
     * @tc.name      testCallTelephonyState0208
     * @tc.desc      Verify isEmergencyPhoneNumber in callback form detects 110.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testCallTelephonyState0208', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testCallTelephonyState0208 begin');
      const result: boolean[] = [];
      const done: Promise<void> = new Promise<void>((resolve: () => void) => {
        call.isEmergencyPhoneNumber('110', (err: Error, data: boolean) => {
          log('isEmergencyPhoneNumber callback err=' + JSON.stringify(err) + ' data=' + JSON.stringify(data));
          result.push(data);
          resolve();
        })
      })
      await done;
      expect(result.length).assertEqual(1);
      expect(result[0]).assertTrue();
      expect(typeof result[0]).assertEqual('boolean');
      log('testCallTelephonyState0208 end');
    })

    /**
     * @tc.number    SUB_CALL_TELEPHONYSTATE_0209
     * @tc.name      testCallTelephonyState0209
     * @tc.desc      Verify isEmergencyPhoneNumber in callback form rejects a normal number.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testCallTelephonyState0209', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testCallTelephonyState0209 begin');
      const result: boolean[] = [];
      const done: Promise<void> = new Promise<void>((resolve: () => void) => {
        call.isEmergencyPhoneNumber('13800138000', (err: Error, data: boolean) => {
          log('isEmergencyPhoneNumber callback err=' + JSON.stringify(err) + ' data=' + JSON.stringify(data));
          result.push(data);
          resolve();
        })
      })
      await done;
      expect(result.length).assertEqual(1);
      expect(result[0]).assertFalse();
      expect(typeof result[0]).assertEqual('boolean');
      log('testCallTelephonyState0209 end');
    })

    /**
     * @tc.number    SUB_CALL_TELEPHONYSTATE_0210
     * @tc.name      testCallTelephonyState0210
     * @tc.desc      Verify formatPhoneNumber in callback form groups a China mobile number.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testCallTelephonyState0210', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testCallTelephonyState0210 begin');
      const result: string[] = [];
      const done: Promise<void> = new Promise<void>((resolve: () => void) => {
        call.formatPhoneNumber('13800138000', (err: Error, data: string) => {
          log('formatPhoneNumber callback err=' + JSON.stringify(err) + ' data=' + JSON.stringify(data));
          result.push(data);
          resolve();
        })
      })
      await done;
      expect(result.length).assertEqual(1);
      expect(typeof result[0]).assertEqual('string');
      expect(result[0].length > 0).assertTrue();
      log('testCallTelephonyState0210 end');
    })

    /**
     * @tc.number    SUB_CALL_TELEPHONYSTATE_0211
     * @tc.name      testCallTelephonyState0211
     * @tc.desc      Verify formatPhoneNumberToE164 in callback form expands a China mobile number.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testCallTelephonyState0211', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testCallTelephonyState0211 begin');
      const result: string[] = [];
      const done: Promise<void> = new Promise<void>((resolve: () => void) => {
        call.formatPhoneNumberToE164('13800138000', 'CN', (err: Error, data: string) => {
          log('formatPhoneNumberToE164 callback err=' + JSON.stringify(err) + ' data=' + JSON.stringify(data));
          result.push(data);
          resolve();
        })
      })
      await done;
      expect(result.length).assertEqual(1);
      expect(result[0]).assertEqual('+8613800138000');
      expect(typeof result[0]).assertEqual('string');
      log('testCallTelephonyState0211 end');
    })

    /**
     * @tc.number    SUB_CALL_TELEPHONYSTATE_0212
     * @tc.name      testCallTelephonyState0212
     * @tc.desc      Verify interleaved promise and callback state queries keep consistent results.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testCallTelephonyState0212', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testCallTelephonyState0212 begin');
      const promiseState: call.CallState = await call.getCallState();
      const callbackState: call.CallState[] = [];
      const done: Promise<void> = new Promise<void>((resolve: () => void) => {
        call.getCallState((err: Error, data: call.CallState) => {
          callbackState.push(data);
          resolve();
        })
      })
      await done;
      expect(typeof promiseState).assertEqual('number');
      expect(callbackState.length).assertEqual(1);
      expect(promiseState === callbackState[0]).assertTrue();
      log('testCallTelephonyState0212 end');
    })

    /**
     * @tc.number    SUB_CALL_TELEPHONYSTATE_0213
     * @tc.name      testCallTelephonyState0213
     * @tc.desc      Verify hasCall remains stable after emergency number queries.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testCallTelephonyState0213', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testCallTelephonyState0213 begin');
      const before: boolean = await call.hasCall();
      const isEmergency: boolean = await call.isEmergencyPhoneNumber('110');
      const after: boolean = await call.hasCall();
      expect(before === after).assertTrue();
      expect(isEmergency).assertTrue();
      expect(typeof after).assertEqual('boolean');
      log('testCallTelephonyState0213 end');
    })

    /**
     * @tc.number    SUB_CALL_TELEPHONYSTATE_0214
     * @tc.name      testCallTelephonyState0214
     * @tc.desc      Verify getCallState stays inside the enum range after format queries.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testCallTelephonyState0214', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testCallTelephonyState0214 begin');
      const formatted: string = await call.formatPhoneNumber('13800138000');
      const state: call.CallState = await call.getCallState();
      expect(typeof formatted).assertEqual('string');
      expect(typeof state).assertEqual('number');
      expect(state >= call.CallState.CALL_STATE_IDLE).assertTrue();
      log('testCallTelephonyState0214 end');
    })
  })
}
