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

import { beforeEach, describe, expect, it, Level, Size, TestType } from '@ohos/hypium';
import { hilog } from '@kit.PerformanceAnalysisKit';
import testNapi from 'libentry.so';
import { QosLevelRange, QosRunInfo, RunSummary } from 'libentry.so';
import { buildQosLevelOptions, QosLevelOption } from '../../../main/ets/model/QosLevelModel';

const TAG: string = '[Sample_NdkQosResourceModelTest]';
const DOMAIN: number = 0xF811;
const LEVEL_COUNT: number = 6;
const MIN_LEVEL: number = 0;
const MAX_LEVEL: number = 5;
const INVALID_LEVEL: number = 99;
const DURATION_TOLERANCE: number = 0.001;
// The resource identifiers of an application itself live in [0x01000000, 0x06FFFFFF], see Resource.id.
const APP_RESOURCE_ID_MIN: number = 0x01000000;
const APP_RESOURCE_ID_MAX: number = 0x06FFFFFF;

const backgroundLabel: Resource = $r('app.string.qos_level_background');
const utilityLabel: Resource = $r('app.string.qos_level_utility');
const defaultLabel: Resource = $r('app.string.qos_level_default');
const userInitiatedLabel: Resource = $r('app.string.qos_level_user_initiated');
const deadlineLabel: Resource = $r('app.string.qos_level_deadline_request');
const interactiveLabel: Resource = $r('app.string.qos_level_user_interactive');

function logInfo(message: string): void {
  hilog.info(DOMAIN, TAG, '%{public}s', message);
}

function levelsOf(options: QosLevelOption[]): number[] {
  const levels: number[] = [];
  for (let index = 0; index < options.length; index++) {
    levels.push(options[index].level);
  }
  return levels;
}

function labelIdsOf(options: QosLevelOption[]): number[] {
  const ids: number[] = [];
  for (let index = 0; index < options.length; index++) {
    ids.push(options[index].label.id);
  }
  return ids;
}

function sameNumbers(left: number[], right: number[]): boolean {
  if (left.length !== right.length) {
    return false;
  }
  for (let index = 0; index < left.length; index++) {
    if (left[index] !== right[index]) {
      return false;
    }
  }
  return true;
}

function uniqueCount(values: number[]): number {
  const seen: number[] = [];
  for (let index = 0; index < values.length; index++) {
    if (seen.indexOf(values[index]) < 0) {
      seen.push(values[index]);
    }
  }
  return seen.length;
}

function countPositive(values: number[]): number {
  let positive: number = 0;
  for (let index = 0; index < values.length; index++) {
    if (values[index] > 0) {
      positive++;
    }
  }
  return positive;
}

function isDurationValid(value: number): boolean {
  return !Number.isNaN(value) && Number.isFinite(value) && value > 0;
}

