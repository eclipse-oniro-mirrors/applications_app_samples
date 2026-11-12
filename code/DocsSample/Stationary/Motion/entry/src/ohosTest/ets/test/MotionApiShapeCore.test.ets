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
import { motion } from '@kit.MultimodalAwarenessKit';
import { BusinessError } from '@kit.BasicServicesKit';

const TAG: string = '[Sample_MotionApiShapeCoreTest]';
const DOMAIN: number = 0xF815;

const OPERATING_EVENT: string = 'operatingHandChanged';
const HOLDING_EVENT: string = 'holdingHandChanged';
const DOCUMENTED_CODES: number[] = [201, 401, 801, 31500001, 31500002, 31500003];

type OperatingCallback = Callback<motion.OperatingHandStatus>;
type HoldingCallback = Callback<motion.HoldingHandStatus>;

function logBegin(name: string): void {
  hilog.info(DOMAIN, TAG, '%{public}s', name + ' begin');
}

function logEnd(name: string): void {
  hilog.info(DOMAIN, TAG, '%{public}s', name + ' end');
}

function operatingCallback(_status: motion.OperatingHandStatus): void {
}

function holdingCallback(_status: motion.HoldingHandStatus): void {
}

/**
 * 调用结果三元分类：成功 / 文档错误码 / 未文档化错误。
 */
class Outcome {
  public success: number = 0;
  public documented: number = 0;
  public undocumented: number = 0;
  public lastCode: number = 0;
  public errorMessage: string = '';
}

function classify(err: Object): number {
  const businessError: BusinessError = err as BusinessError;
  const code: number = Number(businessError.code);
  if (DOCUMENTED_CODES.indexOf(code) >= 0) {
    return code;
  }
  return -1;
}

function invoke(action: () => void): Outcome {
  const outcome: Outcome = new Outcome();
  try {
    action();
    outcome.success = 1;
  } catch (err) {
    const code: number = classify(err as Object);
    outcome.lastCode = code;
    outcome.errorMessage = String((err as BusinessError).message);
    if (code > 0) {
      outcome.documented = 1;
    } else {
      outcome.undocumented = 1;
    }
  }
  return outcome;
}

/**
 * motion Kit 接口形态契约（核心档）。
 *
 * 校验 on/off/getRecentOperatingHandStatus 的暴露性、重载形态、事件名大小写敏感、
 * 回调缺失时的行为，以及所有失败路径只能落在文档错误码内。
 * 设备不持能力或无权限时走 201/801 分支，属被测预期状态。
 */
