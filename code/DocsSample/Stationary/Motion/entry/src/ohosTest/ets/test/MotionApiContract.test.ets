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
import { hilog } from '@kit.PerformanceAnalysisKit';
import { describe, it, expect, TestType, Size, Level } from '@ohos/hypium';
import { motion } from '@kit.MultimodalAwarenessKit';

const TAG: string = '[Sample_MotionApiContractTest]';
const DOMAIN: number = 0xF815;

function allInRange(values: number[]): boolean {
  for (const value of values) {
    if (!Number.isInteger(value) || value < 0) {
      return false;
    }
  }
  return true;
}

/**
 * motion Kit 接口与枚举契约（设备无关）
 *
 * 校验对外暴露的订阅/取消订阅/查询能力存在，以及操作手/握持手状态枚举的
 * 取值、唯一性与整数范围，不依赖设备是否支持运动感知。
 */
export default function MotionApiContractTest() {
  describe('MotionApiContractTest', () => {
    /**
     * @tc.number SUB_MOTION_API_0100
     * @tc.name testMotionApi0001
     * @tc.desc Verify motion exposes subscribe, unsubscribe and query functions
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testMotionApi0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMotionApi0001 begin');
      expect(typeof motion.on).assertEqual('function');
      expect(typeof motion.off).assertEqual('function');
      expect(typeof motion.getRecentOperatingHandStatus).assertEqual('function');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMotionApi0001 end');
    });

    /**
     * @tc.number SUB_MOTION_API_0200
     * @tc.name testMotionApi0002
     * @tc.desc Verify OperatingHandStatus keeps its documented numeric values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testMotionApi0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMotionApi0002 begin');
      expect(motion.OperatingHandStatus.UNKNOWN_STATUS).assertEqual(0);
      expect(motion.OperatingHandStatus.LEFT_HAND_OPERATED).assertEqual(1);
      expect(motion.OperatingHandStatus.RIGHT_HAND_OPERATED).assertEqual(2);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMotionApi0002 end');
    });

    /**
     * @tc.number SUB_MOTION_API_0300
     * @tc.name testMotionApi0003
     * @tc.desc Verify OperatingHandStatus members are distinct and integers
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testMotionApi0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMotionApi0003 begin');
      const values: number[] = [
        motion.OperatingHandStatus.UNKNOWN_STATUS,
        motion.OperatingHandStatus.LEFT_HAND_OPERATED,
        motion.OperatingHandStatus.RIGHT_HAND_OPERATED
      ];
      expect(values.length).assertEqual(3);
      expect(new Set<number>(values).size).assertEqual(3);
      expect(allInRange(values)).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMotionApi0003 end');
    });

    /**
     * @tc.number SUB_MOTION_API_0400
     * @tc.name testMotionApi0004
     * @tc.desc Verify HoldingHandStatus keeps its documented numeric values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testMotionApi0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMotionApi0004 begin');
      expect(motion.HoldingHandStatus.NOT_HELD).assertEqual(0);
      expect(motion.HoldingHandStatus.LEFT_HAND_HELD).assertEqual(1);
      expect(motion.HoldingHandStatus.RIGHT_HAND_HELD).assertEqual(2);
      expect(motion.HoldingHandStatus.BOTH_HANDS_HELD).assertEqual(3);
      expect(motion.HoldingHandStatus.UNKNOWN_STATUS).assertEqual(16);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMotionApi0004 end');
    });

    /**
     * @tc.number SUB_MOTION_API_0500
     * @tc.name testMotionApi0005
     * @tc.desc Verify HoldingHandStatus members are distinct and integers
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testMotionApi0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMotionApi0005 begin');
      const values: number[] = [
        motion.HoldingHandStatus.NOT_HELD,
        motion.HoldingHandStatus.LEFT_HAND_HELD,
        motion.HoldingHandStatus.RIGHT_HAND_HELD,
        motion.HoldingHandStatus.BOTH_HANDS_HELD,
        motion.HoldingHandStatus.UNKNOWN_STATUS
      ];
      expect(values.length).assertEqual(5);
      expect(new Set<number>(values).size).assertEqual(5);
      expect(allInRange(values)).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMotionApi0005 end');
    });

    /**
     * @tc.number SUB_MOTION_API_0600
     * @tc.name testMotionApi0006
     * @tc.desc Verify HoldingHandStatus exposes the documented member set
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL1
     */
    it('testMotionApi0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMotionApi0006 begin');
      const documented: number[] = [0, 1, 2, 3, 16];
      const members: number[] = [
        motion.HoldingHandStatus.NOT_HELD,
        motion.HoldingHandStatus.LEFT_HAND_HELD,
        motion.HoldingHandStatus.RIGHT_HAND_HELD,
        motion.HoldingHandStatus.BOTH_HANDS_HELD,
        motion.HoldingHandStatus.UNKNOWN_STATUS
      ];
      let matched: number = 0;
      for (const member of members) {
        if (documented.indexOf(Number(member)) >= 0) {
          matched++;
        }
      }
      expect(matched).assertEqual(documented.length);
      expect('testMotionApi0006'.length > 0).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMotionApi0006 end');
    });
  });
}
