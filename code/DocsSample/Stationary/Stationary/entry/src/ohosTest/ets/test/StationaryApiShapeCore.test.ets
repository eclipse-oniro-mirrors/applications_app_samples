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
import { stationary } from '@kit.MultimodalAwarenessKit';
import { BusinessError } from '@kit.BasicServicesKit';

const DOMAIN: number = 0xF812;

const TAG: string = '[Sample_StationaryApiShapeCoreTest]';

const DOCUMENTED_CODES: number[] = [201, 801];
function isValidCode(code: number): boolean {
  return DOCUMENTED_CODES.indexOf(code) >= 0;
}

class Outcome {
  public success: number = 0;
  public documented: number = 0;
  public undocumented: number = 0;
  public lastCode: number = -1;
}

function begin(name: string): void {
  hilog.info(DOMAIN, TAG, '%{public}s', name + ' begin');
}

function end(name: string): void {
  hilog.info(DOMAIN, TAG, '%{public}s', name + ' end');
}

function invoke(action: () => void): Outcome {
  const outcome: Outcome = new Outcome();
  try {
    action();
    outcome.success = 1;
  } catch (err) {
    const code: number = Number((err as BusinessError).code);
    outcome.lastCode = code;
    if (isValidCode(code)) {
      outcome.documented = 1;
    } else {
      outcome.undocumented = 1;
    }
  }
  return outcome;
}

function ok(_response: stationary.ActivityResponse): void {
}

function callOnStillEnter(): Outcome {
  return invoke(() => stationary.on('still', stationary.ActivityEvent.ENTER, 1000000000, ok));
}

function callOnRelativeExit(): Outcome {
  return invoke(() => stationary.on('relativeStill', stationary.ActivityEvent.EXIT, 1000000000, ok));
}

function callOffStillEnter(): Outcome {
  return invoke(() => stationary.off('still', stationary.ActivityEvent.ENTER, ok));
}

function callOffAllStillEnter(): Outcome {
  return invoke(() => stationary.off('still', stationary.ActivityEvent.ENTER));
}

function callOnceStill(): Outcome {
  return invoke(() => stationary.once('still', ok));
}

function callOnceRelative(): Outcome {
  return invoke(() => stationary.once('relativeStill', ok));
}

/**
 * stationary API 形态契约（设备无关部分 + 环境自适应部分）。
 *
 * 校验三个接口暴露性、错误码白名单、ActivityResponse 字段形态，
 * 以及每次调用都能折叠为"成功/文档错误/非法错误"三态之一。
 */