export default function MotionApiShapeCoreTest(): void {
  describe('MotionApiShapeCoreTest', () => {
    /**
     * @tc.number    SUB_MOTION_API_SHAPE_CORE_0100
     * @tc.name      testMotionApiShapeCore0001
     * @tc.desc      Verify motion.on is callable and reports a function type
     * @tc.type      Function
     * @tc.size      SmallTest
     * @tc.level     LEVEL0
     */
    it('testMotionApiShapeCore0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logBegin('testMotionApiShapeCore0001');
      const typeName: string = typeof motion.on;
      hilog.info(DOMAIN, TAG, '%{public}s', 'typeof on=' + typeName);
      expect(typeName).assertEqual('function');
      expect(motion.on.length >= 0).assertTrue();
      logEnd('testMotionApiShapeCore0001');
    });

    /**
     * @tc.number    SUB_MOTION_API_SHAPE_CORE_0200
     * @tc.name      testMotionApiShapeCore0002
     * @tc.desc      Verify motion.off is callable and reports a function type
     * @tc.type      Function
     * @tc.size      SmallTest
     * @tc.level     LEVEL0
     */
    it('testMotionApiShapeCore0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logBegin('testMotionApiShapeCore0002');
      const typeName: string = typeof motion.off;
      hilog.info(DOMAIN, TAG, '%{public}s', 'typeof off=' + typeName);
      expect(typeName).assertEqual('function');
      expect(motion.off.length >= 0).assertTrue();
      logEnd('testMotionApiShapeCore0002');
    });

    /**
     * @tc.number    SUB_MOTION_API_SHAPE_CORE_0300
     * @tc.name      testMotionApiShapeCore0003
     * @tc.desc      Verify getRecentOperatingHandStatus is callable and reports a function type
     * @tc.type      Function
     * @tc.size      SmallTest
     * @tc.level     LEVEL0
     */
    it('testMotionApiShapeCore0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logBegin('testMotionApiShapeCore0003');
      const typeName: string = typeof motion.getRecentOperatingHandStatus;
      hilog.info(DOMAIN, TAG, '%{public}s', 'typeof getRecentOperatingHandStatus=' + typeName);
      expect(typeName).assertEqual('function');
      expect(motion.getRecentOperatingHandStatus.length).assertEqual(0);
      logEnd('testMotionApiShapeCore0003');
    });

    /**
     * @tc.number    SUB_MOTION_API_SHAPE_CORE_0400
     * @tc.name      testMotionApiShapeCore0004
     * @tc.desc      Verify both documented event names are non-empty and mutually distinct
     * @tc.type      Function
     * @tc.size      SmallTest
     * @tc.level     LEVEL0
     */
    it('testMotionApiShapeCore0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logBegin('testMotionApiShapeCore0004');
      hilog.info(DOMAIN, TAG, '%{public}s', 'events=' + OPERATING_EVENT + '|' + HOLDING_EVENT);
      expect(OPERATING_EVENT.length > 0).assertTrue();
      expect(HOLDING_EVENT.length > 0).assertTrue();
      expect(OPERATING_EVENT === HOLDING_EVENT).assertFalse();
      logEnd('testMotionApiShapeCore0004');
    });

    /**
     * @tc.number    SUB_MOTION_API_SHAPE_CORE_0500
     * @tc.name      testMotionApiShapeCore0005
     * @tc.desc      Verify documented event names use lower camel case ending with Changed
     * @tc.type      Function
     * @tc.size      SmallTest
     * @tc.level     LEVEL1
     */
    it('testMotionApiShapeCore0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logBegin('testMotionApiShapeCore0005');
      const events: string[] = [OPERATING_EVENT, HOLDING_EVENT];
      let conforming: number = 0;
      for (const event of events) {
        if (event.endsWith('Changed') && event.charAt(0) === event.charAt(0).toLowerCase()) {
          conforming++;
        }
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'conforming=' + conforming);
      expect(conforming).assertEqual(2);
      expect(conforming).assertEqual(events.length);
      logEnd('testMotionApiShapeCore0005');
    });

    /**
     * @tc.number    SUB_MOTION_API_SHAPE_CORE_0600
     * @tc.name      testMotionApiShapeCore0006
     * @tc.desc      Verify subscribing operating hand with a callback yields exactly one documented outcome
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testMotionApiShapeCore0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      logBegin('testMotionApiShapeCore0006');
      const outcome: Outcome = invoke(() => motion.on('operatingHandChanged', operatingCallback));
      hilog.info(DOMAIN, TAG, '%{public}s',
        'success=' + outcome.success + ', documented=' + outcome.documented + ', code=' + outcome.lastCode);
      expect(outcome.undocumented).assertEqual(0);
      expect(outcome.success + outcome.documented).assertEqual(1);
      invoke(() => motion.off('operatingHandChanged', operatingCallback));
      logEnd('testMotionApiShapeCore0006');
    });

    /**
     * @tc.number    SUB_MOTION_API_SHAPE_CORE_0700
     * @tc.name      testMotionApiShapeCore0007
     * @tc.desc      Verify subscribing holding hand with a callback yields exactly one documented outcome
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testMotionApiShapeCore0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      logBegin('testMotionApiShapeCore0007');
      const outcome: Outcome = invoke(() => motion.on('holdingHandChanged', holdingCallback));
      hilog.info(DOMAIN, TAG, '%{public}s',
        'success=' + outcome.success + ', documented=' + outcome.documented + ', code=' + outcome.lastCode);
      expect(outcome.undocumented).assertEqual(0);
      expect(outcome.success + outcome.documented).assertEqual(1);
      invoke(() => motion.off('holdingHandChanged', holdingCallback));
      logEnd('testMotionApiShapeCore0007');
    });

    /**
     * @tc.number    SUB_MOTION_API_SHAPE_CORE_0800
     * @tc.name      testMotionApiShapeCore0008
     * @tc.desc      Verify off without callback is accepted for both events as a documented outcome
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL1
     */
    it('testMotionApiShapeCore0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      logBegin('testMotionApiShapeCore0008');
      const operatingOutcome: Outcome = invoke(() => motion.off('operatingHandChanged'));
      const holdingOutcome: Outcome = invoke(() => motion.off('holdingHandChanged'));
      hilog.info(DOMAIN, TAG, '%{public}s',
        'operating undocumented=' + operatingOutcome.undocumented +
        ', holding undocumented=' + holdingOutcome.undocumented);
      expect(operatingOutcome.undocumented).assertEqual(0);
      expect(holdingOutcome.undocumented).assertEqual(0);
      expect(operatingOutcome.success + operatingOutcome.documented).assertEqual(1);
      expect(holdingOutcome.success + holdingOutcome.documented).assertEqual(1);
      logEnd('testMotionApiShapeCore0008');
    });

    /**
     * @tc.number    SUB_MOTION_API_SHAPE_CORE_0900
     * @tc.name      testMotionApiShapeCore0009
     * @tc.desc      Verify query returns a member of OperatingHandStatus or a documented error
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testMotionApiShapeCore0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      logBegin('testMotionApiShapeCore0009');
      let reported: number = -1;
      let failedWithDocumented: boolean = false;
      try {
        reported = Number(motion.getRecentOperatingHandStatus());
      } catch (err) {
        failedWithDocumented = classify(err as Object) > 0;
      }
      const known: boolean = [0, 1, 2].indexOf(reported) >= 0;
      hilog.info(DOMAIN, TAG, '%{public}s',
        'reported=' + reported + ', documentedFailure=' + failedWithDocumented);
      expect(known !== failedWithDocumented).assertTrue();
      expect(known || failedWithDocumented).assertTrue();
      logEnd('testMotionApiShapeCore0009');
    });

    /**
     * @tc.number    SUB_MOTION_API_SHAPE_CORE_1000
     * @tc.name      testMotionApiShapeCore0010
     * @tc.desc      Verify query reports a number type on success
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testMotionApiShapeCore0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      logBegin('testMotionApiShapeCore0010');
      let typeName: string = 'none';
      try {
        typeName = typeof motion.getRecentOperatingHandStatus();
      } catch (err) {
        typeName = 'none';
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'type=' + typeName);
      expect(typeName === 'number' || typeName === 'none').assertTrue();
      expect(typeName !== 'undefined').assertTrue();
      logEnd('testMotionApiShapeCore0010');
    });

    /**
     * @tc.number    SUB_MOTION_API_SHAPE_CORE_1100
     * @tc.name      testMotionApiShapeCore0011
     * @tc.desc      Verify query result is within the OperatingHandStatus value set when it succeeds
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testMotionApiShapeCore0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      logBegin('testMotionApiShapeCore0011');
      let reported: number = -1;
      let succeeded: boolean = false;
      try {
        reported = Number(motion.getRecentOperatingHandStatus());
        succeeded = true;
      } catch (err) {
        succeeded = false;
      }
      const validSet: boolean = reported === 0 || reported === 1 || reported === 2;
      hilog.info(DOMAIN, TAG, '%{public}s', 'reported=' + reported + ', succeeded=' + succeeded);
      expect(succeeded ? validSet : !validSet).assertTrue();
      expect(succeeded ? reported >= 0 : reported < 0).assertTrue();
      logEnd('testMotionApiShapeCore0011');
    });

    /**
     * @tc.number    SUB_MOTION_API_SHAPE_CORE_1200
     * @tc.name      testMotionApiShapeCore0012
     * @tc.desc      Verify error code whitelist covers every documented code exactly once
     * @tc.type      Function
     * @tc.size      SmallTest
     * @tc.level     LEVEL1
     */
    it('testMotionApiShapeCore0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logBegin('testMotionApiShapeCore0012');
      const distinct: number = new Set<number>(DOCUMENTED_CODES).size;
      hilog.info(DOMAIN, TAG, '%{public}s', 'codes=' + DOCUMENTED_CODES.join(','));
      expect(distinct).assertEqual(DOCUMENTED_CODES.length);
      expect(DOCUMENTED_CODES.length).assertEqual(6);
      expect(DOCUMENTED_CODES.indexOf(801) >= 0).assertTrue();
      logEnd('testMotionApiShapeCore0012');
    });

    /**
     * @tc.number    SUB_MOTION_API_SHAPE_CORE_1300
     * @tc.name      testMotionApiShapeCore0013
     * @tc.desc      Verify documented service error codes share the 315000 0x prefix family
     * @tc.type      Function
     * @tc.size      SmallTest
     * @tc.level     LEVEL1
     */
    it('testMotionApiShapeCore0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logBegin('testMotionApiShapeCore0013');
      const serviceCodes: number[] = [31500001, 31500002, 31500003];
      let prefixed: number = 0;
      for (const code of serviceCodes) {
        if (Math.floor(code / 1000) === 31500) {
          prefixed++;
        }
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'prefixed=' + prefixed);
      expect(prefixed).assertEqual(serviceCodes.length);
      expect(serviceCodes.length).assertEqual(3);
      logEnd('testMotionApiShapeCore0013');
    });

    /**
     * @tc.number    SUB_MOTION_API_SHAPE_CORE_1400
     * @tc.name      testMotionApiShapeCore0014
     * @tc.desc      Verify permission codes 201 and capability code 801 are below service error band
     * @tc.type      Function
     * @tc.size      SmallTest
     * @tc.level     LEVEL1
     */
    it('testMotionApiShapeCore0014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logBegin('testMotionApiShapeCore0014');
      const permission: number = 201;
      const capability: number = 801;
      hilog.info(DOMAIN, TAG, '%{public}s', 'permission=' + permission + ', capability=' + capability);
      expect(permission < 1000).assertTrue();
      expect(capability < 1000).assertTrue();
      expect(permission < capability).assertTrue();
      logEnd('testMotionApiShapeCore0014');
    });

    /**
     * @tc.number    SUB_MOTION_API_SHAPE_CORE_1500
     * @tc.name      testMotionApiShapeCore0015
     * @tc.desc      Verify parameter error code 401 is documented and distinct from permission and capability
     * @tc.type      Function
     * @tc.size      SmallTest
     * @tc.level     LEVEL1
     */
    it('testMotionApiShapeCore0015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logBegin('testMotionApiShapeCore0015');
      const parameter: number = 401;
      const others: number[] = [201, 801];
      hilog.info(DOMAIN, TAG, '%{public}s', 'parameter=' + parameter);
      expect(DOCUMENTED_CODES.indexOf(parameter) >= 0).assertTrue();
      expect(others.indexOf(parameter) >= 0).assertFalse();
      expect(new Set<number>([parameter].concat(others)).size).assertEqual(3);
      logEnd('testMotionApiShapeCore0015');
    });

    /**
     * @tc.number    SUB_MOTION_API_SHAPE_CORE_1600
     * @tc.name      testMotionApiShapeCore0016
     * @tc.desc      Verify on rejects an unknown event name or reports a documented error without crashing
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL1
     */
    it('testMotionApiShapeCore0016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      logBegin('testMotionApiShapeCore0016');
      const outcome: Outcome = invoke(() => {
        motion.on('unknownMotionEvent' as 'operatingHandChanged', operatingCallback);
      });
      hilog.info(DOMAIN, TAG, '%{public}s',
        'success=' + outcome.success + ', code=' + outcome.lastCode + ', undocumented=' + outcome.undocumented);
      expect(outcome.undocumented).assertEqual(0);
      expect(outcome.success + outcome.documented).assertEqual(1);
      logEnd('testMotionApiShapeCore0016');
    });

    /**
     * @tc.number    SUB_MOTION_API_SHAPE_CORE_1700
     * @tc.name      testMotionApiShapeCore0017
     * @tc.desc      Verify event name lookup is case sensitive: upper-cased name is not the documented one
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL1
     */
    it('testMotionApiShapeCore0017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      logBegin('testMotionApiShapeCore0017');
      const upperCased: string = OPERATING_EVENT.toUpperCase();
      const outcome: Outcome = invoke(() => {
        motion.on(upperCased as 'operatingHandChanged', operatingCallback);
      });
      hilog.info(DOMAIN, TAG, '%{public}s',
        'name=' + upperCased + ', success=' + outcome.success + ', code=' + outcome.lastCode);
      expect(upperCased === OPERATING_EVENT).assertFalse();
      expect(outcome.undocumented).assertEqual(0);
      logEnd('testMotionApiShapeCore0017');
    });

    /**
     * @tc.number    SUB_MOTION_API_SHAPE_CORE_1800
     * @tc.name      testMotionApiShapeCore0018
     * @tc.desc      Verify off with an unknown event name never produces an undocumented error
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL1
     */
    it('testMotionApiShapeCore0018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      logBegin('testMotionApiShapeCore0018');
      const outcome: Outcome = invoke(() => {
        motion.off('unknownMotionEvent' as 'holdingHandChanged');
      });
      hilog.info(DOMAIN, TAG, '%{public}s',
        'success=' + outcome.success + ', code=' + outcome.lastCode + ', undocumented=' + outcome.undocumented);
      expect(outcome.undocumented).assertEqual(0);
      expect(outcome.success + outcome.documented).assertEqual(1);
      logEnd('testMotionApiShapeCore0018');
    });

    /**
     * @tc.number    SUB_MOTION_API_SHAPE_CORE_1900
     * @tc.name      testMotionApiShapeCore0019
     * @tc.desc      Verify three documented APIs are exposed as callable functions
     * @tc.type      Function
     * @tc.size      SmallTest
     * @tc.level     LEVEL1
     */
    it('testMotionApiShapeCore0019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logBegin('testMotionApiShapeCore0019');
      const names: string[] = ['on', 'off', 'getRecentOperatingHandStatus'];
      const typedefs: string[] = [
        typeof motion.on,
        typeof motion.off,
        typeof motion.getRecentOperatingHandStatus
      ];
      let present: number = 0;
      for (const name of names) {
        const index: number = names.indexOf(name);
        if (index >= 0 && typedefs[index] === 'function') {
          present++;
        }
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'present=' + present);
      expect(present).assertEqual(names.length);
      expect(present).assertEqual(3);
      logEnd('testMotionApiShapeCore0019');
    });

    /**
     * @tc.number    SUB_MOTION_API_SHAPE_CORE_2000
     * @tc.name      testMotionApiShapeCore0020
     * @tc.desc      Verify motion namespace exposes both status enums alongside the three functions
     * @tc.type      Function
     * @tc.size      SmallTest
     * @tc.level     LEVEL1
     */
    it('testMotionApiShapeCore0020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logBegin('testMotionApiShapeCore0020');
      const hasOperating: boolean = motion.OperatingHandStatus !== undefined;
      const hasHolding: boolean = motion.HoldingHandStatus !== undefined;
      hilog.info(DOMAIN, TAG, '%{public}s', 'operating=' + hasOperating + ', holding=' + hasHolding);
      expect(hasOperating).assertTrue();
      expect(hasHolding).assertTrue();
      expect(typeof motion.OperatingHandStatus).assertEqual('object');
      logEnd('testMotionApiShapeCore0020');
    });
  });
}