export default function ndkQosResourceModelTest(): void {
  describe('NdkQosResourceModel', () => {
    beforeEach(() => {
      testNapi.resetRunSummary();
    });

    /**
     * @tc.number    SUB_QOS_RESMODEL_0001
     * @tc.name      testNdkQosResourceModel0001
     * @tc.desc      Checks the level model builds six options and every entry is a level option instance.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testNdkQosResourceModel0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      logInfo('testNdkQosResourceModel0001 begin');
      const options: QosLevelOption[] = buildQosLevelOptions();
      let typed: number = 0;
      for (let index = 0; index < options.length; index++) {
        if (options[index] instanceof QosLevelOption) {
          typed++;
        }
      }
      logInfo('option count = ' + options.length.toString() + ', typed = ' + typed.toString());
      expect(Array.isArray(options)).assertTrue();
      expect(options.length).assertEqual(LEVEL_COUNT);
      expect(typed).assertEqual(options.length);
      logInfo('testNdkQosResourceModel0001 end');
    })

    /**
     * @tc.number    SUB_QOS_RESMODEL_0002
     * @tc.name      testNdkQosResourceModel0002
     * @tc.desc      Checks the options carry the ascending levels zero to five in array order.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testNdkQosResourceModel0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      logInfo('testNdkQosResourceModel0002 begin');
      const options: QosLevelOption[] = buildQosLevelOptions();
      const levels: number[] = levelsOf(options);
      logInfo('levels = ' + JSON.stringify(levels));
      for (let index = 0; index < levels.length; index++) {
        expect(levels[index]).assertEqual(MIN_LEVEL + index);
      }
      expect(levels.length).assertEqual(LEVEL_COUNT);
      expect(levels[MIN_LEVEL]).assertEqual(MIN_LEVEL);
      expect(levels[MAX_LEVEL]).assertEqual(MAX_LEVEL);
      logInfo('testNdkQosResourceModel0002 end');
    })

    /**
     * @tc.number    SUB_QOS_RESMODEL_0003
     * @tc.name      testNdkQosResourceModel0003
     * @tc.desc      Checks the level sequence has no gap and no duplicated level.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testNdkQosResourceModel0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      logInfo('testNdkQosResourceModel0003 begin');
      const levels: number[] = levelsOf(buildQosLevelOptions());
      for (let index = 1; index < levels.length; index++) {
        expect(levels[index] - levels[index - 1]).assertEqual(1);
      }
      logInfo('unique level count = ' + uniqueCount(levels).toString());
      expect(uniqueCount(levels)).assertEqual(LEVEL_COUNT);
      expect(levels.length).assertEqual(LEVEL_COUNT);
      logInfo('testNdkQosResourceModel0003 end');
    })

    /**
     * @tc.number    SUB_QOS_RESMODEL_0004
     * @tc.name      testNdkQosResourceModel0004
     * @tc.desc      Checks the first and last option match the level bounds reported by the native range.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testNdkQosResourceModel0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      logInfo('testNdkQosResourceModel0004 begin');
      const options: QosLevelOption[] = buildQosLevelOptions();
      const range: QosLevelRange = testNapi.getLevelRange();
      logInfo('range = ' + JSON.stringify(range));
      expect(options[0].level).assertEqual(range.minLevel);
      expect(options[options.length - 1].level).assertEqual(range.maxLevel);
      expect(range.minLevel < range.maxLevel).assertTrue();
      logInfo('testNdkQosResourceModel0004 end');
    })

    /**
     * @tc.number    SUB_QOS_RESMODEL_0005
     * @tc.name      testNdkQosResourceModel0005
     * @tc.desc      Checks every option level falls inside the legal level window of the native range.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testNdkQosResourceModel0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      logInfo('testNdkQosResourceModel0005 begin');
      const levels: number[] = levelsOf(buildQosLevelOptions());
      const range: QosLevelRange = testNapi.getLevelRange();
      let inside: number = 0;
      for (let index = 0; index < levels.length; index++) {
        if (levels[index] >= range.minLevel && levels[index] <= range.maxLevel) {
          inside++;
        }
      }
      logInfo('levels inside range = ' + inside.toString());
      expect(inside).assertEqual(levels.length);
      expect(inside).assertEqual(LEVEL_COUNT);
      expect(range.minLevel).assertEqual(MIN_LEVEL);
      logInfo('testNdkQosResourceModel0005 end');
    })

    /**
     * @tc.number    SUB_QOS_RESMODEL_0006
     * @tc.name      testNdkQosResourceModel0006
     * @tc.desc      Checks the option count equals the level count the native layer declares.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testNdkQosResourceModel0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      logInfo('testNdkQosResourceModel0006 begin');
      const options: QosLevelOption[] = buildQosLevelOptions();
      const range: QosLevelRange = testNapi.getLevelRange();
      const optionCount: number = options.length;
      const declaredCount: number = range.levelCount;
      logInfo('option count = ' + optionCount.toString() + ', declared count = ' + declaredCount.toString());
      expect(declaredCount).assertEqual(LEVEL_COUNT);
      expect(optionCount).assertEqual(declaredCount);
      logInfo('level window = ' + range.minLevel.toString() + '..' + range.maxLevel.toString());
      expect(range.maxLevel - range.minLevel + 1).assertEqual(declaredCount);
      logInfo('testNdkQosResourceModel0006 end');
    })

    /**
     * @tc.number    SUB_QOS_RESMODEL_0007
     * @tc.name      testNdkQosResourceModel0007
     * @tc.desc      Checks every option carries a real string resource with a positive identifier.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testNdkQosResourceModel0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      logInfo('testNdkQosResourceModel0007 begin');
      const options: QosLevelOption[] = buildQosLevelOptions();
      const ids: number[] = labelIdsOf(options);
      let integers: number = 0;
      for (let index = 0; index < ids.length; index++) {
        if (Number.isInteger(ids[index])) {
          integers++;
        }
      }
      logInfo('label ids = ' + JSON.stringify(ids));
      expect(countPositive(ids)).assertEqual(ids.length);
      expect(integers).assertEqual(ids.length);
      expect(ids.length).assertEqual(LEVEL_COUNT);
      logInfo('testNdkQosResourceModel0007 end');
    })

    /**
     * @tc.number    SUB_QOS_RESMODEL_0008
     * @tc.name      testNdkQosResourceModel0008
     * @tc.desc      Checks the six option labels reference six different string resources.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testNdkQosResourceModel0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      logInfo('testNdkQosResourceModel0008 begin');
      const ids: number[] = labelIdsOf(buildQosLevelOptions());
      const distinct: number = uniqueCount(ids);
      logInfo('distinct label ids = ' + distinct.toString());
      expect(distinct).assertEqual(LEVEL_COUNT);
      expect(distinct).assertEqual(ids.length);
      expect(countPositive(ids)).assertEqual(distinct);
      logInfo('testNdkQosResourceModel0008 end');
    })

    /**
     * @tc.number    SUB_QOS_RESMODEL_0009
     * @tc.name      testNdkQosResourceModel0009
     * @tc.desc      Checks the lowest option points at the background level string resource.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testNdkQosResourceModel0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      logInfo('testNdkQosResourceModel0009 begin');
      const options: QosLevelOption[] = buildQosLevelOptions();
      const ids: number[] = labelIdsOf(options);
      logInfo('background label id = ' + backgroundLabel.id.toString() + ', option id = ' + ids[0].toString());
      expect(options[0].level).assertEqual(MIN_LEVEL);
      expect(options[0].label.id).assertEqual(backgroundLabel.id);
      expect(ids.indexOf(backgroundLabel.id)).assertEqual(0);
      logInfo('testNdkQosResourceModel0009 end');
    })

    /**
     * @tc.number    SUB_QOS_RESMODEL_0010
     * @tc.name      testNdkQosResourceModel0010
     * @tc.desc      Checks the highest option points at the user interactive level string resource.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testNdkQosResourceModel0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      logInfo('testNdkQosResourceModel0010 begin');
      const options: QosLevelOption[] = buildQosLevelOptions();
      const ids: number[] = labelIdsOf(options);
      logInfo('interactive label id = ' + interactiveLabel.id.toString() + ', option id = ' +
        ids[ids.length - 1].toString());
      expect(options[MAX_LEVEL].level).assertEqual(MAX_LEVEL);
      expect(options[MAX_LEVEL].label.id).assertEqual(interactiveLabel.id);
      expect(ids.indexOf(interactiveLabel.id)).assertEqual(MAX_LEVEL);
      logInfo('testNdkQosResourceModel0010 end');
    })

    /**
     * @tc.number    SUB_QOS_RESMODEL_0011
     * @tc.name      testNdkQosResourceModel0011
     * @tc.desc      Checks the utility and default options point at their own string resources.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testNdkQosResourceModel0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      logInfo('testNdkQosResourceModel0011 begin');
      const options: QosLevelOption[] = buildQosLevelOptions();
      const ids: number[] = labelIdsOf(options);
      logInfo('utility id = ' + ids[1].toString() + ', default id = ' + ids[2].toString());
      expect(options[1].label.id).assertEqual(utilityLabel.id);
      expect(options[2].label.id).assertEqual(defaultLabel.id);
      expect(ids.indexOf(utilityLabel.id)).assertEqual(1);
      expect(ids.indexOf(defaultLabel.id)).assertEqual(2);
      logInfo('testNdkQosResourceModel0011 end');
    })

    /**
     * @tc.number    SUB_QOS_RESMODEL_0012
     * @tc.name      testNdkQosResourceModel0012
     * @tc.desc      Checks the user initiated and deadline options point at their own string resources.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testNdkQosResourceModel0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      logInfo('testNdkQosResourceModel0012 begin');
      const options: QosLevelOption[] = buildQosLevelOptions();
      const ids: number[] = labelIdsOf(options);
      logInfo('user initiated id = ' + ids[3].toString() + ', deadline id = ' + ids[4].toString());
      expect(options[3].label.id).assertEqual(userInitiatedLabel.id);
      expect(options[4].label.id).assertEqual(deadlineLabel.id);
      expect(ids.indexOf(userInitiatedLabel.id)).assertEqual(3);
      expect(ids.indexOf(deadlineLabel.id)).assertEqual(4);
      logInfo('testNdkQosResourceModel0012 end');
    })

    /**
     * @tc.number    SUB_QOS_RESMODEL_0013
     * @tc.name      testNdkQosResourceModel0013
     * @tc.desc      Checks every label identifier stays inside the application resource identifier window.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testNdkQosResourceModel0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      logInfo('testNdkQosResourceModel0013 begin');
      const ids: number[] = labelIdsOf(buildQosLevelOptions());
      let inWindow: number = 0;
      for (let index = 0; index < ids.length; index++) {
        if (ids[index] >= APP_RESOURCE_ID_MIN && ids[index] <= APP_RESOURCE_ID_MAX) {
          inWindow++;
        }
      }
      logInfo('labels in application window = ' + inWindow.toString());
      expect(inWindow).assertEqual(ids.length);
      expect(inWindow).assertEqual(LEVEL_COUNT);
      expect(backgroundLabel.id >= APP_RESOURCE_ID_MIN).assertTrue();
      logInfo('testNdkQosResourceModel0013 end');
    })

    /**
     * @tc.number    SUB_QOS_RESMODEL_0014
     * @tc.name      testNdkQosResourceModel0014
     * @tc.desc      Checks two builds report the same level sequence, so the model is deterministic.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testNdkQosResourceModel0014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      logInfo('testNdkQosResourceModel0014 begin');
      const first: number[] = levelsOf(buildQosLevelOptions());
      const second: number[] = levelsOf(buildQosLevelOptions());
      logInfo('first = ' + JSON.stringify(first) + ', second = ' + JSON.stringify(second));
      expect(sameNumbers(first, second)).assertTrue();
      expect(second.length).assertEqual(LEVEL_COUNT);
      expect(second[MIN_LEVEL]).assertEqual(MIN_LEVEL);
      expect(second[MAX_LEVEL]).assertEqual(MAX_LEVEL);
      logInfo('testNdkQosResourceModel0014 end');
    })

    /**
     * @tc.number    SUB_QOS_RESMODEL_0015
     * @tc.name      testNdkQosResourceModel0015
     * @tc.desc      Checks two builds map every level to the same label identifier.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testNdkQosResourceModel0015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      logInfo('testNdkQosResourceModel0015 begin');
      const firstIds: number[] = labelIdsOf(buildQosLevelOptions());
      const secondIds: number[] = labelIdsOf(buildQosLevelOptions());
      logInfo('first ids = ' + JSON.stringify(firstIds));
      expect(sameNumbers(firstIds, secondIds)).assertTrue();
      expect(secondIds[0]).assertEqual(backgroundLabel.id);
      expect(secondIds[secondIds.length - 1]).assertEqual(interactiveLabel.id);
      logInfo('testNdkQosResourceModel0015 end');
    })

    /**
     * @tc.number    SUB_QOS_RESMODEL_0016
     * @tc.name      testNdkQosResourceModel0016
     * @tc.desc      Checks the options of two builds do not share entries, so editing one leaves the other intact.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testNdkQosResourceModel0016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      logInfo('testNdkQosResourceModel0016 begin');
      const first: QosLevelOption[] = buildQosLevelOptions();
      const second: QosLevelOption[] = buildQosLevelOptions();
      first[0].level = INVALID_LEVEL;
      logInfo('edited level = ' + first[0].level.toString() + ', other level = ' + second[0].level.toString());
      expect(first[0].level).assertEqual(INVALID_LEVEL);
      expect(second[0].level).assertEqual(MIN_LEVEL);
      expect(second[0] instanceof QosLevelOption).assertTrue();
      expect(second.length).assertEqual(LEVEL_COUNT);
      logInfo('testNdkQosResourceModel0016 end');
    })

    /**
     * @tc.number    SUB_QOS_RESMODEL_0017
     * @tc.name      testNdkQosResourceModel0017
     * @tc.desc      Checks a shortened array does not affect the next build, so each call returns its own array.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testNdkQosResourceModel0017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      logInfo('testNdkQosResourceModel0017 begin');
      const first: QosLevelOption[] = buildQosLevelOptions();
      first.pop();
      const rebuilt: QosLevelOption[] = buildQosLevelOptions();
      logInfo('shortened length = ' + first.length.toString() + ', rebuilt length = ' + rebuilt.length.toString());
      expect(first.length).assertEqual(LEVEL_COUNT - 1);
      expect(rebuilt.length).assertEqual(LEVEL_COUNT);
      expect(rebuilt[MAX_LEVEL].level).assertEqual(MAX_LEVEL);
      logInfo('testNdkQosResourceModel0017 end');
    })

    /**
     * @tc.number    SUB_QOS_RESMODEL_0018
     * @tc.name      testNdkQosResourceModel0018
     * @tc.desc      Checks repeated builds do not accumulate options and keep the same level sequence.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testNdkQosResourceModel0018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      logInfo('testNdkQosResourceModel0018 begin');
      const first: number[] = levelsOf(buildQosLevelOptions());
      const second: number[] = levelsOf(buildQosLevelOptions());
      const third: number[] = levelsOf(buildQosLevelOptions());
      logInfo('lengths = ' + first.length.toString() + ', ' + second.length.toString() + ', ' +
        third.length.toString());
      expect(first.length).assertEqual(LEVEL_COUNT);
      expect(second.length).assertEqual(LEVEL_COUNT);
      expect(third.length).assertEqual(LEVEL_COUNT);
      expect(sameNumbers(first, third)).assertTrue();
      logInfo('testNdkQosResourceModel0018 end');
    })

    /**
     * @tc.number    SUB_QOS_RESMODEL_0019
     * @tc.name      testNdkQosResourceModel0019
     * @tc.desc      Checks the option constructor keeps the level and the label resource it was given.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testNdkQosResourceModel0019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      logInfo('testNdkQosResourceModel0019 begin');
      const option: QosLevelOption = new QosLevelOption(2, defaultLabel);
      logInfo('constructed level = ' + option.level.toString() + ', label id = ' + option.label.id.toString());
      expect(option.level).assertEqual(2);
      expect(option.label.id).assertEqual(defaultLabel.id);
      expect(option instanceof QosLevelOption).assertTrue();
      logInfo('testNdkQosResourceModel0019 end');
    })

    /**
     * @tc.number    SUB_QOS_RESMODEL_0020
     * @tc.name      testNdkQosResourceModel0020
     * @tc.desc      Checks two options made from the same arguments stay independent objects with equal fields.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testNdkQosResourceModel0020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      logInfo('testNdkQosResourceModel0020 begin');
      const first: QosLevelOption = new QosLevelOption(3, userInitiatedLabel);
      const second: QosLevelOption = new QosLevelOption(3, userInitiatedLabel);
      first.level = 4;
      logInfo('first level = ' + first.level.toString() + ', second level = ' + second.level.toString());
      expect(first.level).assertEqual(4);
      expect(second.level).assertEqual(3);
      expect(first.label.id).assertEqual(second.label.id);
      expect(second.label.id).assertEqual(userInitiatedLabel.id);
      logInfo('testNdkQosResourceModel0020 end');
    })

    /**
     * @tc.number    SUB_QOS_RESMODEL_0021
     * @tc.name      testNdkQosResourceModel0021
     * @tc.desc      Checks options built with different levels keep different levels and the matching labels.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testNdkQosResourceModel0021', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      logInfo('testNdkQosResourceModel0021 begin');
      const low: QosLevelOption = new QosLevelOption(MIN_LEVEL, backgroundLabel);
      const high: QosLevelOption = new QosLevelOption(MAX_LEVEL, interactiveLabel);
      logInfo('low = ' + JSON.stringify(low.level) + ', high = ' + JSON.stringify(high.level));
      expect(low.level).assertEqual(MIN_LEVEL);
      expect(high.level).assertEqual(MAX_LEVEL);
      expect(low.level === high.level).assertFalse();
      expect(low.label.id === high.label.id).assertFalse();
      logInfo('testNdkQosResourceModel0021 end');
    })

    /**
     * @tc.number    SUB_QOS_RESMODEL_0022
     * @tc.name      testNdkQosResourceModel0022
     * @tc.desc      Checks the highest option level drives a native run that reads back the same level.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testNdkQosResourceModel0022', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      logInfo('testNdkQosResourceModel0022 begin');
      const target: QosLevelOption = buildQosLevelOptions()[MAX_LEVEL];
      const duration: number = testNapi.useQos(target.level);
      const info: QosRunInfo = testNapi.getLastQosInfo();
      const summary: RunSummary = testNapi.getRunSummary();
      logInfo('model level = ' + target.level.toString() + ', duration = ' + duration.toFixed(3) + ' ms');
      expect(isDurationValid(duration)).assertTrue();
      expect(info.queryLevel).assertEqual(target.level);
      expect(summary.lastLevel).assertEqual(target.level);
      expect(Math.abs(info.duration - duration) <= DURATION_TOLERANCE).assertTrue();
      logInfo('testNdkQosResourceModel0022 end');
    })
  })
}
