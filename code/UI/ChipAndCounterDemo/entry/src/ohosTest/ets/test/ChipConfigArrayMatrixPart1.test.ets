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
import { ChipConfigFactory } from '../../../main/ets/model/ChipModels';
import { ColorMetrics } from '@kit.ArkUI';

import { hilog } from '@kit.PerformanceAnalysisKit';

const DOMAIN: number = 0xF818;
const TAG: string = '[Sample_ChipCounter]';

export default function ChipConfigArrayMatrixPart1Test(): void {
  describe('ChipConfigArrayMatrixPart1', () => {

    /**
     * @tc.number    SUB_CHIP_CCAP1_0100
     * @tc.name      testGroupConfigs0001
     * @tc.desc      Verify group item configs for 1 texts allowClose=False.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testGroupConfigs0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testGroupConfigs0001 begin');
      await delayTick();
      const configs = ChipConfigFactory.buildGroupItemConfigs(["a"], 'icon', false);
      expect(configs.length).assertEqual(1);
      expect(configs[0].label.text).assertEqual('a');
      expect(configs[0].allowClose).assertEqual(false);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testGroupConfigs0001 end');
    })

    /**
     * @tc.number    SUB_CHIP_CCAP1_0200
     * @tc.name      testGroupConfigs0002
     * @tc.desc      Verify group item configs for 2 texts allowClose=True.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testGroupConfigs0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testGroupConfigs0002 begin');
      await delayTick();
      const configs = ChipConfigFactory.buildGroupItemConfigs(["a", "b"], 'icon', true);
      expect(configs.length).assertEqual(2);
      expect(configs[0].label.text).assertEqual('a');
      expect(configs[0].allowClose).assertEqual(true);
      expect(configs[1].label.text).assertEqual('b');
      expect(configs[1].allowClose).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testGroupConfigs0002 end');
    })

    /**
     * @tc.number    SUB_CHIP_CCAP1_0300
     * @tc.name      testGroupConfigs0003
     * @tc.desc      Verify group item configs for 3 texts allowClose=False.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testGroupConfigs0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testGroupConfigs0003 begin');
      await delayTick();
      const configs = ChipConfigFactory.buildGroupItemConfigs(["", "中文", "x"], 'icon', false);
      expect(configs.length).assertEqual(3);
      expect(configs[0].label.text).assertEqual('');
      expect(configs[0].allowClose).assertEqual(false);
      expect(configs[1].label.text).assertEqual('中文');
      expect(configs[1].allowClose).assertEqual(false);
      expect(configs[2].label.text).assertEqual('x');
      expect(configs[2].allowClose).assertEqual(false);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testGroupConfigs0003 end');
    })

    /**
     * @tc.number    SUB_CHIP_CCAP1_0400
     * @tc.name      testGroupConfigs0004
     * @tc.desc      Verify group item configs for 3 texts allowClose=True.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testGroupConfigs0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testGroupConfigs0004 begin');
      await delayTick();
      const configs = ChipConfigFactory.buildGroupItemConfigs(["one", "two", "three"], 'icon', true);
      expect(configs.length).assertEqual(3);
      expect(configs[0].label.text).assertEqual('one');
      expect(configs[0].allowClose).assertEqual(true);
      expect(configs[1].label.text).assertEqual('two');
      expect(configs[1].allowClose).assertEqual(true);
      expect(configs[2].label.text).assertEqual('three');
      expect(configs[2].allowClose).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testGroupConfigs0004 end');
    })

    /**
     * @tc.number    SUB_CHIP_CCAP1_0500
     * @tc.name      testSegmentItems0005
     * @tc.desc      Verify segment items for 0 texts.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testSegmentItems0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSegmentItems0005 begin');
      await delayTick();
      const items = ChipConfigFactory.buildSegmentItems([]);
      expect(items.length).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSegmentItems0005 end');
    })

    /**
     * @tc.number    SUB_CHIP_CCAP1_0600
     * @tc.name      testSegmentItems0006
     * @tc.desc      Verify segment items for 1 texts.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testSegmentItems0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSegmentItems0006 begin');
      await delayTick();
      const items = ChipConfigFactory.buildSegmentItems(["a"]);
      expect(items.length).assertEqual(1);
      expect(items[0].text).assertEqual('a');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSegmentItems0006 end');
    })

    /**
     * @tc.number    SUB_CHIP_CCAP1_0700
     * @tc.name      testSegmentItems0007
     * @tc.desc      Verify segment items for 3 texts.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testSegmentItems0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSegmentItems0007 begin');
      await delayTick();
      const items = ChipConfigFactory.buildSegmentItems(["a", "b", "c"]);
      expect(items.length).assertEqual(3);
      expect(items[0].text).assertEqual('a');
      expect(items[1].text).assertEqual('b');
      expect(items[2].text).assertEqual('c');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSegmentItems0007 end');
    })

    /**
     * @tc.number    SUB_CHIP_CCAP1_0800
     * @tc.name      testSegmentItems0008
     * @tc.desc      Verify segment items for 2 texts.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testSegmentItems0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSegmentItems0008 begin');
      await delayTick();
      const items = ChipConfigFactory.buildSegmentItems(["中文", ""]);
      expect(items.length).assertEqual(2);
      expect(items[0].text).assertEqual('中文');
      expect(items[1].text).assertEqual('');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSegmentItems0008 end');
    })

    /**
     * @tc.number    SUB_CHIP_CCAP1_0900
     * @tc.name      testLabelConfig0009
     * @tc.desc      Verify label config text ''.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testLabelConfig0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLabelConfig0009 begin');
      await delayTick();
      const config = ChipConfigFactory.buildLabelConfig('');
      expect(config.text).assertEqual('');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLabelConfig0009 end');
    })

    /**
     * @tc.number    SUB_CHIP_CCAP1_1000
     * @tc.name      testLabelConfig0010
     * @tc.desc      Verify label config text 'a'.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testLabelConfig0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLabelConfig0010 begin');
      await delayTick();
      const config = ChipConfigFactory.buildLabelConfig('a');
      expect(config.text).assertEqual('a');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLabelConfig0010 end');
    })

    /**
     * @tc.number    SUB_CHIP_CCAP1_1100
     * @tc.name      testLabelConfig0011
     * @tc.desc      Verify label config text '中文'.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testLabelConfig0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLabelConfig0011 begin');
      await delayTick();
      const config = ChipConfigFactory.buildLabelConfig('中文');
      expect(config.text).assertEqual('中文');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLabelConfig0011 end');
    })

    /**
     * @tc.number    SUB_CHIP_CCAP1_1200
     * @tc.name      testLabelColor0012
     * @tc.desc      Verify label config keeps activated color.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testLabelColor0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLabelColor0012 begin');
      await delayTick();
      const config = ChipConfigFactory.buildLabelConfig('x', ColorMetrics.resourceColor('#123456'));
      expect(config.text).assertEqual('x');
      expect(config.activatedFontColor !== undefined).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLabelColor0012 end');
    })

  })
}
