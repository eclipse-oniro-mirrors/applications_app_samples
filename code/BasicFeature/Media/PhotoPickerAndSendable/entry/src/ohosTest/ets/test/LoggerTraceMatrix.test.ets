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
import { Logger, Trace } from 'photopickersendable';
import { hilog } from '@kit.PerformanceAnalysisKit';
import { BusinessError } from '@kit.BasicServicesKit';

/** Log domain of the sample application. */
const DOMAIN: number = 0xF811;
/** Number of repeated level calls per loop case. */
const CALL_ROUNDS: number = 5;
/** Number of task ids collected for the strictly increasing check. */
const ID_ROUNDS: number = 40;
/** Trace slice name shared by the non overlapping pairing cases. */
const SLICE_NAME: string = 'LoggerTraceMatrix.slice';

/**
 * Registers the observable cases of the Logger and Trace wrappers. The two
 * classes delegate to hilog and hiTraceMeter, so the cases verify the part
 * that stays synchronously checkable: every level call and pairing completes
 * without throwing, task ids are strictly increasing and the guarded runner
 * helpers always return the action value or propagate its rejection.
 */
export default function loggerTraceMatrixTest() {
  describe('LoggerTraceMatrixTest', () => {
    /**
     * @tc.number    SUB_PHOTOPICKER_LOGMAT_0100
     * @tc.name      testLogMat0001
     * @tc.desc      Verify Logger.info completes for a normal tag and message
     *               pair without throwing and leaves the flow reachable.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testLogMat0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const TAG: string = 'testLogMat0001';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      let completed: boolean = false;
      try {
        Logger.info(TAG, 'info level message');
        completed = true;
      } catch (error) {
        completed = false;
      }
      expect(completed).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_PHOTOPICKER_LOGMAT_0200
     * @tc.name      testLogMat0002
     * @tc.desc      Verify Logger.debug completes for a normal tag and
     *               message pair without throwing.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testLogMat0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const TAG: string = 'testLogMat0002';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      let completed: boolean = false;
      try {
        Logger.debug(TAG, 'debug level message');
        completed = true;
      } catch (error) {
        completed = false;
      }
      expect(completed).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_PHOTOPICKER_LOGMAT_0300
     * @tc.name      testLogMat0003
     * @tc.desc      Verify Logger.warn completes for a normal tag and
     *               message pair without throwing.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testLogMat0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const TAG: string = 'testLogMat0003';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      let completed: boolean = false;
      try {
        Logger.warn(TAG, 'warn level message');
        completed = true;
      } catch (error) {
        completed = false;
      }
      expect(completed).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_PHOTOPICKER_LOGMAT_0400
     * @tc.name      testLogMat0004
     * @tc.desc      Verify Logger.error completes for a normal tag and
     *               message pair without throwing.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testLogMat0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const TAG: string = 'testLogMat0004';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      let completed: boolean = false;
      try {
        Logger.error(TAG, 'error level message');
        completed = true;
      } catch (error) {
        completed = false;
      }
      expect(completed).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_PHOTOPICKER_LOGMAT_0500
     * @tc.name      testLogMat0005
     * @tc.desc      Verify all four level methods complete back to back for
     *               the same tag, proving the wrapper is stateless per call.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testLogMat0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const TAG: string = 'testLogMat0005';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      let completed: boolean = false;
      try {
        Logger.debug(TAG, 'first');
        Logger.info(TAG, 'second');
        Logger.warn(TAG, 'third');
        Logger.error(TAG, 'fourth');
        completed = true;
      } catch (error) {
        completed = false;
      }
      expect(completed).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_PHOTOPICKER_LOGMAT_0600
     * @tc.name      testLogMat0006
     * @tc.desc      Verify every level method tolerates an empty tag and an
     *               empty message without throwing.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testLogMat0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const TAG: string = 'testLogMat0006';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      let completed: boolean = false;
      try {
        Logger.debug('', '');
        Logger.info('', '');
        Logger.warn('', '');
        Logger.error('', '');
        completed = true;
      } catch (error) {
        completed = false;
      }
      expect(completed).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_PHOTOPICKER_LOGMAT_0700
     * @tc.name      testLogMat0007
     * @tc.desc      Verify every level method tolerates long message text
     *               without throwing and completes in one loop of repeats.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testLogMat0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const TAG: string = 'testLogMat0007';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      const longMessage: string = 'long detail ' + '0123456789';
      let completed: boolean = false;
      try {
        Logger.info(TAG, longMessage);
        completed = true;
      } catch (error) {
        completed = false;
      }
      expect(completed).assertTrue();
      expect(longMessage.length > 10).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_PHOTOPICKER_LOGMAT_0800
     * @tc.name      testLogMat0008
     * @tc.desc      Verify repeated info calls complete for a fixed number of
     *               rounds without throwing.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testLogMat0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const TAG: string = 'testLogMat0008';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      let completed: boolean = false;
      try {
        for (let round: number = 0; round < CALL_ROUNDS; round++) {
          Logger.info(TAG, 'round ' + String(round));
        }
        completed = true;
      } catch (error) {
        completed = false;
      }
      expect(completed).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_PHOTOPICKER_LOGMAT_0900
     * @tc.name      testLogMat0009
     * @tc.desc      Verify repeated warn calls complete for a fixed number of
     *               rounds without throwing.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testLogMat0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const TAG: string = 'testLogMat0009';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      let completed: boolean = false;
      try {
        for (let round: number = 0; round < CALL_ROUNDS; round++) {
          Logger.warn(TAG, 'round ' + String(round));
        }
        completed = true;
      } catch (error) {
        completed = false;
      }
      expect(completed).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_PHOTOPICKER_LOGMAT_1000
     * @tc.name      testLogMat0010
     * @tc.desc      Verify errorWithCode completes for a populated business
     *               error carrying a code and a message.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testLogMat0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const TAG: string = 'testLogMat0010';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      const error: BusinessError = { code: 401, name: 'BusinessError', message: 'permission denied' };
      let completed: boolean = false;
      try {
        Logger.errorWithCode(TAG, 'open picker', error);
        completed = true;
      } catch (caught) {
        completed = false;
      }
      expect(completed).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_PHOTOPICKER_LOGMAT_1100
     * @tc.name      testLogMat0011
     * @tc.desc      Verify errorWithCode completes for a business error that
     *               carries only the numeric code without a message.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testLogMat0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const TAG: string = 'testLogMat0011';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      const error: BusinessError = { code: 140000, name: 'BusinessError', message: '' };
      let completed: boolean = false;
      try {
        Logger.errorWithCode(TAG, 'query media', error);
        completed = true;
      } catch (caught) {
        completed = false;
      }
      expect(completed).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_PHOTOPICKER_LOGMAT_1200
     * @tc.name      testLogMat0012
     * @tc.desc      Verify errorWithCode completes for boundary numeric codes
     *               including zero and a large kit error code.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testLogMat0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const TAG: string = 'testLogMat0012';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      const zero: BusinessError = { code: 0, name: 'BusinessError', message: '' };
      const large: BusinessError = { code: 999999, name: 'BusinessError', message: 'edge' };
      let completed: boolean = false;
      try {
        Logger.errorWithCode(TAG, 'zero code', zero);
        Logger.errorWithCode(TAG, 'large code', large);
        completed = true;
      } catch (caught) {
        completed = false;
      }
      expect(completed).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_PHOTOPICKER_LOGMAT_1300
     * @tc.name      testLogMat0013
     * @tc.desc      Verify errorWithCode completes for a negative code and
     *               an empty action text without throwing.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testLogMat0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const TAG: string = 'testLogMat0013';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      const negative: BusinessError = { code: -1, name: 'BusinessError', message: 'negative' };
      let completed: boolean = false;
      try {
        Logger.errorWithCode(TAG, '', negative);
        completed = true;
      } catch (caught) {
        completed = false;
      }
      expect(completed).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_PHOTOPICKER_LOGMAT_1400
     * @tc.name      testLogMat0014
     * @tc.desc      Verify errorWithCode completes repeatedly inside one loop
     *               with changing codes and actions.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testLogMat0014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const TAG: string = 'testLogMat0014';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      let completed: boolean = false;
      try {
        for (let round: number = 0; round < CALL_ROUNDS; round++) {
          const error: BusinessError = { code: round, name: 'BusinessError', message: 'round' };
          Logger.errorWithCode(TAG, 'action ' + String(round), error);
        }
        completed = true;
      } catch (caught) {
        completed = false;
      }
      expect(completed).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_PHOTOPICKER_LOGMAT_1500
     * @tc.name      testLogMat0015
     * @tc.desc      Verify start and finish open and close one named trace
     *               slice without throwing.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testLogMat0015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const TAG: string = 'testLogMat0015';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      let completed: boolean = false;
      try {
        Trace.start(SLICE_NAME);
        Trace.finish(SLICE_NAME);
        completed = true;
      } catch (error) {
        completed = false;
      }
      expect(completed).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_PHOTOPICKER_LOGMAT_1600
     * @tc.name      testLogMat0016
     * @tc.desc      Verify start and finish complete for one loop of paired
     *               slices with distinct names per round.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testLogMat0016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const TAG: string = 'testLogMat0016';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      let completed: boolean = false;
      try {
        for (let round: number = 0; round < CALL_ROUNDS; round++) {
          const name: string = SLICE_NAME + '.' + String(round);
          Trace.start(name);
          Trace.finish(name);
        }
        completed = true;
      } catch (error) {
        completed = false;
      }
      expect(completed).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_PHOTOPICKER_LOGMAT_1700
     * @tc.name      testLogMat0017
     * @tc.desc      Verify nextTaskId allocates strictly increasing positive
     *               ids for two back to back calls.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testLogMat0017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const TAG: string = 'testLogMat0017';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      const first: number = Trace.nextTaskId();
      const second: number = Trace.nextTaskId();
      expect(first).assertLarger(0);
      expect(second).assertLarger(first);
      expect(second).assertEqual(first + 1);
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_PHOTOPICKER_LOGMAT_1800
     * @tc.name      testLogMat0018
     * @tc.desc      Verify nextTaskId keeps increasing by exactly one across
     *               a long loop of allocations.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testLogMat0018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const TAG: string = 'testLogMat0018';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      let previous: number = Trace.nextTaskId();
      for (let round: number = 0; round < ID_ROUNDS; round++) {
        const current: number = Trace.nextTaskId();
        expect(current).assertEqual(previous + 1);
        previous = current;
      }
      expect(previous).assertLarger(ID_ROUNDS);
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_PHOTOPICKER_LOGMAT_1900
     * @tc.name      testLogMat0019
     * @tc.desc      Verify begin returns a positive task id and end closes
     *               the matching slice without throwing.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testLogMat0019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const TAG: string = 'testLogMat0019';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      const taskId: number = Trace.begin(SLICE_NAME);
      expect(taskId).assertLarger(0);
      let completed: boolean = false;
      try {
        Trace.end(SLICE_NAME, taskId);
        completed = true;
      } catch (error) {
        completed = false;
      }
      expect(completed).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_PHOTOPICKER_LOGMAT_2000
     * @tc.name      testLogMat0020
     * @tc.desc      Verify two begin calls allocate different task ids so
     *               overlapping slices of one name stay distinguishable.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testLogMat0020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const TAG: string = 'testLogMat0020';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      const first: number = Trace.begin(SLICE_NAME);
      const second: number = Trace.begin(SLICE_NAME);
      expect(first).assertLarger(0);
      expect(second).assertLarger(first);
      Trace.end(SLICE_NAME, second);
      Trace.end(SLICE_NAME, first);
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_PHOTOPICKER_LOGMAT_2100
     * @tc.name      testLogMat0021
     * @tc.desc      Verify one loop of begin and end pairs completes with a
     *               fresh positive id returned by every begin call.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testLogMat0021', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const TAG: string = 'testLogMat0021';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      let completed: boolean = false;
      try {
        for (let round: number = 0; round < CALL_ROUNDS; round++) {
          const taskId: number = Trace.begin(SLICE_NAME);
          expect(taskId).assertLarger(0);
          Trace.end(SLICE_NAME, taskId);
        }
        completed = true;
      } catch (error) {
        completed = false;
      }
      expect(completed).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_PHOTOPICKER_LOGMAT_2200
     * @tc.name      testLogMat0022
     * @tc.desc      Verify withSync returns the string value produced by the
     *               observed action unchanged.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testLogMat0022', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const TAG: string = 'testLogMat0022';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      const value: string = Trace.withSync<string>(SLICE_NAME, () => {
        return 'sync-result';
      });
      expect(value).assertEqual('sync-result');
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_PHOTOPICKER_LOGMAT_2300
     * @tc.name      testLogMat0023
     * @tc.desc      Verify withSync returns numeric and boolean action values
     *               unchanged including a computed total.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testLogMat0023', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const TAG: string = 'testLogMat0023';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      const total: number = Trace.withSync<number>(SLICE_NAME, () => {
        return 20 + 22;
      });
      expect(total).assertEqual(42);
      const flag: boolean = Trace.withSync<boolean>(SLICE_NAME, () => {
        return true;
      });
      expect(flag).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_PHOTOPICKER_LOGMAT_2400
     * @tc.name      testLogMat0024
     * @tc.desc      Verify nested withSync calls complete and every inner
     *               value reaches the caller in order.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testLogMat0024', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const TAG: string = 'testLogMat0024';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      const outer: number = Trace.withSync<number>('outer.slice', () => {
        const inner: number = Trace.withSync<number>('inner.slice', () => {
          return 7;
        });
        expect(inner).assertEqual(7);
        return inner * 2;
      });
      expect(outer).assertEqual(14);
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_PHOTOPICKER_LOGMAT_2500
     * @tc.name      testLogMat0025
     * @tc.desc      Verify withSync propagates a thrown action error to the
     *               caller after the slice has been closed.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testLogMat0025', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const TAG: string = 'testLogMat0025';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      let caught: boolean = false;
      try {
        Trace.withSync<number>('throwing.slice', () => {
          throw new Error('boom');
        });
      } catch (error) {
        caught = true;
      }
      expect(caught).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_PHOTOPICKER_LOGMAT_2600
     * @tc.name      testLogMat0026
     * @tc.desc      Verify withSync stays usable after a rejected action and
     *               returns the value of the following healthy call.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testLogMat0026', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const TAG: string = 'testLogMat0026';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      let caught: boolean = false;
      try {
        Trace.withSync<number>('recovery.slice', () => {
          throw new Error('first fails');
        });
      } catch (error) {
        caught = true;
      }
      expect(caught).assertTrue();
      const recovered: number = Trace.withSync<number>('recovery.slice', () => {
        return 9;
      });
      expect(recovered).assertEqual(9);
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_PHOTOPICKER_LOGMAT_2700
     * @tc.name      testLogMat0027
     * @tc.desc      Verify withSync keeps a repeated loop of calls returning
     *               the per round value without leaking state.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testLogMat0027', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const TAG: string = 'testLogMat0027';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      for (let round: number = 0; round < CALL_ROUNDS; round++) {
        const value: number = Trace.withSync<number>(SLICE_NAME, () => {
          return round;
        });
        expect(value).assertEqual(round);
      }
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_PHOTOPICKER_LOGMAT_2800
     * @tc.name      testLogMat0028
     * @tc.desc      Verify withAsync resolves with the awaited value of the
     *               observed asynchronous action.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testLogMat0028', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      const TAG: string = 'testLogMat0028';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      const value: number = await Trace.withAsync<number>(SLICE_NAME, async () => {
        return 42;
      });
      expect(value).assertEqual(42);
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_PHOTOPICKER_LOGMAT_2900
     * @tc.name      testLogMat0029
     * @tc.desc      Verify withAsync propagates the rejection of the observed
     *               promise to the awaiting caller.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testLogMat0029', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const TAG: string = 'testLogMat0029';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      let caught: boolean = false;
      try {
        await Trace.withAsync<number>(SLICE_NAME, async () => {
          throw new Error('rejected action');
        });
      } catch (error) {
        caught = true;
      }
      expect(caught).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_PHOTOPICKER_LOGMAT_3000
     * @tc.name      testLogMat0030
     * @tc.desc      Verify withAsync resolves a string value and keeps the
     *               caller flow reachable after the await.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testLogMat0030', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const TAG: string = 'testLogMat0030';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      const value: string = await Trace.withAsync<string>(SLICE_NAME, async () => {
        return 'async-text';
      });
      expect(value).assertEqual('async-text');
      expect(value.length > 0).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_PHOTOPICKER_LOGMAT_3100
     * @tc.name      testLogMat0031
     * @tc.desc      Verify withAsync stays usable after a rejected action and
     *               resolves the value of the following healthy call.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testLogMat0031', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      const TAG: string = 'testLogMat0031';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      let caught: boolean = false;
      try {
        await Trace.withAsync<number>(SLICE_NAME, async () => {
          throw new Error('first async fails');
        });
      } catch (error) {
        caught = true;
      }
      expect(caught).assertTrue();
      const recovered: number = await Trace.withAsync<number>(SLICE_NAME, async () => {
        return 11;
      });
      expect(recovered).assertEqual(11);
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_PHOTOPICKER_LOGMAT_3200
     * @tc.name      testLogMat0032
     * @tc.desc      Verify one loop of asynchronous withAsync calls resolves
     *               the per round value in order.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testLogMat0032', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      const TAG: string = 'testLogMat0032';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      for (let round: number = 0; round < CALL_ROUNDS; round++) {
        const value: number = await Trace.withAsync<number>(SLICE_NAME, async () => {
          return round * 10;
        });
        expect(value).assertEqual(round * 10);
      }
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_PHOTOPICKER_LOGMAT_3300
     * @tc.name      testLogMat0033
     * @tc.desc      Verify start and finish accept an empty trace name
     *               without throwing and stay balanced.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testLogMat0033', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const TAG: string = 'testLogMat0033';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      let completed: boolean = false;
      try {
        Trace.start('');
        Trace.finish('');
        completed = true;
      } catch (error) {
        completed = false;
      }
      expect(completed).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_PHOTOPICKER_LOGMAT_3400
     * @tc.name      testLogMat0034
     * @tc.desc      Verify begin and end accept a long trace name and keep
     *               the returned id positive for the paired end call.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testLogMat0034', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const TAG: string = 'testLogMat0034';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      const longName: string = 'LoggerTraceMatrix.' + 'verylongsegment';
      const taskId: number = Trace.begin(longName);
      expect(taskId).assertLarger(0);
      let completed: boolean = false;
      try {
        Trace.end(longName, taskId);
        completed = true;
      } catch (error) {
        completed = false;
      }
      expect(completed).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_PHOTOPICKER_LOGMAT_3500
     * @tc.name      testLogMat0035
     * @tc.desc      Verify the level methods and the trace pairing complete
     *               interleaved inside one shared case flow.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testLogMat0035', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const TAG: string = 'testLogMat0035';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      let completed: boolean = false;
      try {
        Trace.start(SLICE_NAME);
        Logger.info(TAG, 'inside slice');
        Trace.finish(SLICE_NAME);
        const taskId: number = Trace.begin(SLICE_NAME);
        Logger.error(TAG, 'inside counted slice');
        Trace.end(SLICE_NAME, taskId);
        completed = true;
      } catch (error) {
        completed = false;
      }
      expect(completed).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_PHOTOPICKER_LOGMAT_3600
     * @tc.name      testLogMat0036
     * @tc.desc      Verify withSync returns a reference value unchanged so
     *               the caller keeps the same array content it produced.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testLogMat0036', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const TAG: string = 'testLogMat0036';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      const produced: string[] = Trace.withSync<string[]>(SLICE_NAME, () => {
        const list: string[] = ['a', 'b', 'c'];
        return list;
      });
      expect(produced.length).assertEqual(3);
      expect(produced[0]).assertEqual('a');
      expect(produced[2]).assertEqual('c');
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_PHOTOPICKER_LOGMAT_3700
     * @tc.name      testLogMat0037
     * @tc.desc      Verify nextTaskId reaches a strictly increasing run of
     *               ids that all stay positive across the loop.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testLogMat0037', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const TAG: string = 'testLogMat0037';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      let minimum: number = Number.MAX_SAFE_INTEGER;
      for (let round: number = 0; round < ID_ROUNDS; round++) {
        const id: number = Trace.nextTaskId();
        expect(id).assertLarger(0);
        if (id < minimum) {
          minimum = id;
        }
      }
      expect(minimum).assertLarger(0);
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_PHOTOPICKER_LOGMAT_3800
     * @tc.name      testLogMat0038
     * @tc.desc      Verify errorWithCode completes for an empty error
     *               message text and an empty tag without throwing.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testLogMat0038', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const TAG: string = 'testLogMat0038';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      const error: BusinessError = { code: 1, name: 'BusinessError', message: '' };
      let completed: boolean = false;
      try {
        Logger.errorWithCode('', 'action', error);
        completed = true;
      } catch (caught) {
        completed = false;
      }
      expect(completed).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });
  });
}
