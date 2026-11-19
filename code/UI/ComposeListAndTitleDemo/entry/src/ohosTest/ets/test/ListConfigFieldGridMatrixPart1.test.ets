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
import { delayTick } from './shared/AsyncYield';
import { ListConfigFactory } from '../../../main/ets/model/ListModels';
import { IconType, IconTypeV2 } from '@kit.ArkUI';

import { hilog } from '@kit.PerformanceAnalysisKit';

const DOMAIN: number = 0xF816;
const TAG: string = '[Sample_ComposeList]';

export default function ListConfigFieldGridMatrixPart1Test(): void {
  describe('ListConfigFieldGridMatrixPart1', () => {

    /**
     * @tc.number    SUB_COMPOSE_LCFP1_0100
     * @tc.name      testIsolationVOne0001
     * @tc.desc      Verify V1 switch field isolation.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testIsolationVOne0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testIsolationVOne0001 begin');
      await delayTick();
      const op = ListConfigFactory.buildV1OperateSwitch(false, (v: boolean): void => {});
      expect(op.icon === undefined).assertTrue();
      expect(op.arrow === undefined).assertTrue();
      expect(op.button === undefined).assertTrue();
      expect(op.image === undefined).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testIsolationVOne0001 end');
    })

    /**
     * @tc.number    SUB_COMPOSE_LCFP1_0200
     * @tc.name      testIsolationVOne0002
     * @tc.desc      Verify V1 checkbox field isolation.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testIsolationVOne0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testIsolationVOne0002 begin');
      await delayTick();
      const op = ListConfigFactory.buildV1OperateCheckbox(false, (v: boolean): void => {});
      expect(op.icon === undefined).assertTrue();
      expect(op.arrow === undefined).assertTrue();
      expect(op.button === undefined).assertTrue();
      expect(op.image === undefined).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testIsolationVOne0002 end');
    })

    /**
     * @tc.number    SUB_COMPOSE_LCFP1_0300
     * @tc.name      testIsolationVOne0003
     * @tc.desc      Verify V1 radio field isolation.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testIsolationVOne0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testIsolationVOne0003 begin');
      await delayTick();
      const op = ListConfigFactory.buildV1OperateRadio(false, (v: boolean): void => {});
      expect(op.icon === undefined).assertTrue();
      expect(op.arrow === undefined).assertTrue();
      expect(op.button === undefined).assertTrue();
      expect(op.image === undefined).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testIsolationVOne0003 end');
    })

    /**
     * @tc.number    SUB_COMPOSE_LCFP1_0400
     * @tc.name      testIsolationVTwo0004
     * @tc.desc      Verify V2 Toggle field isolation.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testIsolationVTwo0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testIsolationVTwo0004 begin');
      await delayTick();
      const op = ListConfigFactory.buildV2OperateToggle(false, (v: boolean): void => {});
      expect(op.arrow === undefined).assertTrue();
      expect(op.button === undefined).assertTrue();
      expect(op.image === undefined).assertTrue();
      expect(op.text === undefined).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testIsolationVTwo0004 end');
    })

    /**
     * @tc.number    SUB_COMPOSE_LCFP1_0500
     * @tc.name      testIsolationVTwo0005
     * @tc.desc      Verify V2 Checkbox field isolation.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testIsolationVTwo0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testIsolationVTwo0005 begin');
      await delayTick();
      const op = ListConfigFactory.buildV2OperateCheckbox(false, (v: boolean): void => {});
      expect(op.arrow === undefined).assertTrue();
      expect(op.button === undefined).assertTrue();
      expect(op.image === undefined).assertTrue();
      expect(op.text === undefined).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testIsolationVTwo0005 end');
    })

    /**
     * @tc.number    SUB_COMPOSE_LCFP1_0600
     * @tc.name      testV1Instances0006
     * @tc.desc      Verify V1 instances distinct 1.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testV1Instances0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testV1Instances0006 begin');
      await delayTick();
      const a = ListConfigFactory.buildV1ContentItem("i.png", IconType.NORMAL_ICON, "p", "s");
      const b = ListConfigFactory.buildV1ContentItem("i.png", IconType.NORMAL_ICON, "p", "s");
      expect(a === b).assertFalse();
      expect(a.primaryText).assertEqual(b.primaryText);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testV1Instances0006 end');
    })

    /**
     * @tc.number    SUB_COMPOSE_LCFP1_0700
     * @tc.name      testV2Instances0007
     * @tc.desc      Verify V2 instances distinct 1.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testV2Instances0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testV2Instances0007 begin');
      await delayTick();
      const a = ListConfigFactory.buildV2ContentItem("i.png", IconTypeV2.NORMAL_ICON, "p", "s");
      const b = ListConfigFactory.buildV2ContentItem("i.png", IconTypeV2.NORMAL_ICON, "p", "s");
      expect(a === b).assertFalse();
      expect(a.primaryText).assertEqual(b.primaryText);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testV2Instances0007 end');
    })

  })
}
