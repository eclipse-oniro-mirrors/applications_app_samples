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
import { ResourceUtils } from '../../../../main/ets/utils/ResourceUtils';
const LOG_DOMAIN: number = 0xF811;
const LOG_TAG: string = '[Sample_ResourceManager]';

export default function resourceUtilsSameResTest() {
  describe('ResourceUtilsSameResTest', () => {

    /**
     * @tc.name   testResourceUtilsSameRes0001
     * @tc.number SUB_RESMGR_UTILS27_0001
     * @tc.desc   two distinct objects with id 100 address the same resource
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsSameRes0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsSameRes0001 begin');
      const leftKey: string = ResourceUtils.resourceKey({ bundleName: 'ohos.samples.resourcemanager',
        moduleName: 'entry', id: 100 });
      const rightKey: string = ResourceUtils.resourceKey({ bundleName: 'ohos.samples.resourcemanager',
        moduleName: 'entry', id: 100 });
      const reverseSame: boolean = ResourceUtils.isSameResource({ bundleName: 'ohos.samples.resourcemanager',
        moduleName: 'entry', id: 100 }, { bundleName: 'ohos.samples.resourcemanager', moduleName: 'entry', id: 100 });
      const forwardSame: boolean = ResourceUtils.isSameResource({ bundleName: 'ohos.samples.resourcemanager',
        moduleName: 'entry', id: 100 }, { bundleName: 'ohos.samples.resourcemanager', moduleName: 'entry', id: 100 });
      const result: string = String(forwardSame);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('true'));
      expect(result).assertEqual('true');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(String(reverseSame)), String('true'));
      expect(String(reverseSame)).assertEqual('true');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(String(leftKey === rightKey)), String('true'));
      expect(String(leftKey === rightKey)).assertEqual('true');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsSameRes0001 end');
    })

    /**
     * @tc.name   testResourceUtilsSameRes0002
     * @tc.number SUB_RESMGR_UTILS27_0002
     * @tc.desc   two distinct objects with id 101 address the same resource
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsSameRes0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsSameRes0002 begin');
      const leftKey: string = ResourceUtils.resourceKey({ bundleName: 'ohos.samples.resourcemanager',
        moduleName: 'entry', id: 101 });
      const rightKey: string = ResourceUtils.resourceKey({ bundleName: 'ohos.samples.resourcemanager',
        moduleName: 'entry', id: 101 });
      const reverseSame: boolean = ResourceUtils.isSameResource({ bundleName: 'ohos.samples.resourcemanager',
        moduleName: 'entry', id: 101 }, { bundleName: 'ohos.samples.resourcemanager', moduleName: 'entry', id: 101 });
      const forwardSame: boolean = ResourceUtils.isSameResource({ bundleName: 'ohos.samples.resourcemanager',
        moduleName: 'entry', id: 101 }, { bundleName: 'ohos.samples.resourcemanager', moduleName: 'entry', id: 101 });
      const result: string = String(forwardSame);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('true'));
      expect(result).assertEqual('true');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(String(reverseSame)), String('true'));
      expect(String(reverseSame)).assertEqual('true');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(String(leftKey === rightKey)), String('true'));
      expect(String(leftKey === rightKey)).assertEqual('true');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsSameRes0002 end');
    })

    /**
     * @tc.name   testResourceUtilsSameRes0003
     * @tc.number SUB_RESMGR_UTILS27_0003
     * @tc.desc   two distinct objects with id 102 address the same resource
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsSameRes0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsSameRes0003 begin');
      const leftKey: string = ResourceUtils.resourceKey({ bundleName: 'ohos.samples.resourcemanager',
        moduleName: 'entry', id: 102 });
      const rightKey: string = ResourceUtils.resourceKey({ bundleName: 'ohos.samples.resourcemanager',
        moduleName: 'entry', id: 102 });
      const reverseSame: boolean = ResourceUtils.isSameResource({ bundleName: 'ohos.samples.resourcemanager',
        moduleName: 'entry', id: 102 }, { bundleName: 'ohos.samples.resourcemanager', moduleName: 'entry', id: 102 });
      const forwardSame: boolean = ResourceUtils.isSameResource({ bundleName: 'ohos.samples.resourcemanager',
        moduleName: 'entry', id: 102 }, { bundleName: 'ohos.samples.resourcemanager', moduleName: 'entry', id: 102 });
      const result: string = String(forwardSame);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('true'));
      expect(result).assertEqual('true');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(String(reverseSame)), String('true'));
      expect(String(reverseSame)).assertEqual('true');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(String(leftKey === rightKey)), String('true'));
      expect(String(leftKey === rightKey)).assertEqual('true');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsSameRes0003 end');
    })

    /**
     * @tc.name   testResourceUtilsSameRes0004
     * @tc.number SUB_RESMGR_UTILS27_0004
     * @tc.desc   two distinct objects with id 103 address the same resource
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsSameRes0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsSameRes0004 begin');
      const leftKey: string = ResourceUtils.resourceKey({ bundleName: 'ohos.samples.resourcemanager',
        moduleName: 'entry', id: 103 });
      const rightKey: string = ResourceUtils.resourceKey({ bundleName: 'ohos.samples.resourcemanager',
        moduleName: 'entry', id: 103 });
      const reverseSame: boolean = ResourceUtils.isSameResource({ bundleName: 'ohos.samples.resourcemanager',
        moduleName: 'entry', id: 103 }, { bundleName: 'ohos.samples.resourcemanager', moduleName: 'entry', id: 103 });
      const forwardSame: boolean = ResourceUtils.isSameResource({ bundleName: 'ohos.samples.resourcemanager',
        moduleName: 'entry', id: 103 }, { bundleName: 'ohos.samples.resourcemanager', moduleName: 'entry', id: 103 });
      const result: string = String(forwardSame);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('true'));
      expect(result).assertEqual('true');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(String(reverseSame)), String('true'));
      expect(String(reverseSame)).assertEqual('true');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(String(leftKey === rightKey)), String('true'));
      expect(String(leftKey === rightKey)).assertEqual('true');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsSameRes0004 end');
    })

    /**
     * @tc.name   testResourceUtilsSameRes0005
     * @tc.number SUB_RESMGR_UTILS27_0005
     * @tc.desc   two distinct objects with id 104 address the same resource
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsSameRes0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsSameRes0005 begin');
      const leftKey: string = ResourceUtils.resourceKey({ bundleName: 'ohos.samples.resourcemanager',
        moduleName: 'entry', id: 104 });
      const rightKey: string = ResourceUtils.resourceKey({ bundleName: 'ohos.samples.resourcemanager',
        moduleName: 'entry', id: 104 });
      const reverseSame: boolean = ResourceUtils.isSameResource({ bundleName: 'ohos.samples.resourcemanager',
        moduleName: 'entry', id: 104 }, { bundleName: 'ohos.samples.resourcemanager', moduleName: 'entry', id: 104 });
      const forwardSame: boolean = ResourceUtils.isSameResource({ bundleName: 'ohos.samples.resourcemanager',
        moduleName: 'entry', id: 104 }, { bundleName: 'ohos.samples.resourcemanager', moduleName: 'entry', id: 104 });
      const result: string = String(forwardSame);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('true'));
      expect(result).assertEqual('true');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(String(reverseSame)), String('true'));
      expect(String(reverseSame)).assertEqual('true');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(String(leftKey === rightKey)), String('true'));
      expect(String(leftKey === rightKey)).assertEqual('true');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsSameRes0005 end');
    })

    /**
     * @tc.name   testResourceUtilsSameRes0006
     * @tc.number SUB_RESMGR_UTILS27_0006
     * @tc.desc   two distinct objects with id 105 address the same resource
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsSameRes0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsSameRes0006 begin');
      const leftKey: string = ResourceUtils.resourceKey({ bundleName: 'ohos.samples.resourcemanager',
        moduleName: 'entry', id: 105 });
      const rightKey: string = ResourceUtils.resourceKey({ bundleName: 'ohos.samples.resourcemanager',
        moduleName: 'entry', id: 105 });
      const reverseSame: boolean = ResourceUtils.isSameResource({ bundleName: 'ohos.samples.resourcemanager',
        moduleName: 'entry', id: 105 }, { bundleName: 'ohos.samples.resourcemanager', moduleName: 'entry', id: 105 });
      const forwardSame: boolean = ResourceUtils.isSameResource({ bundleName: 'ohos.samples.resourcemanager',
        moduleName: 'entry', id: 105 }, { bundleName: 'ohos.samples.resourcemanager', moduleName: 'entry', id: 105 });
      const result: string = String(forwardSame);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('true'));
      expect(result).assertEqual('true');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(String(reverseSame)), String('true'));
      expect(String(reverseSame)).assertEqual('true');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(String(leftKey === rightKey)), String('true'));
      expect(String(leftKey === rightKey)).assertEqual('true');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsSameRes0006 end');
    })

    /**
     * @tc.name   testResourceUtilsSameRes0007
     * @tc.number SUB_RESMGR_UTILS27_0007
     * @tc.desc   two distinct objects with id 106 address the same resource
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsSameRes0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsSameRes0007 begin');
      const leftKey: string = ResourceUtils.resourceKey({ bundleName: 'ohos.samples.resourcemanager',
        moduleName: 'entry', id: 106 });
      const rightKey: string = ResourceUtils.resourceKey({ bundleName: 'ohos.samples.resourcemanager',
        moduleName: 'entry', id: 106 });
      const reverseSame: boolean = ResourceUtils.isSameResource({ bundleName: 'ohos.samples.resourcemanager',
        moduleName: 'entry', id: 106 }, { bundleName: 'ohos.samples.resourcemanager', moduleName: 'entry', id: 106 });
      const forwardSame: boolean = ResourceUtils.isSameResource({ bundleName: 'ohos.samples.resourcemanager',
        moduleName: 'entry', id: 106 }, { bundleName: 'ohos.samples.resourcemanager', moduleName: 'entry', id: 106 });
      const result: string = String(forwardSame);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('true'));
      expect(result).assertEqual('true');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(String(reverseSame)), String('true'));
      expect(String(reverseSame)).assertEqual('true');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(String(leftKey === rightKey)), String('true'));
      expect(String(leftKey === rightKey)).assertEqual('true');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsSameRes0007 end');
    })

    /**
     * @tc.name   testResourceUtilsSameRes0008
     * @tc.number SUB_RESMGR_UTILS27_0008
     * @tc.desc   two distinct objects with id 107 address the same resource
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsSameRes0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsSameRes0008 begin');
      const leftKey: string = ResourceUtils.resourceKey({ bundleName: 'ohos.samples.resourcemanager',
        moduleName: 'entry', id: 107 });
      const rightKey: string = ResourceUtils.resourceKey({ bundleName: 'ohos.samples.resourcemanager',
        moduleName: 'entry', id: 107 });
      const reverseSame: boolean = ResourceUtils.isSameResource({ bundleName: 'ohos.samples.resourcemanager',
        moduleName: 'entry', id: 107 }, { bundleName: 'ohos.samples.resourcemanager', moduleName: 'entry', id: 107 });
      const forwardSame: boolean = ResourceUtils.isSameResource({ bundleName: 'ohos.samples.resourcemanager',
        moduleName: 'entry', id: 107 }, { bundleName: 'ohos.samples.resourcemanager', moduleName: 'entry', id: 107 });
      const result: string = String(forwardSame);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('true'));
      expect(result).assertEqual('true');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(String(reverseSame)), String('true'));
      expect(String(reverseSame)).assertEqual('true');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(String(leftKey === rightKey)), String('true'));
      expect(String(leftKey === rightKey)).assertEqual('true');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsSameRes0008 end');
    })

    /**
     * @tc.name   testResourceUtilsSameRes0009
     * @tc.number SUB_RESMGR_UTILS27_0009
     * @tc.desc   id 100 and id 101 address different resources
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsSameRes0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsSameRes0009 begin');
      const leftKey: string = ResourceUtils.resourceKey({ bundleName: 'ohos.samples.resourcemanager',
        moduleName: 'entry', id: 100 });
      const rightKey: string = ResourceUtils.resourceKey({ bundleName: 'ohos.samples.resourcemanager',
        moduleName: 'entry', id: 101 });
      const reverseSame: boolean = ResourceUtils.isSameResource({ bundleName: 'ohos.samples.resourcemanager',
        moduleName: 'entry', id: 101 }, { bundleName: 'ohos.samples.resourcemanager', moduleName: 'entry', id: 100 });
      const forwardSame: boolean = ResourceUtils.isSameResource({ bundleName: 'ohos.samples.resourcemanager',
        moduleName: 'entry', id: 100 }, { bundleName: 'ohos.samples.resourcemanager', moduleName: 'entry', id: 101 });
      const result: string = String(forwardSame);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('false'));
      expect(result).assertEqual('false');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(String(reverseSame)), String('false'));
      expect(String(reverseSame)).assertEqual('false');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(String(leftKey === rightKey)), String('false'));
      expect(String(leftKey === rightKey)).assertEqual('false');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsSameRes0009 end');
    })

    /**
     * @tc.name   testResourceUtilsSameRes0010
     * @tc.number SUB_RESMGR_UTILS27_0010
     * @tc.desc   id 101 and id 102 address different resources
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsSameRes0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsSameRes0010 begin');
      const leftKey: string = ResourceUtils.resourceKey({ bundleName: 'ohos.samples.resourcemanager',
        moduleName: 'entry', id: 101 });
      const rightKey: string = ResourceUtils.resourceKey({ bundleName: 'ohos.samples.resourcemanager',
        moduleName: 'entry', id: 102 });
      const reverseSame: boolean = ResourceUtils.isSameResource({ bundleName: 'ohos.samples.resourcemanager',
        moduleName: 'entry', id: 102 }, { bundleName: 'ohos.samples.resourcemanager', moduleName: 'entry', id: 101 });
      const forwardSame: boolean = ResourceUtils.isSameResource({ bundleName: 'ohos.samples.resourcemanager',
        moduleName: 'entry', id: 101 }, { bundleName: 'ohos.samples.resourcemanager', moduleName: 'entry', id: 102 });
      const result: string = String(forwardSame);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('false'));
      expect(result).assertEqual('false');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(String(reverseSame)), String('false'));
      expect(String(reverseSame)).assertEqual('false');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(String(leftKey === rightKey)), String('false'));
      expect(String(leftKey === rightKey)).assertEqual('false');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsSameRes0010 end');
    })

    /**
     * @tc.name   testResourceUtilsSameRes0011
     * @tc.number SUB_RESMGR_UTILS27_0011
     * @tc.desc   id 102 and id 103 address different resources
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsSameRes0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsSameRes0011 begin');
      const leftKey: string = ResourceUtils.resourceKey({ bundleName: 'ohos.samples.resourcemanager',
        moduleName: 'entry', id: 102 });
      const rightKey: string = ResourceUtils.resourceKey({ bundleName: 'ohos.samples.resourcemanager',
        moduleName: 'entry', id: 103 });
      const reverseSame: boolean = ResourceUtils.isSameResource({ bundleName: 'ohos.samples.resourcemanager',
        moduleName: 'entry', id: 103 }, { bundleName: 'ohos.samples.resourcemanager', moduleName: 'entry', id: 102 });
      const forwardSame: boolean = ResourceUtils.isSameResource({ bundleName: 'ohos.samples.resourcemanager',
        moduleName: 'entry', id: 102 }, { bundleName: 'ohos.samples.resourcemanager', moduleName: 'entry', id: 103 });
      const result: string = String(forwardSame);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('false'));
      expect(result).assertEqual('false');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(String(reverseSame)), String('false'));
      expect(String(reverseSame)).assertEqual('false');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(String(leftKey === rightKey)), String('false'));
      expect(String(leftKey === rightKey)).assertEqual('false');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsSameRes0011 end');
    })

    /**
     * @tc.name   testResourceUtilsSameRes0012
     * @tc.number SUB_RESMGR_UTILS27_0012
     * @tc.desc   id 103 and id 104 address different resources
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsSameRes0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsSameRes0012 begin');
      const leftKey: string = ResourceUtils.resourceKey({ bundleName: 'ohos.samples.resourcemanager',
        moduleName: 'entry', id: 103 });
      const rightKey: string = ResourceUtils.resourceKey({ bundleName: 'ohos.samples.resourcemanager',
        moduleName: 'entry', id: 104 });
      const reverseSame: boolean = ResourceUtils.isSameResource({ bundleName: 'ohos.samples.resourcemanager',
        moduleName: 'entry', id: 104 }, { bundleName: 'ohos.samples.resourcemanager', moduleName: 'entry', id: 103 });
      const forwardSame: boolean = ResourceUtils.isSameResource({ bundleName: 'ohos.samples.resourcemanager',
        moduleName: 'entry', id: 103 }, { bundleName: 'ohos.samples.resourcemanager', moduleName: 'entry', id: 104 });
      const result: string = String(forwardSame);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('false'));
      expect(result).assertEqual('false');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(String(reverseSame)), String('false'));
      expect(String(reverseSame)).assertEqual('false');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(String(leftKey === rightKey)), String('false'));
      expect(String(leftKey === rightKey)).assertEqual('false');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsSameRes0012 end');
    })

    /**
     * @tc.name   testResourceUtilsSameRes0013
     * @tc.number SUB_RESMGR_UTILS27_0013
     * @tc.desc   id 104 and id 105 address different resources
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsSameRes0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsSameRes0013 begin');
      const leftKey: string = ResourceUtils.resourceKey({ bundleName: 'ohos.samples.resourcemanager',
        moduleName: 'entry', id: 104 });
      const rightKey: string = ResourceUtils.resourceKey({ bundleName: 'ohos.samples.resourcemanager',
        moduleName: 'entry', id: 105 });
      const reverseSame: boolean = ResourceUtils.isSameResource({ bundleName: 'ohos.samples.resourcemanager',
        moduleName: 'entry', id: 105 }, { bundleName: 'ohos.samples.resourcemanager', moduleName: 'entry', id: 104 });
      const forwardSame: boolean = ResourceUtils.isSameResource({ bundleName: 'ohos.samples.resourcemanager',
        moduleName: 'entry', id: 104 }, { bundleName: 'ohos.samples.resourcemanager', moduleName: 'entry', id: 105 });
      const result: string = String(forwardSame);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('false'));
      expect(result).assertEqual('false');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(String(reverseSame)), String('false'));
      expect(String(reverseSame)).assertEqual('false');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(String(leftKey === rightKey)), String('false'));
      expect(String(leftKey === rightKey)).assertEqual('false');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsSameRes0013 end');
    })

    /**
     * @tc.name   testResourceUtilsSameRes0014
     * @tc.number SUB_RESMGR_UTILS27_0014
     * @tc.desc   id 105 and id 106 address different resources
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsSameRes0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsSameRes0014 begin');
      const leftKey: string = ResourceUtils.resourceKey({ bundleName: 'ohos.samples.resourcemanager',
        moduleName: 'entry', id: 105 });
      const rightKey: string = ResourceUtils.resourceKey({ bundleName: 'ohos.samples.resourcemanager',
        moduleName: 'entry', id: 106 });
      const reverseSame: boolean = ResourceUtils.isSameResource({ bundleName: 'ohos.samples.resourcemanager',
        moduleName: 'entry', id: 106 }, { bundleName: 'ohos.samples.resourcemanager', moduleName: 'entry', id: 105 });
      const forwardSame: boolean = ResourceUtils.isSameResource({ bundleName: 'ohos.samples.resourcemanager',
        moduleName: 'entry', id: 105 }, { bundleName: 'ohos.samples.resourcemanager', moduleName: 'entry', id: 106 });
      const result: string = String(forwardSame);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('false'));
      expect(result).assertEqual('false');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(String(reverseSame)), String('false'));
      expect(String(reverseSame)).assertEqual('false');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(String(leftKey === rightKey)), String('false'));
      expect(String(leftKey === rightKey)).assertEqual('false');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsSameRes0014 end');
    })

    /**
     * @tc.name   testResourceUtilsSameRes0015
     * @tc.number SUB_RESMGR_UTILS27_0015
     * @tc.desc   id 106 and id 107 address different resources
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsSameRes0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsSameRes0015 begin');
      const leftKey: string = ResourceUtils.resourceKey({ bundleName: 'ohos.samples.resourcemanager',
        moduleName: 'entry', id: 106 });
      const rightKey: string = ResourceUtils.resourceKey({ bundleName: 'ohos.samples.resourcemanager',
        moduleName: 'entry', id: 107 });
      const reverseSame: boolean = ResourceUtils.isSameResource({ bundleName: 'ohos.samples.resourcemanager',
        moduleName: 'entry', id: 107 }, { bundleName: 'ohos.samples.resourcemanager', moduleName: 'entry', id: 106 });
      const forwardSame: boolean = ResourceUtils.isSameResource({ bundleName: 'ohos.samples.resourcemanager',
        moduleName: 'entry', id: 106 }, { bundleName: 'ohos.samples.resourcemanager', moduleName: 'entry', id: 107 });
      const result: string = String(forwardSame);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('false'));
      expect(result).assertEqual('false');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(String(reverseSame)), String('false'));
      expect(String(reverseSame)).assertEqual('false');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(String(leftKey === rightKey)), String('false'));
      expect(String(leftKey === rightKey)).assertEqual('false');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsSameRes0015 end');
    })

    /**
     * @tc.name   testResourceUtilsSameRes0016
     * @tc.number SUB_RESMGR_UTILS27_0016
     * @tc.desc   id 107 and id 108 address different resources
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsSameRes0016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsSameRes0016 begin');
      const leftKey: string = ResourceUtils.resourceKey({ bundleName: 'ohos.samples.resourcemanager',
        moduleName: 'entry', id: 107 });
      const rightKey: string = ResourceUtils.resourceKey({ bundleName: 'ohos.samples.resourcemanager',
        moduleName: 'entry', id: 108 });
      const reverseSame: boolean = ResourceUtils.isSameResource({ bundleName: 'ohos.samples.resourcemanager',
        moduleName: 'entry', id: 108 }, { bundleName: 'ohos.samples.resourcemanager', moduleName: 'entry', id: 107 });
      const forwardSame: boolean = ResourceUtils.isSameResource({ bundleName: 'ohos.samples.resourcemanager',
        moduleName: 'entry', id: 107 }, { bundleName: 'ohos.samples.resourcemanager', moduleName: 'entry', id: 108 });
      const result: string = String(forwardSame);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('false'));
      expect(result).assertEqual('false');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(String(reverseSame)), String('false'));
      expect(String(reverseSame)).assertEqual('false');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(String(leftKey === rightKey)), String('false'));
      expect(String(leftKey === rightKey)).assertEqual('false');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsSameRes0016 end');
    })

    /**
     * @tc.name   testResourceUtilsSameRes0017
     * @tc.number SUB_RESMGR_UTILS27_0017
     * @tc.desc   bundle other.bundle differs from the sample bundle
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsSameRes0017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsSameRes0017 begin');
      const leftKey: string = ResourceUtils.resourceKey({ bundleName: 'ohos.samples.resourcemanager',
        moduleName: 'entry', id: 100 });
      const rightKey: string = ResourceUtils.resourceKey({ bundleName: 'other.bundle', moduleName: 'entry', id: 100 });
      const reverseSame: boolean = ResourceUtils.isSameResource({ bundleName: 'other.bundle', moduleName: 'entry',
        id: 100 }, { bundleName: 'ohos.samples.resourcemanager', moduleName: 'entry', id: 100 });
      const forwardSame: boolean = ResourceUtils.isSameResource({ bundleName: 'ohos.samples.resourcemanager',
        moduleName: 'entry', id: 100 }, { bundleName: 'other.bundle', moduleName: 'entry', id: 100 });
      const result: string = String(forwardSame);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('false'));
      expect(result).assertEqual('false');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(String(reverseSame)), String('false'));
      expect(String(reverseSame)).assertEqual('false');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(String(leftKey === rightKey)), String('false'));
      expect(String(leftKey === rightKey)).assertEqual('false');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsSameRes0017 end');
    })

    /**
     * @tc.name   testResourceUtilsSameRes0018
     * @tc.number SUB_RESMGR_UTILS27_0018
     * @tc.desc   bundle Ohos.Samples.ResourceManager differs from the sample bundle
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsSameRes0018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsSameRes0018 begin');
      const leftKey: string = ResourceUtils.resourceKey({ bundleName: 'ohos.samples.resourcemanager',
        moduleName: 'entry', id: 100 });
      const rightKey: string = ResourceUtils.resourceKey({ bundleName: 'Ohos.Samples.ResourceManager',
        moduleName: 'entry', id: 100 });
      const reverseSame: boolean = ResourceUtils.isSameResource({ bundleName: 'Ohos.Samples.ResourceManager',
        moduleName: 'entry', id: 100 }, { bundleName: 'ohos.samples.resourcemanager', moduleName: 'entry', id: 100 });
      const forwardSame: boolean = ResourceUtils.isSameResource({ bundleName: 'ohos.samples.resourcemanager',
        moduleName: 'entry', id: 100 }, { bundleName: 'Ohos.Samples.ResourceManager', moduleName: 'entry', id: 100 });
      const result: string = String(forwardSame);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('false'));
      expect(result).assertEqual('false');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(String(reverseSame)), String('false'));
      expect(String(reverseSame)).assertEqual('false');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(String(leftKey === rightKey)), String('false'));
      expect(String(leftKey === rightKey)).assertEqual('false');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsSameRes0018 end');
    })

    /**
     * @tc.name   testResourceUtilsSameRes0019
     * @tc.number SUB_RESMGR_UTILS27_0019
     * @tc.desc   bundle ohos.samples.resourcemanager2 differs from the sample bundle
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsSameRes0019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsSameRes0019 begin');
      const leftKey: string = ResourceUtils.resourceKey({ bundleName: 'ohos.samples.resourcemanager',
        moduleName: 'entry', id: 100 });
      const rightKey: string = ResourceUtils.resourceKey({ bundleName: 'ohos.samples.resourcemanager2',
        moduleName: 'entry', id: 100 });
      const reverseSame: boolean = ResourceUtils.isSameResource({ bundleName: 'ohos.samples.resourcemanager2',
        moduleName: 'entry', id: 100 }, { bundleName: 'ohos.samples.resourcemanager', moduleName: 'entry', id: 100 });
      const forwardSame: boolean = ResourceUtils.isSameResource({ bundleName: 'ohos.samples.resourcemanager',
        moduleName: 'entry', id: 100 }, { bundleName: 'ohos.samples.resourcemanager2', moduleName: 'entry', id: 100 });
      const result: string = String(forwardSame);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('false'));
      expect(result).assertEqual('false');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(String(reverseSame)), String('false'));
      expect(String(reverseSame)).assertEqual('false');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(String(leftKey === rightKey)), String('false'));
      expect(String(leftKey === rightKey)).assertEqual('false');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsSameRes0019 end');
    })

    /**
     * @tc.name   testResourceUtilsSameRes0020
     * @tc.number SUB_RESMGR_UTILS27_0020
     * @tc.desc   bundle ohos differs from the sample bundle
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsSameRes0020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsSameRes0020 begin');
      const leftKey: string = ResourceUtils.resourceKey({ bundleName: 'ohos.samples.resourcemanager',
        moduleName: 'entry', id: 100 });
      const rightKey: string = ResourceUtils.resourceKey({ bundleName: 'ohos', moduleName: 'entry', id: 100 });
      const reverseSame: boolean = ResourceUtils.isSameResource({ bundleName: 'ohos', moduleName: 'entry', id: 100 },
        { bundleName: 'ohos.samples.resourcemanager', moduleName: 'entry', id: 100 });
      const forwardSame: boolean = ResourceUtils.isSameResource({ bundleName: 'ohos.samples.resourcemanager',
        moduleName: 'entry', id: 100 }, { bundleName: 'ohos', moduleName: 'entry', id: 100 });
      const result: string = String(forwardSame);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('false'));
      expect(result).assertEqual('false');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(String(reverseSame)), String('false'));
      expect(String(reverseSame)).assertEqual('false');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(String(leftKey === rightKey)), String('false'));
      expect(String(leftKey === rightKey)).assertEqual('false');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsSameRes0020 end');
    })

    /**
     * @tc.name   testResourceUtilsSameRes0021
     * @tc.number SUB_RESMGR_UTILS27_0021
     * @tc.desc   module libraryOverlay differs from entry
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsSameRes0021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsSameRes0021 begin');
      const leftKey: string = ResourceUtils.resourceKey({ bundleName: 'ohos.samples.resourcemanager',
        moduleName: 'entry', id: 100 });
      const rightKey: string = ResourceUtils.resourceKey({ bundleName: 'ohos.samples.resourcemanager',
        moduleName: 'libraryOverlay', id: 100 });
      const reverseSame: boolean = ResourceUtils.isSameResource({ bundleName: 'ohos.samples.resourcemanager',
        moduleName: 'libraryOverlay', id: 100 }, { bundleName: 'ohos.samples.resourcemanager', moduleName: 'entry',
          id: 100 });
      const forwardSame: boolean = ResourceUtils.isSameResource({ bundleName: 'ohos.samples.resourcemanager',
        moduleName: 'entry', id: 100 }, { bundleName: 'ohos.samples.resourcemanager', moduleName: 'libraryOverlay',
          id: 100 });
      const result: string = String(forwardSame);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('false'));
      expect(result).assertEqual('false');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(String(reverseSame)), String('false'));
      expect(String(reverseSame)).assertEqual('false');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(String(leftKey === rightKey)), String('false'));
      expect(String(leftKey === rightKey)).assertEqual('false');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsSameRes0021 end');
    })

    /**
     * @tc.name   testResourceUtilsSameRes0022
     * @tc.number SUB_RESMGR_UTILS27_0022
     * @tc.desc   module libraryRuntimeOverlay differs from entry
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsSameRes0022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsSameRes0022 begin');
      const leftKey: string = ResourceUtils.resourceKey({ bundleName: 'ohos.samples.resourcemanager',
        moduleName: 'entry', id: 100 });
      const rightKey: string = ResourceUtils.resourceKey({ bundleName: 'ohos.samples.resourcemanager',
        moduleName: 'libraryRuntimeOverlay', id: 100 });
      const reverseSame: boolean = ResourceUtils.isSameResource({ bundleName: 'ohos.samples.resourcemanager',
        moduleName: 'libraryRuntimeOverlay', id: 100 }, { bundleName: 'ohos.samples.resourcemanager',
          moduleName: 'entry', id: 100 });
      const forwardSame: boolean = ResourceUtils.isSameResource({ bundleName: 'ohos.samples.resourcemanager',
        moduleName: 'entry', id: 100 }, { bundleName: 'ohos.samples.resourcemanager',
          moduleName: 'libraryRuntimeOverlay', id: 100 });
      const result: string = String(forwardSame);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('false'));
      expect(result).assertEqual('false');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(String(reverseSame)), String('false'));
      expect(String(reverseSame)).assertEqual('false');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(String(leftKey === rightKey)), String('false'));
      expect(String(leftKey === rightKey)).assertEqual('false');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsSameRes0022 end');
    })

    /**
     * @tc.name   testResourceUtilsSameRes0023
     * @tc.number SUB_RESMGR_UTILS27_0023
     * @tc.desc   module entry2 differs from entry
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsSameRes0023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsSameRes0023 begin');
      const leftKey: string = ResourceUtils.resourceKey({ bundleName: 'ohos.samples.resourcemanager',
        moduleName: 'entry', id: 100 });
      const rightKey: string = ResourceUtils.resourceKey({ bundleName: 'ohos.samples.resourcemanager',
        moduleName: 'entry2', id: 100 });
      const reverseSame: boolean = ResourceUtils.isSameResource({ bundleName: 'ohos.samples.resourcemanager',
        moduleName: 'entry2', id: 100 }, { bundleName: 'ohos.samples.resourcemanager', moduleName: 'entry', id: 100 });
      const forwardSame: boolean = ResourceUtils.isSameResource({ bundleName: 'ohos.samples.resourcemanager',
        moduleName: 'entry', id: 100 }, { bundleName: 'ohos.samples.resourcemanager', moduleName: 'entry2', id: 100 });
      const result: string = String(forwardSame);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('false'));
      expect(result).assertEqual('false');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(String(reverseSame)), String('false'));
      expect(String(reverseSame)).assertEqual('false');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(String(leftKey === rightKey)), String('false'));
      expect(String(leftKey === rightKey)).assertEqual('false');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsSameRes0023 end');
    })

    /**
     * @tc.name   testResourceUtilsSameRes0024
     * @tc.number SUB_RESMGR_UTILS27_0024
     * @tc.desc   module Entry differs from entry
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsSameRes0024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsSameRes0024 begin');
      const leftKey: string = ResourceUtils.resourceKey({ bundleName: 'ohos.samples.resourcemanager',
        moduleName: 'entry', id: 100 });
      const rightKey: string = ResourceUtils.resourceKey({ bundleName: 'ohos.samples.resourcemanager',
        moduleName: 'Entry', id: 100 });
      const reverseSame: boolean = ResourceUtils.isSameResource({ bundleName: 'ohos.samples.resourcemanager',
        moduleName: 'Entry', id: 100 }, { bundleName: 'ohos.samples.resourcemanager', moduleName: 'entry', id: 100 });
      const forwardSame: boolean = ResourceUtils.isSameResource({ bundleName: 'ohos.samples.resourcemanager',
        moduleName: 'entry', id: 100 }, { bundleName: 'ohos.samples.resourcemanager', moduleName: 'Entry', id: 100 });
      const result: string = String(forwardSame);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('false'));
      expect(result).assertEqual('false');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(String(reverseSame)), String('false'));
      expect(String(reverseSame)).assertEqual('false');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(String(leftKey === rightKey)), String('false'));
      expect(String(leftKey === rightKey)).assertEqual('false');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsSameRes0024 end');
    })

    /**
     * @tc.name   testResourceUtilsSameRes0025
     * @tc.number SUB_RESMGR_UTILS27_0025
     * @tc.desc   omitted bundleName and empty bundleName both fall back to '-' for id 200
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsSameRes0025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsSameRes0025 begin');
      const leftKey: string = ResourceUtils.resourceKey({ bundleName: '', moduleName: 'entry', id: 200 });
      const rightKey: string = ResourceUtils.resourceKey({ bundleName: '', moduleName: 'entry', id: 200 });
      const reverseSame: boolean = ResourceUtils.isSameResource({ bundleName: '', moduleName: 'entry', id: 200 },
        { bundleName: '', moduleName: 'entry', id: 200 });
      const forwardSame: boolean = ResourceUtils.isSameResource({ bundleName: '', moduleName: 'entry', id: 200 },
        { bundleName: '', moduleName: 'entry', id: 200 });
      const result: string = String(forwardSame);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('true'));
      expect(result).assertEqual('true');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(String(reverseSame)), String('true'));
      expect(String(reverseSame)).assertEqual('true');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(String(leftKey === rightKey)), String('true'));
      expect(String(leftKey === rightKey)).assertEqual('true');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsSameRes0025 end');
    })

    /**
     * @tc.name   testResourceUtilsSameRes0026
     * @tc.number SUB_RESMGR_UTILS27_0026
     * @tc.desc   omitted bundleName and empty bundleName both fall back to '-' for id 201
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsSameRes0026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsSameRes0026 begin');
      const leftKey: string = ResourceUtils.resourceKey({ bundleName: '', moduleName: 'entry', id: 201 });
      const rightKey: string = ResourceUtils.resourceKey({ bundleName: '', moduleName: 'entry', id: 201 });
      const reverseSame: boolean = ResourceUtils.isSameResource({ bundleName: '', moduleName: 'entry', id: 201 },
        { bundleName: '', moduleName: 'entry', id: 201 });
      const forwardSame: boolean = ResourceUtils.isSameResource({ bundleName: '', moduleName: 'entry', id: 201 },
        { bundleName: '', moduleName: 'entry', id: 201 });
      const result: string = String(forwardSame);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('true'));
      expect(result).assertEqual('true');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(String(reverseSame)), String('true'));
      expect(String(reverseSame)).assertEqual('true');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(String(leftKey === rightKey)), String('true'));
      expect(String(leftKey === rightKey)).assertEqual('true');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsSameRes0026 end');
    })

    /**
     * @tc.name   testResourceUtilsSameRes0027
     * @tc.number SUB_RESMGR_UTILS27_0027
     * @tc.desc   omitted bundleName and empty bundleName both fall back to '-' for id 202
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsSameRes0027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsSameRes0027 begin');
      const leftKey: string = ResourceUtils.resourceKey({ bundleName: '', moduleName: 'entry', id: 202 });
      const rightKey: string = ResourceUtils.resourceKey({ bundleName: '', moduleName: 'entry', id: 202 });
      const reverseSame: boolean = ResourceUtils.isSameResource({ bundleName: '', moduleName: 'entry', id: 202 },
        { bundleName: '', moduleName: 'entry', id: 202 });
      const forwardSame: boolean = ResourceUtils.isSameResource({ bundleName: '', moduleName: 'entry', id: 202 },
        { bundleName: '', moduleName: 'entry', id: 202 });
      const result: string = String(forwardSame);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('true'));
      expect(result).assertEqual('true');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(String(reverseSame)), String('true'));
      expect(String(reverseSame)).assertEqual('true');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(String(leftKey === rightKey)), String('true'));
      expect(String(leftKey === rightKey)).assertEqual('true');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsSameRes0027 end');
    })

    /**
     * @tc.name   testResourceUtilsSameRes0028
     * @tc.number SUB_RESMGR_UTILS27_0028
     * @tc.desc   omitted bundleName and empty bundleName both fall back to '-' for id 203
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsSameRes0028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsSameRes0028 begin');
      const leftKey: string = ResourceUtils.resourceKey({ bundleName: '', moduleName: 'entry', id: 203 });
      const rightKey: string = ResourceUtils.resourceKey({ bundleName: '', moduleName: 'entry', id: 203 });
      const reverseSame: boolean = ResourceUtils.isSameResource({ bundleName: '', moduleName: 'entry', id: 203 },
        { bundleName: '', moduleName: 'entry', id: 203 });
      const forwardSame: boolean = ResourceUtils.isSameResource({ bundleName: '', moduleName: 'entry', id: 203 },
        { bundleName: '', moduleName: 'entry', id: 203 });
      const result: string = String(forwardSame);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('true'));
      expect(result).assertEqual('true');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(String(reverseSame)), String('true'));
      expect(String(reverseSame)).assertEqual('true');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(String(leftKey === rightKey)), String('true'));
      expect(String(leftKey === rightKey)).assertEqual('true');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsSameRes0028 end');
    })

    /**
     * @tc.name   testResourceUtilsSameRes0029
     * @tc.number SUB_RESMGR_UTILS27_0029
     * @tc.desc   omitted bundleName and empty bundleName both fall back to '-' for id 204
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsSameRes0029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsSameRes0029 begin');
      const leftKey: string = ResourceUtils.resourceKey({ bundleName: '', moduleName: 'entry', id: 204 });
      const rightKey: string = ResourceUtils.resourceKey({ bundleName: '', moduleName: 'entry', id: 204 });
      const reverseSame: boolean = ResourceUtils.isSameResource({ bundleName: '', moduleName: 'entry', id: 204 },
        { bundleName: '', moduleName: 'entry', id: 204 });
      const forwardSame: boolean = ResourceUtils.isSameResource({ bundleName: '', moduleName: 'entry', id: 204 },
        { bundleName: '', moduleName: 'entry', id: 204 });
      const result: string = String(forwardSame);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('true'));
      expect(result).assertEqual('true');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(String(reverseSame)), String('true'));
      expect(String(reverseSame)).assertEqual('true');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(String(leftKey === rightKey)), String('true'));
      expect(String(leftKey === rightKey)).assertEqual('true');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsSameRes0029 end');
    })

    /**
     * @tc.name   testResourceUtilsSameRes0030
     * @tc.number SUB_RESMGR_UTILS27_0030
     * @tc.desc   omitted bundleName and empty bundleName both fall back to '-' for id 205
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsSameRes0030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsSameRes0030 begin');
      const leftKey: string = ResourceUtils.resourceKey({ bundleName: '', moduleName: 'entry', id: 205 });
      const rightKey: string = ResourceUtils.resourceKey({ bundleName: '', moduleName: 'entry', id: 205 });
      const reverseSame: boolean = ResourceUtils.isSameResource({ bundleName: '', moduleName: 'entry', id: 205 },
        { bundleName: '', moduleName: 'entry', id: 205 });
      const forwardSame: boolean = ResourceUtils.isSameResource({ bundleName: '', moduleName: 'entry', id: 205 },
        { bundleName: '', moduleName: 'entry', id: 205 });
      const result: string = String(forwardSame);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('true'));
      expect(result).assertEqual('true');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(String(reverseSame)), String('true'));
      expect(String(reverseSame)).assertEqual('true');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(String(leftKey === rightKey)), String('true'));
      expect(String(leftKey === rightKey)).assertEqual('true');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsSameRes0030 end');
    })

    /**
     * @tc.name   testResourceUtilsSameRes0031
     * @tc.number SUB_RESMGR_UTILS27_0031
     * @tc.desc   omitted moduleName and empty moduleName both fall back to '-' for id 210
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsSameRes0031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsSameRes0031 begin');
      const leftKey: string = ResourceUtils.resourceKey({ bundleName: 'ohos.samples.resourcemanager', moduleName: '',
        id: 210 });
      const rightKey: string = ResourceUtils.resourceKey({ bundleName: 'ohos.samples.resourcemanager', moduleName: '',
        id: 210 });
      const reverseSame: boolean = ResourceUtils.isSameResource({ bundleName: 'ohos.samples.resourcemanager',
        moduleName: '', id: 210 }, { bundleName: 'ohos.samples.resourcemanager', moduleName: '', id: 210 });
      const forwardSame: boolean = ResourceUtils.isSameResource({ bundleName: 'ohos.samples.resourcemanager',
        moduleName: '', id: 210 }, { bundleName: 'ohos.samples.resourcemanager', moduleName: '', id: 210 });
      const result: string = String(forwardSame);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('true'));
      expect(result).assertEqual('true');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(String(reverseSame)), String('true'));
      expect(String(reverseSame)).assertEqual('true');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(String(leftKey === rightKey)), String('true'));
      expect(String(leftKey === rightKey)).assertEqual('true');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsSameRes0031 end');
    })

    /**
     * @tc.name   testResourceUtilsSameRes0032
     * @tc.number SUB_RESMGR_UTILS27_0032
     * @tc.desc   omitted moduleName and empty moduleName both fall back to '-' for id 211
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsSameRes0032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsSameRes0032 begin');
      const leftKey: string = ResourceUtils.resourceKey({ bundleName: 'ohos.samples.resourcemanager', moduleName: '',
        id: 211 });
      const rightKey: string = ResourceUtils.resourceKey({ bundleName: 'ohos.samples.resourcemanager', moduleName: '',
        id: 211 });
      const reverseSame: boolean = ResourceUtils.isSameResource({ bundleName: 'ohos.samples.resourcemanager',
        moduleName: '', id: 211 }, { bundleName: 'ohos.samples.resourcemanager', moduleName: '', id: 211 });
      const forwardSame: boolean = ResourceUtils.isSameResource({ bundleName: 'ohos.samples.resourcemanager',
        moduleName: '', id: 211 }, { bundleName: 'ohos.samples.resourcemanager', moduleName: '', id: 211 });
      const result: string = String(forwardSame);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('true'));
      expect(result).assertEqual('true');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(String(reverseSame)), String('true'));
      expect(String(reverseSame)).assertEqual('true');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(String(leftKey === rightKey)), String('true'));
      expect(String(leftKey === rightKey)).assertEqual('true');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsSameRes0032 end');
    })

    /**
     * @tc.name   testResourceUtilsSameRes0033
     * @tc.number SUB_RESMGR_UTILS27_0033
     * @tc.desc   omitted moduleName and empty moduleName both fall back to '-' for id 212
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsSameRes0033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsSameRes0033 begin');
      const leftKey: string = ResourceUtils.resourceKey({ bundleName: 'ohos.samples.resourcemanager', moduleName: '',
        id: 212 });
      const rightKey: string = ResourceUtils.resourceKey({ bundleName: 'ohos.samples.resourcemanager', moduleName: '',
        id: 212 });
      const reverseSame: boolean = ResourceUtils.isSameResource({ bundleName: 'ohos.samples.resourcemanager',
        moduleName: '', id: 212 }, { bundleName: 'ohos.samples.resourcemanager', moduleName: '', id: 212 });
      const forwardSame: boolean = ResourceUtils.isSameResource({ bundleName: 'ohos.samples.resourcemanager',
        moduleName: '', id: 212 }, { bundleName: 'ohos.samples.resourcemanager', moduleName: '', id: 212 });
      const result: string = String(forwardSame);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('true'));
      expect(result).assertEqual('true');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(String(reverseSame)), String('true'));
      expect(String(reverseSame)).assertEqual('true');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(String(leftKey === rightKey)), String('true'));
      expect(String(leftKey === rightKey)).assertEqual('true');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsSameRes0033 end');
    })

    /**
     * @tc.name   testResourceUtilsSameRes0034
     * @tc.number SUB_RESMGR_UTILS27_0034
     * @tc.desc   omitted moduleName and empty moduleName both fall back to '-' for id 213
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsSameRes0034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsSameRes0034 begin');
      const leftKey: string = ResourceUtils.resourceKey({ bundleName: 'ohos.samples.resourcemanager', moduleName: '',
        id: 213 });
      const rightKey: string = ResourceUtils.resourceKey({ bundleName: 'ohos.samples.resourcemanager', moduleName: '',
        id: 213 });
      const reverseSame: boolean = ResourceUtils.isSameResource({ bundleName: 'ohos.samples.resourcemanager',
        moduleName: '', id: 213 }, { bundleName: 'ohos.samples.resourcemanager', moduleName: '', id: 213 });
      const forwardSame: boolean = ResourceUtils.isSameResource({ bundleName: 'ohos.samples.resourcemanager',
        moduleName: '', id: 213 }, { bundleName: 'ohos.samples.resourcemanager', moduleName: '', id: 213 });
      const result: string = String(forwardSame);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('true'));
      expect(result).assertEqual('true');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(String(reverseSame)), String('true'));
      expect(String(reverseSame)).assertEqual('true');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(String(leftKey === rightKey)), String('true'));
      expect(String(leftKey === rightKey)).assertEqual('true');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsSameRes0034 end');
    })

    /**
     * @tc.name   testResourceUtilsSameRes0035
     * @tc.number SUB_RESMGR_UTILS27_0035
     * @tc.desc   omitted moduleName and empty moduleName both fall back to '-' for id 214
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsSameRes0035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsSameRes0035 begin');
      const leftKey: string = ResourceUtils.resourceKey({ bundleName: 'ohos.samples.resourcemanager', moduleName: '',
        id: 214 });
      const rightKey: string = ResourceUtils.resourceKey({ bundleName: 'ohos.samples.resourcemanager', moduleName: '',
        id: 214 });
      const reverseSame: boolean = ResourceUtils.isSameResource({ bundleName: 'ohos.samples.resourcemanager',
        moduleName: '', id: 214 }, { bundleName: 'ohos.samples.resourcemanager', moduleName: '', id: 214 });
      const forwardSame: boolean = ResourceUtils.isSameResource({ bundleName: 'ohos.samples.resourcemanager',
        moduleName: '', id: 214 }, { bundleName: 'ohos.samples.resourcemanager', moduleName: '', id: 214 });
      const result: string = String(forwardSame);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('true'));
      expect(result).assertEqual('true');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(String(reverseSame)), String('true'));
      expect(String(reverseSame)).assertEqual('true');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(String(leftKey === rightKey)), String('true'));
      expect(String(leftKey === rightKey)).assertEqual('true');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsSameRes0035 end');
    })

    /**
     * @tc.name   testResourceUtilsSameRes0036
     * @tc.number SUB_RESMGR_UTILS27_0036
     * @tc.desc   omitted moduleName and empty moduleName both fall back to '-' for id 215
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsSameRes0036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsSameRes0036 begin');
      const leftKey: string = ResourceUtils.resourceKey({ bundleName: 'ohos.samples.resourcemanager', moduleName: '',
        id: 215 });
      const rightKey: string = ResourceUtils.resourceKey({ bundleName: 'ohos.samples.resourcemanager', moduleName: '',
        id: 215 });
      const reverseSame: boolean = ResourceUtils.isSameResource({ bundleName: 'ohos.samples.resourcemanager',
        moduleName: '', id: 215 }, { bundleName: 'ohos.samples.resourcemanager', moduleName: '', id: 215 });
      const forwardSame: boolean = ResourceUtils.isSameResource({ bundleName: 'ohos.samples.resourcemanager',
        moduleName: '', id: 215 }, { bundleName: 'ohos.samples.resourcemanager', moduleName: '', id: 215 });
      const result: string = String(forwardSame);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('true'));
      expect(result).assertEqual('true');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(String(reverseSame)), String('true'));
      expect(String(reverseSame)).assertEqual('true');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(String(leftKey === rightKey)), String('true'));
      expect(String(leftKey === rightKey)).assertEqual('true');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsSameRes0036 end');
    })

    /**
     * @tc.name   testResourceUtilsSameRes0037
     * @tc.number SUB_RESMGR_UTILS27_0037
     * @tc.desc   both fields omitted and both empty produce the same key for id 220
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsSameRes0037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsSameRes0037 begin');
      const leftKey: string = ResourceUtils.resourceKey({ bundleName: '', moduleName: '', id: 220 });
      const rightKey: string = ResourceUtils.resourceKey({ bundleName: '', moduleName: '', id: 220 });
      const reverseSame: boolean = ResourceUtils.isSameResource({ bundleName: '', moduleName: '', id: 220 },
        { bundleName: '', moduleName: '', id: 220 });
      const forwardSame: boolean = ResourceUtils.isSameResource({ bundleName: '', moduleName: '', id: 220 },
        { bundleName: '', moduleName: '', id: 220 });
      const result: string = String(forwardSame);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('true'));
      expect(result).assertEqual('true');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(String(reverseSame)), String('true'));
      expect(String(reverseSame)).assertEqual('true');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(String(leftKey === rightKey)), String('true'));
      expect(String(leftKey === rightKey)).assertEqual('true');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsSameRes0037 end');
    })

    /**
     * @tc.name   testResourceUtilsSameRes0038
     * @tc.number SUB_RESMGR_UTILS27_0038
     * @tc.desc   both fields omitted and both empty produce the same key for id 221
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsSameRes0038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsSameRes0038 begin');
      const leftKey: string = ResourceUtils.resourceKey({ bundleName: '', moduleName: '', id: 221 });
      const rightKey: string = ResourceUtils.resourceKey({ bundleName: '', moduleName: '', id: 221 });
      const reverseSame: boolean = ResourceUtils.isSameResource({ bundleName: '', moduleName: '', id: 221 },
        { bundleName: '', moduleName: '', id: 221 });
      const forwardSame: boolean = ResourceUtils.isSameResource({ bundleName: '', moduleName: '', id: 221 },
        { bundleName: '', moduleName: '', id: 221 });
      const result: string = String(forwardSame);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('true'));
      expect(result).assertEqual('true');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(String(reverseSame)), String('true'));
      expect(String(reverseSame)).assertEqual('true');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(String(leftKey === rightKey)), String('true'));
      expect(String(leftKey === rightKey)).assertEqual('true');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsSameRes0038 end');
    })

    /**
     * @tc.name   testResourceUtilsSameRes0039
     * @tc.number SUB_RESMGR_UTILS27_0039
     * @tc.desc   both fields omitted and both empty produce the same key for id 222
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsSameRes0039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsSameRes0039 begin');
      const leftKey: string = ResourceUtils.resourceKey({ bundleName: '', moduleName: '', id: 222 });
      const rightKey: string = ResourceUtils.resourceKey({ bundleName: '', moduleName: '', id: 222 });
      const reverseSame: boolean = ResourceUtils.isSameResource({ bundleName: '', moduleName: '', id: 222 },
        { bundleName: '', moduleName: '', id: 222 });
      const forwardSame: boolean = ResourceUtils.isSameResource({ bundleName: '', moduleName: '', id: 222 },
        { bundleName: '', moduleName: '', id: 222 });
      const result: string = String(forwardSame);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('true'));
      expect(result).assertEqual('true');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(String(reverseSame)), String('true'));
      expect(String(reverseSame)).assertEqual('true');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(String(leftKey === rightKey)), String('true'));
      expect(String(leftKey === rightKey)).assertEqual('true');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsSameRes0039 end');
    })

    /**
     * @tc.name   testResourceUtilsSameRes0040
     * @tc.number SUB_RESMGR_UTILS27_0040
     * @tc.desc   both fields omitted and both empty produce the same key for id 223
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsSameRes0040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsSameRes0040 begin');
      const leftKey: string = ResourceUtils.resourceKey({ bundleName: '', moduleName: '', id: 223 });
      const rightKey: string = ResourceUtils.resourceKey({ bundleName: '', moduleName: '', id: 223 });
      const reverseSame: boolean = ResourceUtils.isSameResource({ bundleName: '', moduleName: '', id: 223 },
        { bundleName: '', moduleName: '', id: 223 });
      const forwardSame: boolean = ResourceUtils.isSameResource({ bundleName: '', moduleName: '', id: 223 },
        { bundleName: '', moduleName: '', id: 223 });
      const result: string = String(forwardSame);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('true'));
      expect(result).assertEqual('true');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(String(reverseSame)), String('true'));
      expect(String(reverseSame)).assertEqual('true');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(String(leftKey === rightKey)), String('true'));
      expect(String(leftKey === rightKey)).assertEqual('true');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsSameRes0040 end');
    })

    /**
     * @tc.name   testResourceUtilsSameRes0041
     * @tc.number SUB_RESMGR_UTILS27_0041
     * @tc.desc   omitted bundleName differs from ohos.samples.resourcemanager for id 230
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsSameRes0041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsSameRes0041 begin');
      const leftKey: string = ResourceUtils.resourceKey({ bundleName: '', moduleName: 'entry', id: 230 });
      const rightKey: string = ResourceUtils.resourceKey({ bundleName: 'ohos.samples.resourcemanager',
        moduleName: 'entry', id: 230 });
      const reverseSame: boolean = ResourceUtils.isSameResource({ bundleName: 'ohos.samples.resourcemanager',
        moduleName: 'entry', id: 230 }, { bundleName: '', moduleName: 'entry', id: 230 });
      const forwardSame: boolean = ResourceUtils.isSameResource({ bundleName: '', moduleName: 'entry', id: 230 },
        { bundleName: 'ohos.samples.resourcemanager', moduleName: 'entry', id: 230 });
      const result: string = String(forwardSame);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('false'));
      expect(result).assertEqual('false');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(String(reverseSame)), String('false'));
      expect(String(reverseSame)).assertEqual('false');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(String(leftKey === rightKey)), String('false'));
      expect(String(leftKey === rightKey)).assertEqual('false');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsSameRes0041 end');
    })

    /**
     * @tc.name   testResourceUtilsSameRes0042
     * @tc.number SUB_RESMGR_UTILS27_0042
     * @tc.desc   omitted bundleName differs from ohos.samples.resourcemanager for id 231
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsSameRes0042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsSameRes0042 begin');
      const leftKey: string = ResourceUtils.resourceKey({ bundleName: '', moduleName: 'entry', id: 231 });
      const rightKey: string = ResourceUtils.resourceKey({ bundleName: 'ohos.samples.resourcemanager',
        moduleName: 'entry', id: 231 });
      const reverseSame: boolean = ResourceUtils.isSameResource({ bundleName: 'ohos.samples.resourcemanager',
        moduleName: 'entry', id: 231 }, { bundleName: '', moduleName: 'entry', id: 231 });
      const forwardSame: boolean = ResourceUtils.isSameResource({ bundleName: '', moduleName: 'entry', id: 231 },
        { bundleName: 'ohos.samples.resourcemanager', moduleName: 'entry', id: 231 });
      const result: string = String(forwardSame);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('false'));
      expect(result).assertEqual('false');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(String(reverseSame)), String('false'));
      expect(String(reverseSame)).assertEqual('false');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(String(leftKey === rightKey)), String('false'));
      expect(String(leftKey === rightKey)).assertEqual('false');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsSameRes0042 end');
    })

    /**
     * @tc.name   testResourceUtilsSameRes0043
     * @tc.number SUB_RESMGR_UTILS27_0043
     * @tc.desc   omitted bundleName differs from ohos.samples.resourcemanager for id 232
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsSameRes0043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsSameRes0043 begin');
      const leftKey: string = ResourceUtils.resourceKey({ bundleName: '', moduleName: 'entry', id: 232 });
      const rightKey: string = ResourceUtils.resourceKey({ bundleName: 'ohos.samples.resourcemanager',
        moduleName: 'entry', id: 232 });
      const reverseSame: boolean = ResourceUtils.isSameResource({ bundleName: 'ohos.samples.resourcemanager',
        moduleName: 'entry', id: 232 }, { bundleName: '', moduleName: 'entry', id: 232 });
      const forwardSame: boolean = ResourceUtils.isSameResource({ bundleName: '', moduleName: 'entry', id: 232 },
        { bundleName: 'ohos.samples.resourcemanager', moduleName: 'entry', id: 232 });
      const result: string = String(forwardSame);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('false'));
      expect(result).assertEqual('false');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(String(reverseSame)), String('false'));
      expect(String(reverseSame)).assertEqual('false');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(String(leftKey === rightKey)), String('false'));
      expect(String(leftKey === rightKey)).assertEqual('false');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsSameRes0043 end');
    })

    /**
     * @tc.name   testResourceUtilsSameRes0044
     * @tc.number SUB_RESMGR_UTILS27_0044
     * @tc.desc   omitted bundleName differs from ohos.samples.resourcemanager for id 233
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsSameRes0044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsSameRes0044 begin');
      const leftKey: string = ResourceUtils.resourceKey({ bundleName: '', moduleName: 'entry', id: 233 });
      const rightKey: string = ResourceUtils.resourceKey({ bundleName: 'ohos.samples.resourcemanager',
        moduleName: 'entry', id: 233 });
      const reverseSame: boolean = ResourceUtils.isSameResource({ bundleName: 'ohos.samples.resourcemanager',
        moduleName: 'entry', id: 233 }, { bundleName: '', moduleName: 'entry', id: 233 });
      const forwardSame: boolean = ResourceUtils.isSameResource({ bundleName: '', moduleName: 'entry', id: 233 },
        { bundleName: 'ohos.samples.resourcemanager', moduleName: 'entry', id: 233 });
      const result: string = String(forwardSame);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('false'));
      expect(result).assertEqual('false');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(String(reverseSame)), String('false'));
      expect(String(reverseSame)).assertEqual('false');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(String(leftKey === rightKey)), String('false'));
      expect(String(leftKey === rightKey)).assertEqual('false');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsSameRes0044 end');
    })

    /**
     * @tc.name   testResourceUtilsSameRes0045
     * @tc.number SUB_RESMGR_UTILS27_0045
     * @tc.desc   omitted bundleName differs from ohos.samples.resourcemanager for id 234
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsSameRes0045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsSameRes0045 begin');
      const leftKey: string = ResourceUtils.resourceKey({ bundleName: '', moduleName: 'entry', id: 234 });
      const rightKey: string = ResourceUtils.resourceKey({ bundleName: 'ohos.samples.resourcemanager',
        moduleName: 'entry', id: 234 });
      const reverseSame: boolean = ResourceUtils.isSameResource({ bundleName: 'ohos.samples.resourcemanager',
        moduleName: 'entry', id: 234 }, { bundleName: '', moduleName: 'entry', id: 234 });
      const forwardSame: boolean = ResourceUtils.isSameResource({ bundleName: '', moduleName: 'entry', id: 234 },
        { bundleName: 'ohos.samples.resourcemanager', moduleName: 'entry', id: 234 });
      const result: string = String(forwardSame);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('false'));
      expect(result).assertEqual('false');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(String(reverseSame)), String('false'));
      expect(String(reverseSame)).assertEqual('false');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(String(leftKey === rightKey)), String('false'));
      expect(String(leftKey === rightKey)).assertEqual('false');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsSameRes0045 end');
    })

    /**
     * @tc.name   testResourceUtilsSameRes0046
     * @tc.number SUB_RESMGR_UTILS27_0046
     * @tc.desc   omitted bundleName differs from ohos.samples.resourcemanager for id 235
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsSameRes0046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsSameRes0046 begin');
      const leftKey: string = ResourceUtils.resourceKey({ bundleName: '', moduleName: 'entry', id: 235 });
      const rightKey: string = ResourceUtils.resourceKey({ bundleName: 'ohos.samples.resourcemanager',
        moduleName: 'entry', id: 235 });
      const reverseSame: boolean = ResourceUtils.isSameResource({ bundleName: 'ohos.samples.resourcemanager',
        moduleName: 'entry', id: 235 }, { bundleName: '', moduleName: 'entry', id: 235 });
      const forwardSame: boolean = ResourceUtils.isSameResource({ bundleName: '', moduleName: 'entry', id: 235 },
        { bundleName: 'ohos.samples.resourcemanager', moduleName: 'entry', id: 235 });
      const result: string = String(forwardSame);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('false'));
      expect(result).assertEqual('false');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(String(reverseSame)), String('false'));
      expect(String(reverseSame)).assertEqual('false');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(String(leftKey === rightKey)), String('false'));
      expect(String(leftKey === rightKey)).assertEqual('false');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsSameRes0046 end');
    })

    /**
     * @tc.name   testResourceUtilsSameRes0047
     * @tc.number SUB_RESMGR_UTILS27_0047
     * @tc.desc   extreme id 0 is stable against itself
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsSameRes0047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsSameRes0047 begin');
      const leftKey: string = ResourceUtils.resourceKey({ bundleName: 'ohos.samples.resourcemanager',
        moduleName: 'entry', id: 0 });
      const rightKey: string = ResourceUtils.resourceKey({ bundleName: 'ohos.samples.resourcemanager',
        moduleName: 'entry', id: 0 });
      const reverseSame: boolean = ResourceUtils.isSameResource({ bundleName: 'ohos.samples.resourcemanager',
        moduleName: 'entry', id: 0 }, { bundleName: 'ohos.samples.resourcemanager', moduleName: 'entry', id: 0 });
      const forwardSame: boolean = ResourceUtils.isSameResource({ bundleName: 'ohos.samples.resourcemanager',
        moduleName: 'entry', id: 0 }, { bundleName: 'ohos.samples.resourcemanager', moduleName: 'entry', id: 0 });
      const result: string = String(forwardSame);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('true'));
      expect(result).assertEqual('true');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(String(reverseSame)), String('true'));
      expect(String(reverseSame)).assertEqual('true');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(String(leftKey === rightKey)), String('true'));
      expect(String(leftKey === rightKey)).assertEqual('true');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsSameRes0047 end');
    })

    /**
     * @tc.name   testResourceUtilsSameRes0048
     * @tc.number SUB_RESMGR_UTILS27_0048
     * @tc.desc   extreme id -1 is stable against itself
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsSameRes0048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsSameRes0048 begin');
      const leftKey: string = ResourceUtils.resourceKey({ bundleName: 'ohos.samples.resourcemanager',
        moduleName: 'entry', id: -1 });
      const rightKey: string = ResourceUtils.resourceKey({ bundleName: 'ohos.samples.resourcemanager',
        moduleName: 'entry', id: -1 });
      const reverseSame: boolean = ResourceUtils.isSameResource({ bundleName: 'ohos.samples.resourcemanager',
        moduleName: 'entry', id: -1 }, { bundleName: 'ohos.samples.resourcemanager', moduleName: 'entry', id: -1 });
      const forwardSame: boolean = ResourceUtils.isSameResource({ bundleName: 'ohos.samples.resourcemanager',
        moduleName: 'entry', id: -1 }, { bundleName: 'ohos.samples.resourcemanager', moduleName: 'entry', id: -1 });
      const result: string = String(forwardSame);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('true'));
      expect(result).assertEqual('true');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(String(reverseSame)), String('true'));
      expect(String(reverseSame)).assertEqual('true');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(String(leftKey === rightKey)), String('true'));
      expect(String(leftKey === rightKey)).assertEqual('true');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsSameRes0048 end');
    })

    /**
     * @tc.name   testResourceUtilsSameRes0049
     * @tc.number SUB_RESMGR_UTILS27_0049
     * @tc.desc   extreme id 2147483647 is stable against itself
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsSameRes0049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsSameRes0049 begin');
      const leftKey: string = ResourceUtils.resourceKey({ bundleName: 'ohos.samples.resourcemanager',
        moduleName: 'entry', id: 2147483647 });
      const rightKey: string = ResourceUtils.resourceKey({ bundleName: 'ohos.samples.resourcemanager',
        moduleName: 'entry', id: 2147483647 });
      const reverseSame: boolean = ResourceUtils.isSameResource({ bundleName: 'ohos.samples.resourcemanager',
        moduleName: 'entry', id: 2147483647 }, { bundleName: 'ohos.samples.resourcemanager', moduleName: 'entry',
          id: 2147483647 });
      const forwardSame: boolean = ResourceUtils.isSameResource({ bundleName: 'ohos.samples.resourcemanager',
        moduleName: 'entry', id: 2147483647 }, { bundleName: 'ohos.samples.resourcemanager', moduleName: 'entry',
          id: 2147483647 });
      const result: string = String(forwardSame);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('true'));
      expect(result).assertEqual('true');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(String(reverseSame)), String('true'));
      expect(String(reverseSame)).assertEqual('true');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(String(leftKey === rightKey)), String('true'));
      expect(String(leftKey === rightKey)).assertEqual('true');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsSameRes0049 end');
    })

    /**
     * @tc.name   testResourceUtilsSameRes0050
     * @tc.number SUB_RESMGR_UTILS27_0050
     * @tc.desc   extreme id 1000000 is stable against itself
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsSameRes0050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsSameRes0050 begin');
      const leftKey: string = ResourceUtils.resourceKey({ bundleName: 'ohos.samples.resourcemanager',
        moduleName: 'entry', id: 1000000 });
      const rightKey: string = ResourceUtils.resourceKey({ bundleName: 'ohos.samples.resourcemanager',
        moduleName: 'entry', id: 1000000 });
      const reverseSame: boolean = ResourceUtils.isSameResource({ bundleName: 'ohos.samples.resourcemanager',
        moduleName: 'entry', id: 1000000 }, { bundleName: 'ohos.samples.resourcemanager', moduleName: 'entry',
          id: 1000000 });
      const forwardSame: boolean = ResourceUtils.isSameResource({ bundleName: 'ohos.samples.resourcemanager',
        moduleName: 'entry', id: 1000000 }, { bundleName: 'ohos.samples.resourcemanager', moduleName: 'entry',
          id: 1000000 });
      const result: string = String(forwardSame);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('true'));
      expect(result).assertEqual('true');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(String(reverseSame)), String('true'));
      expect(String(reverseSame)).assertEqual('true');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(String(leftKey === rightKey)), String('true'));
      expect(String(leftKey === rightKey)).assertEqual('true');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsSameRes0050 end');
    })

    /**
     * @tc.name   testResourceUtilsSameRes0051
     * @tc.number SUB_RESMGR_UTILS27_0051
     * @tc.desc   extreme id 0 differs from 1
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsSameRes0051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsSameRes0051 begin');
      const leftKey: string = ResourceUtils.resourceKey({ bundleName: 'ohos.samples.resourcemanager',
        moduleName: 'entry', id: 0 });
      const rightKey: string = ResourceUtils.resourceKey({ bundleName: 'ohos.samples.resourcemanager',
        moduleName: 'entry', id: 1 });
      const reverseSame: boolean = ResourceUtils.isSameResource({ bundleName: 'ohos.samples.resourcemanager',
        moduleName: 'entry', id: 1 }, { bundleName: 'ohos.samples.resourcemanager', moduleName: 'entry', id: 0 });
      const forwardSame: boolean = ResourceUtils.isSameResource({ bundleName: 'ohos.samples.resourcemanager',
        moduleName: 'entry', id: 0 }, { bundleName: 'ohos.samples.resourcemanager', moduleName: 'entry', id: 1 });
      const result: string = String(forwardSame);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('false'));
      expect(result).assertEqual('false');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(String(reverseSame)), String('false'));
      expect(String(reverseSame)).assertEqual('false');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(String(leftKey === rightKey)), String('false'));
      expect(String(leftKey === rightKey)).assertEqual('false');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsSameRes0051 end');
    })

    /**
     * @tc.name   testResourceUtilsSameRes0052
     * @tc.number SUB_RESMGR_UTILS27_0052
     * @tc.desc   extreme id -1 differs from 0
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsSameRes0052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsSameRes0052 begin');
      const leftKey: string = ResourceUtils.resourceKey({ bundleName: 'ohos.samples.resourcemanager',
        moduleName: 'entry', id: -1 });
      const rightKey: string = ResourceUtils.resourceKey({ bundleName: 'ohos.samples.resourcemanager',
        moduleName: 'entry', id: 0 });
      const reverseSame: boolean = ResourceUtils.isSameResource({ bundleName: 'ohos.samples.resourcemanager',
        moduleName: 'entry', id: 0 }, { bundleName: 'ohos.samples.resourcemanager', moduleName: 'entry', id: -1 });
      const forwardSame: boolean = ResourceUtils.isSameResource({ bundleName: 'ohos.samples.resourcemanager',
        moduleName: 'entry', id: -1 }, { bundleName: 'ohos.samples.resourcemanager', moduleName: 'entry', id: 0 });
      const result: string = String(forwardSame);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('false'));
      expect(result).assertEqual('false');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(String(reverseSame)), String('false'));
      expect(String(reverseSame)).assertEqual('false');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(String(leftKey === rightKey)), String('false'));
      expect(String(leftKey === rightKey)).assertEqual('false');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsSameRes0052 end');
    })

    /**
     * @tc.name   testResourceUtilsSameRes0053
     * @tc.number SUB_RESMGR_UTILS27_0053
     * @tc.desc   extreme id 2147483647 differs from 2147483648
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsSameRes0053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsSameRes0053 begin');
      const leftKey: string = ResourceUtils.resourceKey({ bundleName: 'ohos.samples.resourcemanager',
        moduleName: 'entry', id: 2147483647 });
      const rightKey: string = ResourceUtils.resourceKey({ bundleName: 'ohos.samples.resourcemanager',
        moduleName: 'entry', id: 2147483648 });
      const reverseSame: boolean = ResourceUtils.isSameResource({ bundleName: 'ohos.samples.resourcemanager',
        moduleName: 'entry', id: 2147483648 }, { bundleName: 'ohos.samples.resourcemanager', moduleName: 'entry',
          id: 2147483647 });
      const forwardSame: boolean = ResourceUtils.isSameResource({ bundleName: 'ohos.samples.resourcemanager',
        moduleName: 'entry', id: 2147483647 }, { bundleName: 'ohos.samples.resourcemanager', moduleName: 'entry',
          id: 2147483648 });
      const result: string = String(forwardSame);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('false'));
      expect(result).assertEqual('false');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(String(reverseSame)), String('false'));
      expect(String(reverseSame)).assertEqual('false');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(String(leftKey === rightKey)), String('false'));
      expect(String(leftKey === rightKey)).assertEqual('false');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsSameRes0053 end');
    })

    /**
     * @tc.name   testResourceUtilsSameRes0054
     * @tc.number SUB_RESMGR_UTILS27_0054
     * @tc.desc   extreme id 1000000 differs from 1000001
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsSameRes0054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsSameRes0054 begin');
      const leftKey: string = ResourceUtils.resourceKey({ bundleName: 'ohos.samples.resourcemanager',
        moduleName: 'entry', id: 1000000 });
      const rightKey: string = ResourceUtils.resourceKey({ bundleName: 'ohos.samples.resourcemanager',
        moduleName: 'entry', id: 1000001 });
      const reverseSame: boolean = ResourceUtils.isSameResource({ bundleName: 'ohos.samples.resourcemanager',
        moduleName: 'entry', id: 1000001 }, { bundleName: 'ohos.samples.resourcemanager', moduleName: 'entry',
          id: 1000000 });
      const forwardSame: boolean = ResourceUtils.isSameResource({ bundleName: 'ohos.samples.resourcemanager',
        moduleName: 'entry', id: 1000000 }, { bundleName: 'ohos.samples.resourcemanager', moduleName: 'entry',
          id: 1000001 });
      const result: string = String(forwardSame);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('false'));
      expect(result).assertEqual('false');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(String(reverseSame)), String('false'));
      expect(String(reverseSame)).assertEqual('false');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(String(leftKey === rightKey)), String('false'));
      expect(String(leftKey === rightKey)).assertEqual('false');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsSameRes0054 end');
    })

    /**
     * @tc.name   testResourceUtilsSameRes0055
     * @tc.number SUB_RESMGR_UTILS27_0055
     * @tc.desc   id 1 without bundle and module is reflexive
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsSameRes0055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsSameRes0055 begin');
      const leftKey: string = ResourceUtils.resourceKey({ bundleName: '', moduleName: '', id: 1 });
      const rightKey: string = ResourceUtils.resourceKey({ bundleName: '', moduleName: '', id: 1 });
      const reverseSame: boolean = ResourceUtils.isSameResource({ bundleName: '', moduleName: '', id: 1 },
        { bundleName: '', moduleName: '', id: 1 });
      const forwardSame: boolean = ResourceUtils.isSameResource({ bundleName: '', moduleName: '', id: 1 },
        { bundleName: '', moduleName: '', id: 1 });
      const result: string = String(forwardSame);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('true'));
      expect(result).assertEqual('true');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(String(reverseSame)), String('true'));
      expect(String(reverseSame)).assertEqual('true');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(String(leftKey === rightKey)), String('true'));
      expect(String(leftKey === rightKey)).assertEqual('true');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsSameRes0055 end');
    })

    /**
     * @tc.name   testResourceUtilsSameRes0056
     * @tc.number SUB_RESMGR_UTILS27_0056
     * @tc.desc   id 42 without bundle and module is reflexive
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsSameRes0056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsSameRes0056 begin');
      const leftKey: string = ResourceUtils.resourceKey({ bundleName: '', moduleName: '', id: 42 });
      const rightKey: string = ResourceUtils.resourceKey({ bundleName: '', moduleName: '', id: 42 });
      const reverseSame: boolean = ResourceUtils.isSameResource({ bundleName: '', moduleName: '', id: 42 },
        { bundleName: '', moduleName: '', id: 42 });
      const forwardSame: boolean = ResourceUtils.isSameResource({ bundleName: '', moduleName: '', id: 42 },
        { bundleName: '', moduleName: '', id: 42 });
      const result: string = String(forwardSame);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('true'));
      expect(result).assertEqual('true');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(String(reverseSame)), String('true'));
      expect(String(reverseSame)).assertEqual('true');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(String(leftKey === rightKey)), String('true'));
      expect(String(leftKey === rightKey)).assertEqual('true');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsSameRes0056 end');
    })

    /**
     * @tc.name   testResourceUtilsSameRes0057
     * @tc.number SUB_RESMGR_UTILS27_0057
     * @tc.desc   id 4096 without bundle and module is reflexive
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsSameRes0057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsSameRes0057 begin');
      const leftKey: string = ResourceUtils.resourceKey({ bundleName: '', moduleName: '', id: 4096 });
      const rightKey: string = ResourceUtils.resourceKey({ bundleName: '', moduleName: '', id: 4096 });
      const reverseSame: boolean = ResourceUtils.isSameResource({ bundleName: '', moduleName: '', id: 4096 },
        { bundleName: '', moduleName: '', id: 4096 });
      const forwardSame: boolean = ResourceUtils.isSameResource({ bundleName: '', moduleName: '', id: 4096 },
        { bundleName: '', moduleName: '', id: 4096 });
      const result: string = String(forwardSame);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('true'));
      expect(result).assertEqual('true');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(String(reverseSame)), String('true'));
      expect(String(reverseSame)).assertEqual('true');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(String(leftKey === rightKey)), String('true'));
      expect(String(leftKey === rightKey)).assertEqual('true');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsSameRes0057 end');
    })

    /**
     * @tc.name   testResourceUtilsSameRes0058
     * @tc.number SUB_RESMGR_UTILS27_0058
     * @tc.desc   id 65535 without bundle and module is reflexive
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsSameRes0058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsSameRes0058 begin');
      const leftKey: string = ResourceUtils.resourceKey({ bundleName: '', moduleName: '', id: 65535 });
      const rightKey: string = ResourceUtils.resourceKey({ bundleName: '', moduleName: '', id: 65535 });
      const reverseSame: boolean = ResourceUtils.isSameResource({ bundleName: '', moduleName: '', id: 65535 },
        { bundleName: '', moduleName: '', id: 65535 });
      const forwardSame: boolean = ResourceUtils.isSameResource({ bundleName: '', moduleName: '', id: 65535 },
        { bundleName: '', moduleName: '', id: 65535 });
      const result: string = String(forwardSame);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('true'));
      expect(result).assertEqual('true');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(String(reverseSame)), String('true'));
      expect(String(reverseSame)).assertEqual('true');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(String(leftKey === rightKey)), String('true'));
      expect(String(leftKey === rightKey)).assertEqual('true');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsSameRes0058 end');
    })

    /**
     * @tc.name   testResourceUtilsSameRes0059
     * @tc.number SUB_RESMGR_UTILS27_0059
     * @tc.desc   bundle, module and id differ for id 300
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsSameRes0059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsSameRes0059 begin');
      const leftKey: string = ResourceUtils.resourceKey({ bundleName: 'ohos.samples.resourcemanager',
        moduleName: 'entry', id: 300 });
      const rightKey: string = ResourceUtils.resourceKey({ bundleName: 'other.bundle', moduleName: 'other.module',
        id: 310 });
      const reverseSame: boolean = ResourceUtils.isSameResource({ bundleName: 'other.bundle',
        moduleName: 'other.module', id: 310 }, { bundleName: 'ohos.samples.resourcemanager', moduleName: 'entry',
          id: 300 });
      const forwardSame: boolean = ResourceUtils.isSameResource({ bundleName: 'ohos.samples.resourcemanager',
        moduleName: 'entry', id: 300 }, { bundleName: 'other.bundle', moduleName: 'other.module', id: 310 });
      const result: string = String(forwardSame);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('false'));
      expect(result).assertEqual('false');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(String(reverseSame)), String('false'));
      expect(String(reverseSame)).assertEqual('false');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(String(leftKey === rightKey)), String('false'));
      expect(String(leftKey === rightKey)).assertEqual('false');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsSameRes0059 end');
    })

    /**
     * @tc.name   testResourceUtilsSameRes0060
     * @tc.number SUB_RESMGR_UTILS27_0060
     * @tc.desc   bundle, module and id differ for id 301
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsSameRes0060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsSameRes0060 begin');
      const leftKey: string = ResourceUtils.resourceKey({ bundleName: 'ohos.samples.resourcemanager',
        moduleName: 'entry', id: 301 });
      const rightKey: string = ResourceUtils.resourceKey({ bundleName: 'other.bundle', moduleName: 'other.module',
        id: 311 });
      const reverseSame: boolean = ResourceUtils.isSameResource({ bundleName: 'other.bundle',
        moduleName: 'other.module', id: 311 }, { bundleName: 'ohos.samples.resourcemanager', moduleName: 'entry',
          id: 301 });
      const forwardSame: boolean = ResourceUtils.isSameResource({ bundleName: 'ohos.samples.resourcemanager',
        moduleName: 'entry', id: 301 }, { bundleName: 'other.bundle', moduleName: 'other.module', id: 311 });
      const result: string = String(forwardSame);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('false'));
      expect(result).assertEqual('false');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(String(reverseSame)), String('false'));
      expect(String(reverseSame)).assertEqual('false');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(String(leftKey === rightKey)), String('false'));
      expect(String(leftKey === rightKey)).assertEqual('false');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsSameRes0060 end');
    })

    /**
     * @tc.name   testResourceUtilsSameRes0061
     * @tc.number SUB_RESMGR_UTILS27_0061
     * @tc.desc   bundle, module and id differ for id 302
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsSameRes0061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsSameRes0061 begin');
      const leftKey: string = ResourceUtils.resourceKey({ bundleName: 'ohos.samples.resourcemanager',
        moduleName: 'entry', id: 302 });
      const rightKey: string = ResourceUtils.resourceKey({ bundleName: 'other.bundle', moduleName: 'other.module',
        id: 312 });
      const reverseSame: boolean = ResourceUtils.isSameResource({ bundleName: 'other.bundle',
        moduleName: 'other.module', id: 312 }, { bundleName: 'ohos.samples.resourcemanager', moduleName: 'entry',
          id: 302 });
      const forwardSame: boolean = ResourceUtils.isSameResource({ bundleName: 'ohos.samples.resourcemanager',
        moduleName: 'entry', id: 302 }, { bundleName: 'other.bundle', moduleName: 'other.module', id: 312 });
      const result: string = String(forwardSame);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('false'));
      expect(result).assertEqual('false');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(String(reverseSame)), String('false'));
      expect(String(reverseSame)).assertEqual('false');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(String(leftKey === rightKey)), String('false'));
      expect(String(leftKey === rightKey)).assertEqual('false');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsSameRes0061 end');
    })

    /**
     * @tc.name   testResourceUtilsSameRes0062
     * @tc.number SUB_RESMGR_UTILS27_0062
     * @tc.desc   bundle, module and id differ for id 303
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsSameRes0062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsSameRes0062 begin');
      const leftKey: string = ResourceUtils.resourceKey({ bundleName: 'ohos.samples.resourcemanager',
        moduleName: 'entry', id: 303 });
      const rightKey: string = ResourceUtils.resourceKey({ bundleName: 'other.bundle', moduleName: 'other.module',
        id: 313 });
      const reverseSame: boolean = ResourceUtils.isSameResource({ bundleName: 'other.bundle',
        moduleName: 'other.module', id: 313 }, { bundleName: 'ohos.samples.resourcemanager', moduleName: 'entry',
          id: 303 });
      const forwardSame: boolean = ResourceUtils.isSameResource({ bundleName: 'ohos.samples.resourcemanager',
        moduleName: 'entry', id: 303 }, { bundleName: 'other.bundle', moduleName: 'other.module', id: 313 });
      const result: string = String(forwardSame);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('false'));
      expect(result).assertEqual('false');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(String(reverseSame)), String('false'));
      expect(String(reverseSame)).assertEqual('false');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(String(leftKey === rightKey)), String('false'));
      expect(String(leftKey === rightKey)).assertEqual('false');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsSameRes0062 end');
    })

    /**
     * @tc.name   testResourceUtilsSameRes0063
     * @tc.number SUB_RESMGR_UTILS27_0063
     * @tc.desc   separator ambiguity: 'a:b'/'c' and 'a'/'b:c' render the same key
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsSameRes0063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsSameRes0063 begin');
      const leftKey: string = ResourceUtils.resourceKey({ bundleName: 'a:b', moduleName: 'c', id: 1 });
      const rightKey: string = ResourceUtils.resourceKey({ bundleName: 'a', moduleName: 'b:c', id: 1 });
      const reverseSame: boolean = ResourceUtils.isSameResource({ bundleName: 'a', moduleName: 'b:c', id: 1 },
        { bundleName: 'a:b', moduleName: 'c', id: 1 });
      const forwardSame: boolean = ResourceUtils.isSameResource({ bundleName: 'a:b', moduleName: 'c', id: 1 },
        { bundleName: 'a', moduleName: 'b:c', id: 1 });
      const result: string = String(forwardSame);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('true'));
      expect(result).assertEqual('true');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(String(reverseSame)), String('true'));
      expect(String(reverseSame)).assertEqual('true');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(String(leftKey === rightKey)), String('true'));
      expect(String(leftKey === rightKey)).assertEqual('true');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsSameRes0063 end');
    })

    /**
     * @tc.name   testResourceUtilsSameRes0064
     * @tc.number SUB_RESMGR_UTILS27_0064
     * @tc.desc   separator ambiguity is symmetric for the same pair
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsSameRes0064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsSameRes0064 begin');
      const leftKey: string = ResourceUtils.resourceKey({ bundleName: 'a', moduleName: 'b:c', id: 1 });
      const rightKey: string = ResourceUtils.resourceKey({ bundleName: 'a:b', moduleName: 'c', id: 1 });
      const reverseSame: boolean = ResourceUtils.isSameResource({ bundleName: 'a:b', moduleName: 'c', id: 1 },
        { bundleName: 'a', moduleName: 'b:c', id: 1 });
      const forwardSame: boolean = ResourceUtils.isSameResource({ bundleName: 'a', moduleName: 'b:c', id: 1 },
        { bundleName: 'a:b', moduleName: 'c', id: 1 });
      const result: string = String(forwardSame);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('true'));
      expect(result).assertEqual('true');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(String(reverseSame)), String('true'));
      expect(String(reverseSame)).assertEqual('true');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(String(leftKey === rightKey)), String('true'));
      expect(String(leftKey === rightKey)).assertEqual('true');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsSameRes0064 end');
    })

    /**
     * @tc.name   testResourceUtilsSameRes0065
     * @tc.number SUB_RESMGR_UTILS27_0065
     * @tc.desc   separator ambiguity still separates different ids
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsSameRes0065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsSameRes0065 begin');
      const leftKey: string = ResourceUtils.resourceKey({ bundleName: 'a:b', moduleName: 'c', id: 1 });
      const rightKey: string = ResourceUtils.resourceKey({ bundleName: 'a:b', moduleName: 'c', id: 2 });
      const reverseSame: boolean = ResourceUtils.isSameResource({ bundleName: 'a:b', moduleName: 'c', id: 2 },
        { bundleName: 'a:b', moduleName: 'c', id: 1 });
      const forwardSame: boolean = ResourceUtils.isSameResource({ bundleName: 'a:b', moduleName: 'c', id: 1 },
        { bundleName: 'a:b', moduleName: 'c', id: 2 });
      const result: string = String(forwardSame);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('false'));
      expect(result).assertEqual('false');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(String(reverseSame)), String('false'));
      expect(String(reverseSame)).assertEqual('false');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(String(leftKey === rightKey)), String('false'));
      expect(String(leftKey === rightKey)).assertEqual('false');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsSameRes0065 end');
    })

    /**
     * @tc.name   testResourceUtilsSameRes0066
     * @tc.number SUB_RESMGR_UTILS27_0066
     * @tc.desc   one colon inside the module name changes the key
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsSameRes0066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsSameRes0066 begin');
      const leftKey: string = ResourceUtils.resourceKey({ bundleName: 'a', moduleName: 'b:c', id: 1 });
      const rightKey: string = ResourceUtils.resourceKey({ bundleName: 'a', moduleName: 'b', id: 1 });
      const reverseSame: boolean = ResourceUtils.isSameResource({ bundleName: 'a', moduleName: 'b', id: 1 },
        { bundleName: 'a', moduleName: 'b:c', id: 1 });
      const forwardSame: boolean = ResourceUtils.isSameResource({ bundleName: 'a', moduleName: 'b:c', id: 1 },
        { bundleName: 'a', moduleName: 'b', id: 1 });
      const result: string = String(forwardSame);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('false'));
      expect(result).assertEqual('false');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(String(reverseSame)), String('false'));
      expect(String(reverseSame)).assertEqual('false');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(String(leftKey === rightKey)), String('false'));
      expect(String(leftKey === rightKey)).assertEqual('false');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsSameRes0066 end');
    })

    /**
     * @tc.name   testResourceUtilsSameRes0067
     * @tc.number SUB_RESMGR_UTILS27_0067
     * @tc.desc   leading space in bundleName changes the key
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsSameRes0067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsSameRes0067 begin');
      const leftKey: string = ResourceUtils.resourceKey({ bundleName: 'ohos.samples.resourcemanager',
        moduleName: 'entry', id: 100 });
      const rightKey: string = ResourceUtils.resourceKey({ bundleName: ' ohos.samples.resourcemanager',
        moduleName: 'entry', id: 100 });
      const reverseSame: boolean = ResourceUtils.isSameResource({ bundleName: ' ohos.samples.resourcemanager',
        moduleName: 'entry', id: 100 }, { bundleName: 'ohos.samples.resourcemanager', moduleName: 'entry', id: 100 });
      const forwardSame: boolean = ResourceUtils.isSameResource({ bundleName: 'ohos.samples.resourcemanager',
        moduleName: 'entry', id: 100 }, { bundleName: ' ohos.samples.resourcemanager', moduleName: 'entry', id: 100 });
      const result: string = String(forwardSame);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('false'));
      expect(result).assertEqual('false');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(String(reverseSame)), String('false'));
      expect(String(reverseSame)).assertEqual('false');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(String(leftKey === rightKey)), String('false'));
      expect(String(leftKey === rightKey)).assertEqual('false');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsSameRes0067 end');
    })

    /**
     * @tc.name   testResourceUtilsSameRes0068
     * @tc.number SUB_RESMGR_UTILS27_0068
     * @tc.desc   leading space in moduleName changes the key
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsSameRes0068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsSameRes0068 begin');
      const leftKey: string = ResourceUtils.resourceKey({ bundleName: 'ohos.samples.resourcemanager',
        moduleName: ' entry', id: 100 });
      const rightKey: string = ResourceUtils.resourceKey({ bundleName: 'ohos.samples.resourcemanager',
        moduleName: 'entry', id: 100 });
      const reverseSame: boolean = ResourceUtils.isSameResource({ bundleName: 'ohos.samples.resourcemanager',
        moduleName: 'entry', id: 100 }, { bundleName: 'ohos.samples.resourcemanager', moduleName: ' entry', id: 100 });
      const forwardSame: boolean = ResourceUtils.isSameResource({ bundleName: 'ohos.samples.resourcemanager',
        moduleName: ' entry', id: 100 }, { bundleName: 'ohos.samples.resourcemanager', moduleName: 'entry', id: 100 });
      const result: string = String(forwardSame);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('false'));
      expect(result).assertEqual('false');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(String(reverseSame)), String('false'));
      expect(String(reverseSame)).assertEqual('false');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(String(leftKey === rightKey)), String('false'));
      expect(String(leftKey === rightKey)).assertEqual('false');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsSameRes0068 end');
    })

    /**
     * @tc.name   testResourceUtilsSameRes0069
     * @tc.number SUB_RESMGR_UTILS27_0069
     * @tc.desc   upper case bundleName changes the key
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsSameRes0069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsSameRes0069 begin');
      const leftKey: string = ResourceUtils.resourceKey({ bundleName: 'OHOS.SAMPLES.RESOURCEMANAGER',
        moduleName: 'entry', id: 100 });
      const rightKey: string = ResourceUtils.resourceKey({ bundleName: 'ohos.samples.resourcemanager',
        moduleName: 'entry', id: 100 });
      const reverseSame: boolean = ResourceUtils.isSameResource({ bundleName: 'ohos.samples.resourcemanager',
        moduleName: 'entry', id: 100 }, { bundleName: 'OHOS.SAMPLES.RESOURCEMANAGER', moduleName: 'entry', id: 100 });
      const forwardSame: boolean = ResourceUtils.isSameResource({ bundleName: 'OHOS.SAMPLES.RESOURCEMANAGER',
        moduleName: 'entry', id: 100 }, { bundleName: 'ohos.samples.resourcemanager', moduleName: 'entry', id: 100 });
      const result: string = String(forwardSame);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('false'));
      expect(result).assertEqual('false');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(String(reverseSame)), String('false'));
      expect(String(reverseSame)).assertEqual('false');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(String(leftKey === rightKey)), String('false'));
      expect(String(leftKey === rightKey)).assertEqual('false');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsSameRes0069 end');
    })

    /**
     * @tc.name   testResourceUtilsSameRes0070
     * @tc.number SUB_RESMGR_UTILS27_0070
     * @tc.desc   upper case moduleName changes the key
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsSameRes0070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsSameRes0070 begin');
      const leftKey: string = ResourceUtils.resourceKey({ bundleName: 'ohos.samples.resourcemanager',
        moduleName: 'ENTRY', id: 100 });
      const rightKey: string = ResourceUtils.resourceKey({ bundleName: 'ohos.samples.resourcemanager',
        moduleName: 'entry', id: 100 });
      const reverseSame: boolean = ResourceUtils.isSameResource({ bundleName: 'ohos.samples.resourcemanager',
        moduleName: 'entry', id: 100 }, { bundleName: 'ohos.samples.resourcemanager', moduleName: 'ENTRY', id: 100 });
      const forwardSame: boolean = ResourceUtils.isSameResource({ bundleName: 'ohos.samples.resourcemanager',
        moduleName: 'ENTRY', id: 100 }, { bundleName: 'ohos.samples.resourcemanager', moduleName: 'entry', id: 100 });
      const result: string = String(forwardSame);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('false'));
      expect(result).assertEqual('false');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(String(reverseSame)), String('false'));
      expect(String(reverseSame)).assertEqual('false');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(String(leftKey === rightKey)), String('false'));
      expect(String(leftKey === rightKey)).assertEqual('false');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsSameRes0070 end');
    })

    /**
     * @tc.name   testResourceUtilsSameRes0071
     * @tc.number SUB_RESMGR_UTILS27_0071
     * @tc.desc   bundles a.b and a.c differ for the same module and id
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsSameRes0071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsSameRes0071 begin');
      const leftKey: string = ResourceUtils.resourceKey({ bundleName: 'a.b', moduleName: 'entry', id: 7 });
      const rightKey: string = ResourceUtils.resourceKey({ bundleName: 'a.c', moduleName: 'entry', id: 7 });
      const reverseSame: boolean = ResourceUtils.isSameResource({ bundleName: 'a.c', moduleName: 'entry', id: 7 },
        { bundleName: 'a.b', moduleName: 'entry', id: 7 });
      const forwardSame: boolean = ResourceUtils.isSameResource({ bundleName: 'a.b', moduleName: 'entry', id: 7 },
        { bundleName: 'a.c', moduleName: 'entry', id: 7 });
      const result: string = String(forwardSame);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('false'));
      expect(result).assertEqual('false');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(String(reverseSame)), String('false'));
      expect(String(reverseSame)).assertEqual('false');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(String(leftKey === rightKey)), String('false'));
      expect(String(leftKey === rightKey)).assertEqual('false');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsSameRes0071 end');
    })

    /**
     * @tc.name   testResourceUtilsSameRes0072
     * @tc.number SUB_RESMGR_UTILS27_0072
     * @tc.desc   bundles a.b are identical for the same module and id
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsSameRes0072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsSameRes0072 begin');
      const leftKey: string = ResourceUtils.resourceKey({ bundleName: 'a.b', moduleName: 'entry', id: 7 });
      const rightKey: string = ResourceUtils.resourceKey({ bundleName: 'a.b', moduleName: 'entry', id: 7 });
      const reverseSame: boolean = ResourceUtils.isSameResource({ bundleName: 'a.b', moduleName: 'entry', id: 7 },
        { bundleName: 'a.b', moduleName: 'entry', id: 7 });
      const forwardSame: boolean = ResourceUtils.isSameResource({ bundleName: 'a.b', moduleName: 'entry', id: 7 },
        { bundleName: 'a.b', moduleName: 'entry', id: 7 });
      const result: string = String(forwardSame);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('true'));
      expect(result).assertEqual('true');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(String(reverseSame)), String('true'));
      expect(String(reverseSame)).assertEqual('true');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(String(leftKey === rightKey)), String('true'));
      expect(String(leftKey === rightKey)).assertEqual('true');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsSameRes0072 end');
    })

    /**
     * @tc.name   testResourceUtilsSameRes0073
     * @tc.number SUB_RESMGR_UTILS27_0073
     * @tc.desc   bundle 与 module 为空串时键退化为 -:-:id，与带值三元组互不相同
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsSameRes0073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsSameRes0073 begin');
      const omitted: string = ResourceUtils.resourceKey({ bundleName: '', moduleName: '', id: 7 });
      const explicit: string = ResourceUtils.resourceKey({ bundleName: 'ohos.samples.resourcemanager',
        moduleName: 'entry', id: 7 });
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(omitted), String('-:-:7'));
      expect(omitted).assertEqual('-:-:7');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(explicit),
        String('ohos.samples.resourcemanager:entry:7'));
      expect(explicit).assertEqual('ohos.samples.resourcemanager:entry:7');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(explicit === omitted));
      expect(explicit === omitted).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s',
        String(ResourceUtils.isSameResource({ bundleName: '', moduleName: '', id: 7 },
          { bundleName: '', moduleName: '', id: 7 })));
      expect(ResourceUtils.isSameResource({ bundleName: '', moduleName: '', id: 7 },
        { bundleName: '', moduleName: '', id: 7 })).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s',
        String(ResourceUtils.isSameResource({ bundleName: '', moduleName: '', id: 7 },
          { bundleName: '', moduleName: '', id: 8 })));
      expect(ResourceUtils.isSameResource({ bundleName: '', moduleName: '', id: 7 },
        { bundleName: '', moduleName: '', id: 8 })).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsSameRes0073 end');
    })

  })
}