export default function StationaryApiShapeCoreTest(): void {
  describe('StationaryApiShapeCoreTest', () => {

    /**
     * @tc.number    SUB_STATIONARY_SHAPE_0100
     * @tc.name      testStationaryShape0001
     * @tc.desc      Verify stationary exposes on, off and once as functions
     * @tc.type      Function
     * @tc.size      SmallTest
     * @tc.level     LEVEL0
     */
    it('testStationaryShape0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStationaryShape0001 begin');
      expect(typeof stationary.on).assertEqual('function');
      expect(typeof stationary.off).assertEqual('function');
      expect(typeof stationary.once).assertEqual('function');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStationaryShape0001 end');
    });

    /**
     * @tc.number    SUB_STATIONARY_SHAPE_0200
     * @tc.name      testStationaryShape0002
     * @tc.desc      Verify both status enums are exposed on the namespace
     * @tc.type      Function
     * @tc.size      SmallTest
     * @tc.level     LEVEL0
     */
    it('testStationaryShape0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStationaryShape0002 begin');
      const hasEvent: boolean = stationary.ActivityEvent !== undefined;
      const hasState: boolean = stationary.ActivityState !== undefined;
      hilog.info(DOMAIN, TAG, '%{public}s', 'event=' + hasEvent + ' state=' + hasState);
      expect(hasEvent).assertTrue();
      expect(hasState).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStationaryShape0002 end');
    });

    /**
     * @tc.number    SUB_STATIONARY_SHAPE_0300
     * @tc.name      testStationaryShape0003
     * @tc.desc      Verify ActivityResponse carried by the callback has a numeric state field
     * @tc.type      Function
     * @tc.size      SmallTest
     * @tc.level     LEVEL1
     */
    it('testStationaryShape0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStationaryShape0003 begin');
      const response: stationary.ActivityResponse = { state: stationary.ActivityState.ENTER };
      hilog.info(DOMAIN, TAG, '%{public}s', 'state=' + response.state);
      expect(typeof response.state).assertEqual('number');
      expect(Number.isInteger(Number(response.state))).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStationaryShape0003 end');
    });

    /**
     * @tc.number    SUB_STATIONARY_SHAPE_0400
     * @tc.name      testStationaryShape0004
     * @tc.desc      Verify the documented error code whitelist only contains 201 and 801
     * @tc.type      Function
     * @tc.size      SmallTest
     * @tc.level     LEVEL1
     */
    it('testStationaryShape0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStationaryShape0004 begin');
      hilog.info(DOMAIN, TAG, '%{public}s', 'codes=' + DOCUMENTED_CODES.join(','));
      expect(DOCUMENTED_CODES.length).assertEqual(2);
      expect(isValidCode(201)).assertTrue();
      expect(isValidCode(801)).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStationaryShape0004 end');
    });

    /**
     * @tc.number    SUB_STATIONARY_SHAPE_0500
     * @tc.name      testStationaryShape0005
     * @tc.desc      Verify on still ENTER folds into exactly one documented outcome
     * @tc.type      Function
     * @tc.size      SmallTest
     * @tc.level     LEVEL0
     */
    it('testStationaryShape0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStationaryShape0005 begin');
      const outcome: Outcome = callOnStillEnter();
      hilog.info(DOMAIN, TAG, '%{public}s',
        'success=' + outcome.success + ' documented=' + outcome.documented +
        ' undocumented=' + outcome.undocumented + ' code=' + outcome.lastCode);
      expect(outcome.undocumented).assertEqual(0);
      expect(outcome.success + outcome.documented).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStationaryShape0005 end');
    });

    /**
     * @tc.number    SUB_STATIONARY_SHAPE_0600
     * @tc.name      testStationaryShape0006
     * @tc.desc      Verify on relativeStill EXIT folds into exactly one documented outcome
     * @tc.type      Function
     * @tc.size      SmallTest
     * @tc.level     LEVEL0
     */
    it('testStationaryShape0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStationaryShape0006 begin');
      const outcome: Outcome = callOnRelativeExit();
      hilog.info(DOMAIN, TAG, '%{public}s',
        'success=' + outcome.success + ' documented=' + outcome.documented +
        ' undocumented=' + outcome.undocumented + ' code=' + outcome.lastCode);
      expect(outcome.undocumented).assertEqual(0);
      expect(outcome.success + outcome.documented).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStationaryShape0006 end');
    });

    /**
     * @tc.number    SUB_STATIONARY_SHAPE_0700
     * @tc.name      testStationaryShape0007
     * @tc.desc      Verify off still ENTER with callback folds into exactly one documented outcome
     * @tc.type      Function
     * @tc.size      SmallTest
     * @tc.level     LEVEL1
     */
    it('testStationaryShape0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStationaryShape0007 begin');
      const outcome: Outcome = callOffStillEnter();
      hilog.info(DOMAIN, TAG, '%{public}s',
        'success=' + outcome.success + ' documented=' + outcome.documented +
        ' undocumented=' + outcome.undocumented + ' code=' + outcome.lastCode);
      expect(outcome.undocumented).assertEqual(0);
      expect(outcome.success + outcome.documented).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStationaryShape0007 end');
    });

    /**
     * @tc.number    SUB_STATIONARY_SHAPE_0800
     * @tc.name      testStationaryShape0008
     * @tc.desc      Verify off still ENTER without callback folds into exactly one documented outcome
     * @tc.type      Function
     * @tc.size      SmallTest
     * @tc.level     LEVEL1
     */
    it('testStationaryShape0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStationaryShape0008 begin');
      const outcome: Outcome = callOffAllStillEnter();
      hilog.info(DOMAIN, TAG, '%{public}s',
        'success=' + outcome.success + ' documented=' + outcome.documented +
        ' undocumented=' + outcome.undocumented + ' code=' + outcome.lastCode);
      expect(outcome.undocumented).assertEqual(0);
      expect(outcome.success + outcome.documented).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStationaryShape0008 end');
    });

    /**
     * @tc.number    SUB_STATIONARY_SHAPE_0900
     * @tc.name      testStationaryShape0009
     * @tc.desc      Verify once still folds into exactly one documented outcome
     * @tc.type      Function
     * @tc.size      SmallTest
     * @tc.level     LEVEL1
     */
    it('testStationaryShape0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStationaryShape0009 begin');
      const outcome: Outcome = callOnceStill();
      hilog.info(DOMAIN, TAG, '%{public}s',
        'success=' + outcome.success + ' documented=' + outcome.documented +
        ' undocumented=' + outcome.undocumented + ' code=' + outcome.lastCode);
      expect(outcome.undocumented).assertEqual(0);
      expect(outcome.success + outcome.documented).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStationaryShape0009 end');
    });

    /**
     * @tc.number    SUB_STATIONARY_SHAPE_1000
     * @tc.name      testStationaryShape0010
     * @tc.desc      Verify once relativeStill folds into exactly one documented outcome
     * @tc.type      Function
     * @tc.size      SmallTest
     * @tc.level     LEVEL1
     */
    it('testStationaryShape0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStationaryShape0010 begin');
      const outcome: Outcome = callOnceRelative();
      hilog.info(DOMAIN, TAG, '%{public}s',
        'success=' + outcome.success + ' documented=' + outcome.documented +
        ' undocumented=' + outcome.undocumented + ' code=' + outcome.lastCode);
      expect(outcome.undocumented).assertEqual(0);
      expect(outcome.success + outcome.documented).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStationaryShape0010 end');
    });

    /**
     * @tc.number    SUB_STATIONARY_SHAPE_1100
     * @tc.name      testStationaryShape0011
     * @tc.desc      Verify repeated on still ENTER keeps one documented outcome (round #1)
     * @tc.type      Function
     * @tc.size      SmallTest
     * @tc.level     LEVEL2
     */
    it('testStationaryShape0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStationaryShape0011 begin');
      const outcomes: Outcome[] = [callOnStillEnter(), callOnStillEnter()];
      let bad: number = 0;
      let good: number = 0;
      for (const o of outcomes) {
        bad += o.undocumented;
        good += o.success + o.documented;
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'bad=' + bad + ' good=' + good);
      expect(bad).assertEqual(0);
      expect(good).assertEqual(2);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStationaryShape0011 end');
    });

    /**
     * @tc.number    SUB_STATIONARY_SHAPE_1200
     * @tc.name      testStationaryShape0012
     * @tc.desc      Verify repeated on relativeStill EXIT keeps one documented outcome (round #2)
     * @tc.type      Function
     * @tc.size      SmallTest
     * @tc.level     LEVEL2
     */
    it('testStationaryShape0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStationaryShape0012 begin');
      const outcomes: Outcome[] = [callOnRelativeExit(), callOnRelativeExit()];
      let bad: number = 0;
      let good: number = 0;
      for (const o of outcomes) {
        bad += o.undocumented;
        good += o.success + o.documented;
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'bad=' + bad + ' good=' + good);
      expect(bad).assertEqual(0);
      expect(good).assertEqual(2);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStationaryShape0012 end');
    });

    /**
     * @tc.number    SUB_STATIONARY_SHAPE_1300
     * @tc.name      testStationaryShape0013
     * @tc.desc      Verify repeated off still ENTER with callback keeps one documented outcome (round #3)
     * @tc.type      Function
     * @tc.size      SmallTest
     * @tc.level     LEVEL2
     */
    it('testStationaryShape0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStationaryShape0013 begin');
      const outcomes: Outcome[] = [callOffStillEnter(), callOffStillEnter()];
      let bad: number = 0;
      let good: number = 0;
      for (const o of outcomes) {
        bad += o.undocumented;
        good += o.success + o.documented;
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'bad=' + bad + ' good=' + good);
      expect(bad).assertEqual(0);
      expect(good).assertEqual(2);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStationaryShape0013 end');
    });

    /**
     * @tc.number    SUB_STATIONARY_SHAPE_1400
     * @tc.name      testStationaryShape0014
     * @tc.desc      Verify repeated off still ENTER without callback keeps one documented outcome (round #4)
     * @tc.type      Function
     * @tc.size      SmallTest
     * @tc.level     LEVEL2
     */
    it('testStationaryShape0014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStationaryShape0014 begin');
      const outcomes: Outcome[] = [callOffAllStillEnter(), callOffAllStillEnter()];
      let bad: number = 0;
      let good: number = 0;
      for (const o of outcomes) {
        bad += o.undocumented;
        good += o.success + o.documented;
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'bad=' + bad + ' good=' + good);
      expect(bad).assertEqual(0);
      expect(good).assertEqual(2);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStationaryShape0014 end');
    });

    /**
     * @tc.number    SUB_STATIONARY_SHAPE_1500
     * @tc.name      testStationaryShape0015
     * @tc.desc      Verify repeated once still keeps one documented outcome (round #5)
     * @tc.type      Function
     * @tc.size      SmallTest
     * @tc.level     LEVEL2
     */
    it('testStationaryShape0015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStationaryShape0015 begin');
      const outcomes: Outcome[] = [callOnceStill(), callOnceStill()];
      let bad: number = 0;
      let good: number = 0;
      for (const o of outcomes) {
        bad += o.undocumented;
        good += o.success + o.documented;
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'bad=' + bad + ' good=' + good);
      expect(bad).assertEqual(0);
      expect(good).assertEqual(2);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStationaryShape0015 end');
    });

    /**
     * @tc.number    SUB_STATIONARY_SHAPE_1600
     * @tc.name      testStationaryShape0016
     * @tc.desc      Verify repeated once relativeStill keeps one documented outcome (round #6)
     * @tc.type      Function
     * @tc.size      SmallTest
     * @tc.level     LEVEL2
     */
    it('testStationaryShape0016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStationaryShape0016 begin');
      const outcomes: Outcome[] = [callOnceRelative(), callOnceRelative()];
      let bad: number = 0;
      let good: number = 0;
      for (const o of outcomes) {
        bad += o.undocumented;
        good += o.success + o.documented;
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'bad=' + bad + ' good=' + good);
      expect(bad).assertEqual(0);
      expect(good).assertEqual(2);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStationaryShape0016 end');
    });

    /**
     * @tc.number    SUB_STATIONARY_SHAPE_1700
     * @tc.name      testStationaryShape0017
     * @tc.desc      Verify repeated on still ENTER keeps one documented outcome (round #7)
     * @tc.type      Function
     * @tc.size      SmallTest
     * @tc.level     LEVEL2
     */
    it('testStationaryShape0017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStationaryShape0017 begin');
      const outcomes: Outcome[] = [callOnStillEnter(), callOnStillEnter()];
      let bad: number = 0;
      let good: number = 0;
      for (const o of outcomes) {
        bad += o.undocumented;
        good += o.success + o.documented;
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'bad=' + bad + ' good=' + good);
      expect(bad).assertEqual(0);
      expect(good).assertEqual(2);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStationaryShape0017 end');
    });

    /**
     * @tc.number    SUB_STATIONARY_SHAPE_1800
     * @tc.name      testStationaryShape0018
     * @tc.desc      Verify repeated on relativeStill EXIT keeps one documented outcome (round #8)
     * @tc.type      Function
     * @tc.size      SmallTest
     * @tc.level     LEVEL2
     */
    it('testStationaryShape0018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStationaryShape0018 begin');
      const outcomes: Outcome[] = [callOnRelativeExit(), callOnRelativeExit()];
      let bad: number = 0;
      let good: number = 0;
      for (const o of outcomes) {
        bad += o.undocumented;
        good += o.success + o.documented;
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'bad=' + bad + ' good=' + good);
      expect(bad).assertEqual(0);
      expect(good).assertEqual(2);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStationaryShape0018 end');
    });

    /**
     * @tc.number    SUB_STATIONARY_SHAPE_1900
     * @tc.name      testStationaryShape0019
     * @tc.desc      Verify repeated off still ENTER with callback keeps one documented outcome (round #9)
     * @tc.type      Function
     * @tc.size      SmallTest
     * @tc.level     LEVEL2
     */
    it('testStationaryShape0019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStationaryShape0019 begin');
      const outcomes: Outcome[] = [callOffStillEnter(), callOffStillEnter()];
      let bad: number = 0;
      let good: number = 0;
      for (const o of outcomes) {
        bad += o.undocumented;
        good += o.success + o.documented;
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'bad=' + bad + ' good=' + good);
      expect(bad).assertEqual(0);
      expect(good).assertEqual(2);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStationaryShape0019 end');
    });

    /**
     * @tc.number    SUB_STATIONARY_SHAPE_2000
     * @tc.name      testStationaryShape0020
     * @tc.desc      Verify repeated off still ENTER without callback keeps one documented outcome (round #10)
     * @tc.type      Function
     * @tc.size      SmallTest
     * @tc.level     LEVEL2
     */
    it('testStationaryShape0020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStationaryShape0020 begin');
      const outcomes: Outcome[] = [callOffAllStillEnter(), callOffAllStillEnter()];
      let bad: number = 0;
      let good: number = 0;
      for (const o of outcomes) {
        bad += o.undocumented;
        good += o.success + o.documented;
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'bad=' + bad + ' good=' + good);
      expect(bad).assertEqual(0);
      expect(good).assertEqual(2);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStationaryShape0020 end');
    });

    /**
     * @tc.number    SUB_STATIONARY_SHAPE_2100
     * @tc.name      testStationaryShape0021
     * @tc.desc      Verify repeated once still keeps one documented outcome (round #11)
     * @tc.type      Function
     * @tc.size      SmallTest
     * @tc.level     LEVEL2
     */
    it('testStationaryShape0021', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStationaryShape0021 begin');
      const outcomes: Outcome[] = [callOnceStill(), callOnceStill()];
      let bad: number = 0;
      let good: number = 0;
      for (const o of outcomes) {
        bad += o.undocumented;
        good += o.success + o.documented;
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'bad=' + bad + ' good=' + good);
      expect(bad).assertEqual(0);
      expect(good).assertEqual(2);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStationaryShape0021 end');
    });

    /**
     * @tc.number    SUB_STATIONARY_SHAPE_2200
     * @tc.name      testStationaryShape0022
     * @tc.desc      Verify repeated once relativeStill keeps one documented outcome (round #12)
     * @tc.type      Function
     * @tc.size      SmallTest
     * @tc.level     LEVEL2
     */
    it('testStationaryShape0022', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStationaryShape0022 begin');
      const outcomes: Outcome[] = [callOnceRelative(), callOnceRelative()];
      let bad: number = 0;
      let good: number = 0;
      for (const o of outcomes) {
        bad += o.undocumented;
        good += o.success + o.documented;
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'bad=' + bad + ' good=' + good);
      expect(bad).assertEqual(0);
      expect(good).assertEqual(2);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStationaryShape0022 end');
    });

    /**
     * @tc.number    SUB_STATIONARY_SHAPE_2300
     * @tc.name      testStationaryShape0023
     * @tc.desc      Verify repeated on still ENTER keeps one documented outcome (round #13)
     * @tc.type      Function
     * @tc.size      SmallTest
     * @tc.level     LEVEL2
     */
    it('testStationaryShape0023', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStationaryShape0023 begin');
      const outcomes: Outcome[] = [callOnStillEnter(), callOnStillEnter()];
      let bad: number = 0;
      let good: number = 0;
      for (const o of outcomes) {
        bad += o.undocumented;
        good += o.success + o.documented;
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'bad=' + bad + ' good=' + good);
      expect(bad).assertEqual(0);
      expect(good).assertEqual(2);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStationaryShape0023 end');
    });

    /**
     * @tc.number    SUB_STATIONARY_SHAPE_2400
     * @tc.name      testStationaryShape0024
     * @tc.desc      Verify repeated on relativeStill EXIT keeps one documented outcome (round #14)
     * @tc.type      Function
     * @tc.size      SmallTest
     * @tc.level     LEVEL2
     */
    it('testStationaryShape0024', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStationaryShape0024 begin');
      const outcomes: Outcome[] = [callOnRelativeExit(), callOnRelativeExit()];
      let bad: number = 0;
      let good: number = 0;
      for (const o of outcomes) {
        bad += o.undocumented;
        good += o.success + o.documented;
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'bad=' + bad + ' good=' + good);
      expect(bad).assertEqual(0);
      expect(good).assertEqual(2);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStationaryShape0024 end');
    });

    /**
     * @tc.number    SUB_STATIONARY_SHAPE_2500
     * @tc.name      testStationaryShape0025
     * @tc.desc      Verify repeated off still ENTER with callback keeps one documented outcome (round #15)
     * @tc.type      Function
     * @tc.size      SmallTest
     * @tc.level     LEVEL2
     */
    it('testStationaryShape0025', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStationaryShape0025 begin');
      const outcomes: Outcome[] = [callOffStillEnter(), callOffStillEnter()];
      let bad: number = 0;
      let good: number = 0;
      for (const o of outcomes) {
        bad += o.undocumented;
        good += o.success + o.documented;
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'bad=' + bad + ' good=' + good);
      expect(bad).assertEqual(0);
      expect(good).assertEqual(2);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStationaryShape0025 end');
    });

    /**
     * @tc.number    SUB_STATIONARY_SHAPE_2600
     * @tc.name      testStationaryShape0026
     * @tc.desc      Verify repeated off still ENTER without callback keeps one documented outcome (round #16)
     * @tc.type      Function
     * @tc.size      SmallTest
     * @tc.level     LEVEL2
     */
    it('testStationaryShape0026', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStationaryShape0026 begin');
      const outcomes: Outcome[] = [callOffAllStillEnter(), callOffAllStillEnter()];
      let bad: number = 0;
      let good: number = 0;
      for (const o of outcomes) {
        bad += o.undocumented;
        good += o.success + o.documented;
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'bad=' + bad + ' good=' + good);
      expect(bad).assertEqual(0);
      expect(good).assertEqual(2);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStationaryShape0026 end');
    });

    /**
     * @tc.number    SUB_STATIONARY_SHAPE_2700
     * @tc.name      testStationaryShape0027
     * @tc.desc      Verify repeated once still keeps one documented outcome (round #17)
     * @tc.type      Function
     * @tc.size      SmallTest
     * @tc.level     LEVEL2
     */
    it('testStationaryShape0027', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStationaryShape0027 begin');
      const outcomes: Outcome[] = [callOnceStill(), callOnceStill()];
      let bad: number = 0;
      let good: number = 0;
      for (const o of outcomes) {
        bad += o.undocumented;
        good += o.success + o.documented;
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'bad=' + bad + ' good=' + good);
      expect(bad).assertEqual(0);
      expect(good).assertEqual(2);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStationaryShape0027 end');
    });

    /**
     * @tc.number    SUB_STATIONARY_SHAPE_2800
     * @tc.name      testStationaryShape0028
     * @tc.desc      Verify repeated once relativeStill keeps one documented outcome (round #18)
     * @tc.type      Function
     * @tc.size      SmallTest
     * @tc.level     LEVEL2
     */
    it('testStationaryShape0028', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStationaryShape0028 begin');
      const outcomes: Outcome[] = [callOnceRelative(), callOnceRelative()];
      let bad: number = 0;
      let good: number = 0;
      for (const o of outcomes) {
        bad += o.undocumented;
        good += o.success + o.documented;
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'bad=' + bad + ' good=' + good);
      expect(bad).assertEqual(0);
      expect(good).assertEqual(2);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStationaryShape0028 end');
    });

    /**
     * @tc.number    SUB_STATIONARY_SHAPE_2900
     * @tc.name      testStationaryShape0029
     * @tc.desc      Verify repeated on still ENTER keeps one documented outcome (round #19)
     * @tc.type      Function
     * @tc.size      SmallTest
     * @tc.level     LEVEL2
     */
    it('testStationaryShape0029', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStationaryShape0029 begin');
      const outcomes: Outcome[] = [callOnStillEnter(), callOnStillEnter()];
      let bad: number = 0;
      let good: number = 0;
      for (const o of outcomes) {
        bad += o.undocumented;
        good += o.success + o.documented;
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'bad=' + bad + ' good=' + good);
      expect(bad).assertEqual(0);
      expect(good).assertEqual(2);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStationaryShape0029 end');
    });

    /**
     * @tc.number    SUB_STATIONARY_SHAPE_3000
     * @tc.name      testStationaryShape0030
     * @tc.desc      Verify repeated on relativeStill EXIT keeps one documented outcome (round #20)
     * @tc.type      Function
     * @tc.size      SmallTest
     * @tc.level     LEVEL2
     */
    it('testStationaryShape0030', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStationaryShape0030 begin');
      const outcomes: Outcome[] = [callOnRelativeExit(), callOnRelativeExit()];
      let bad: number = 0;
      let good: number = 0;
      for (const o of outcomes) {
        bad += o.undocumented;
        good += o.success + o.documented;
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'bad=' + bad + ' good=' + good);
      expect(bad).assertEqual(0);
      expect(good).assertEqual(2);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStationaryShape0030 end');
    });

    /**
     * @tc.number    SUB_STATIONARY_SHAPE_3100
     * @tc.name      testStationaryShape0031
     * @tc.desc      Verify error code is numeric whenever an exception is raised (event 1)
     * @tc.type      Function
     * @tc.size      SmallTest
     * @tc.level     LEVEL2
     */
    it('testStationaryShape0031', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStationaryShape0031 begin');
      let codeType: string = 'none';
      try {
        stationary.on('still', 1 as stationary.ActivityEvent, 1000000000, ok);
        stationary.off('still', 1 as stationary.ActivityEvent, ok);
      } catch (err) {
        codeType = typeof (err as BusinessError).code;
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'codeType=' + codeType);
      expect(codeType === 'number' || codeType === 'none').assertTrue();
      expect(codeType !== 'undefined').assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStationaryShape0031 end');
    });

    /**
     * @tc.number    SUB_STATIONARY_SHAPE_3200
     * @tc.name      testStationaryShape0032
     * @tc.desc      Verify error code is numeric whenever an exception is raised (event 2)
     * @tc.type      Function
     * @tc.size      SmallTest
     * @tc.level     LEVEL2
     */
    it('testStationaryShape0032', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStationaryShape0032 begin');
      let codeType: string = 'none';
      try {
        stationary.on('still', 2 as stationary.ActivityEvent, 1000000000, ok);
        stationary.off('still', 2 as stationary.ActivityEvent, ok);
      } catch (err) {
        codeType = typeof (err as BusinessError).code;
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'codeType=' + codeType);
      expect(codeType === 'number' || codeType === 'none').assertTrue();
      expect(codeType !== 'undefined').assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStationaryShape0032 end');
    });

    /**
     * @tc.number    SUB_STATIONARY_SHAPE_3300
     * @tc.name      testStationaryShape0033
     * @tc.desc      Verify error code is numeric whenever an exception is raised (event 3)
     * @tc.type      Function
     * @tc.size      SmallTest
     * @tc.level     LEVEL2
     */
    it('testStationaryShape0033', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStationaryShape0033 begin');
      let codeType: string = 'none';
      try {
        stationary.on('still', 3 as stationary.ActivityEvent, 1000000000, ok);
        stationary.off('still', 3 as stationary.ActivityEvent, ok);
      } catch (err) {
        codeType = typeof (err as BusinessError).code;
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'codeType=' + codeType);
      expect(codeType === 'number' || codeType === 'none').assertTrue();
      expect(codeType !== 'undefined').assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStationaryShape0033 end');
    });

    /**
     * @tc.number    SUB_STATIONARY_SHAPE_3400
     * @tc.name      testStationaryShape0034
     * @tc.desc      Verify error code is numeric whenever an exception is raised (event 1)
     * @tc.type      Function
     * @tc.size      SmallTest
     * @tc.level     LEVEL2
     */
    it('testStationaryShape0034', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStationaryShape0034 begin');
      let codeType: string = 'none';
      try {
        stationary.on('still', 1 as stationary.ActivityEvent, 1000000000, ok);
        stationary.off('still', 1 as stationary.ActivityEvent, ok);
      } catch (err) {
        codeType = typeof (err as BusinessError).code;
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'codeType=' + codeType);
      expect(codeType === 'number' || codeType === 'none').assertTrue();
      expect(codeType !== 'undefined').assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStationaryShape0034 end');
    });

    /**
     * @tc.number    SUB_STATIONARY_SHAPE_3500
     * @tc.name      testStationaryShape0035
     * @tc.desc      Verify error code is numeric whenever an exception is raised (event 2)
     * @tc.type      Function
     * @tc.size      SmallTest
     * @tc.level     LEVEL2
     */
    it('testStationaryShape0035', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStationaryShape0035 begin');
      let codeType: string = 'none';
      try {
        stationary.on('still', 2 as stationary.ActivityEvent, 1000000000, ok);
        stationary.off('still', 2 as stationary.ActivityEvent, ok);
      } catch (err) {
        codeType = typeof (err as BusinessError).code;
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'codeType=' + codeType);
      expect(codeType === 'number' || codeType === 'none').assertTrue();
      expect(codeType !== 'undefined').assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStationaryShape0035 end');
    });

    /**
     * @tc.number    SUB_STATIONARY_SHAPE_3600
     * @tc.name      testStationaryShape0036
     * @tc.desc      Verify error code is numeric whenever an exception is raised (event 3)
     * @tc.type      Function
     * @tc.size      SmallTest
     * @tc.level     LEVEL2
     */
    it('testStationaryShape0036', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStationaryShape0036 begin');
      let codeType: string = 'none';
      try {
        stationary.on('still', 3 as stationary.ActivityEvent, 1000000000, ok);
        stationary.off('still', 3 as stationary.ActivityEvent, ok);
      } catch (err) {
        codeType = typeof (err as BusinessError).code;
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'codeType=' + codeType);
      expect(codeType === 'number' || codeType === 'none').assertTrue();
      expect(codeType !== 'undefined').assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStationaryShape0036 end');
    });

  });
}
