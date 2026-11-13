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

import { describe, expect, it, Level, Size, TestType } from '@ohos/hypium';
import { StartOptions } from '@kit.AbilityKit';
import { hilog } from '@kit.PerformanceAnalysisKit';
import { buildStartOptions, formatStartOptions } from '../../../main/ets/model/LaunchIntent';

const DOMAIN: number = 0xFF00;
const TAG: string = '[Sample_AbilityFeature_OptionsFormat]';

export default function startOptionsFormatTest(): void {
  describe('AbilityFeatureStartOptionsFormatTest', () => {
    /**
     * @tc.number    SUB_ABILITY_FEATURE_OPTIONS_FORMAT_0001
     * @tc.name      testStartOptionsFormat0001
     * @tc.desc      displayId=0、动效true、窗口(50,100,300,400)格式化为固定六段文本
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testStartOptionsFormat0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartOptionsFormat0001 begin');
      const options: StartOptions = { displayId: 0, withAnimation: true, windowLeft: 50, windowTop: 100, windowWidth: 300, windowHeight: 400 };
      const text: string = formatStartOptions(options);
      expect(text).assertEqual('displayId=0, withAnimation=true, left=50, top=100, width=300, height=400');
      expect(text.split(', ').length).assertEqual(6);
      expect(text.startsWith('displayId=0, withAnimation=true, ')).assertTrue();
      expect(text.endsWith('width=300, height=400')).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartOptionsFormat0001 end');
    })

    /**
     * @tc.number    SUB_ABILITY_FEATURE_OPTIONS_FORMAT_0002
     * @tc.name      testStartOptionsFormat0002
     * @tc.desc      displayId=0、动效true、窗口(0,0,0,0)格式化为固定六段文本
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testStartOptionsFormat0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartOptionsFormat0002 begin');
      const options: StartOptions = { displayId: 0, withAnimation: true, windowLeft: 0, windowTop: 0, windowWidth: 0, windowHeight: 0 };
      const text: string = formatStartOptions(options);
      expect(text).assertEqual('displayId=0, withAnimation=true, left=0, top=0, width=0, height=0');
      expect(text.split(', ').length).assertEqual(6);
      expect(text.startsWith('displayId=0, withAnimation=true, ')).assertTrue();
      expect(text.endsWith('width=0, height=0')).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartOptionsFormat0002 end');
    })

    /**
     * @tc.number    SUB_ABILITY_FEATURE_OPTIONS_FORMAT_0003
     * @tc.name      testStartOptionsFormat0003
     * @tc.desc      displayId=0、动效true、窗口(-10,-20,1920,1080)格式化为固定六段文本
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testStartOptionsFormat0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartOptionsFormat0003 begin');
      const options: StartOptions = { displayId: 0, withAnimation: true, windowLeft: -10, windowTop: -20, windowWidth: 1920, windowHeight: 1080 };
      const text: string = formatStartOptions(options);
      expect(text).assertEqual('displayId=0, withAnimation=true, left=-10, top=-20, width=1920, height=1080');
      expect(text.split(', ').length).assertEqual(6);
      expect(text.startsWith('displayId=0, withAnimation=true, ')).assertTrue();
      expect(text.endsWith('width=1920, height=1080')).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartOptionsFormat0003 end');
    })

    /**
     * @tc.number    SUB_ABILITY_FEATURE_OPTIONS_FORMAT_0004
     * @tc.name      testStartOptionsFormat0004
     * @tc.desc      displayId=0、动效true、窗口(缺省,缺省,缺省,缺省)格式化为固定六段文本
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testStartOptionsFormat0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartOptionsFormat0004 begin');
      const options: StartOptions = { displayId: 0, withAnimation: true };
      const text: string = formatStartOptions(options);
      expect(text).assertEqual('displayId=0, withAnimation=true, left=undefined, top=undefined, width=undefined, height=undefined');
      expect(text.split(', ').length).assertEqual(6);
      expect(text.startsWith('displayId=0, withAnimation=true, ')).assertTrue();
      expect(text.endsWith('width=undefined, height=undefined')).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartOptionsFormat0004 end');
    })

    /**
     * @tc.number    SUB_ABILITY_FEATURE_OPTIONS_FORMAT_0005
     * @tc.name      testStartOptionsFormat0005
     * @tc.desc      displayId=0、动效true、窗口(1,2,3,4)格式化为固定六段文本
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testStartOptionsFormat0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartOptionsFormat0005 begin');
      const options: StartOptions = { displayId: 0, withAnimation: true, windowLeft: 1, windowTop: 2, windowWidth: 3, windowHeight: 4 };
      const text: string = formatStartOptions(options);
      expect(text).assertEqual('displayId=0, withAnimation=true, left=1, top=2, width=3, height=4');
      expect(text.split(', ').length).assertEqual(6);
      expect(text.startsWith('displayId=0, withAnimation=true, ')).assertTrue();
      expect(text.endsWith('width=3, height=4')).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartOptionsFormat0005 end');
    })

    /**
     * @tc.number    SUB_ABILITY_FEATURE_OPTIONS_FORMAT_0006
     * @tc.name      testStartOptionsFormat0006
     * @tc.desc      displayId=0、动效true、窗口(0.5,1.25,99.9,100)格式化为固定六段文本
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testStartOptionsFormat0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartOptionsFormat0006 begin');
      const options: StartOptions = { displayId: 0, withAnimation: true, windowLeft: 0.5, windowTop: 1.25, windowWidth: 99.9, windowHeight: 100 };
      const text: string = formatStartOptions(options);
      expect(text).assertEqual('displayId=0, withAnimation=true, left=0.5, top=1.25, width=99.9, height=100');
      expect(text.split(', ').length).assertEqual(6);
      expect(text.startsWith('displayId=0, withAnimation=true, ')).assertTrue();
      expect(text.endsWith('width=99.9, height=100')).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartOptionsFormat0006 end');
    })

    /**
     * @tc.number    SUB_ABILITY_FEATURE_OPTIONS_FORMAT_0007
     * @tc.name      testStartOptionsFormat0007
     * @tc.desc      displayId=0、动效false、窗口(50,100,300,400)格式化为固定六段文本
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testStartOptionsFormat0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartOptionsFormat0007 begin');
      const options: StartOptions = { displayId: 0, withAnimation: false, windowLeft: 50, windowTop: 100, windowWidth: 300, windowHeight: 400 };
      const text: string = formatStartOptions(options);
      expect(text).assertEqual('displayId=0, withAnimation=false, left=50, top=100, width=300, height=400');
      expect(text.split(', ').length).assertEqual(6);
      expect(text.startsWith('displayId=0, withAnimation=false, ')).assertTrue();
      expect(text.endsWith('width=300, height=400')).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartOptionsFormat0007 end');
    })

    /**
     * @tc.number    SUB_ABILITY_FEATURE_OPTIONS_FORMAT_0008
     * @tc.name      testStartOptionsFormat0008
     * @tc.desc      displayId=0、动效false、窗口(0,0,0,0)格式化为固定六段文本
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testStartOptionsFormat0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartOptionsFormat0008 begin');
      const options: StartOptions = { displayId: 0, withAnimation: false, windowLeft: 0, windowTop: 0, windowWidth: 0, windowHeight: 0 };
      const text: string = formatStartOptions(options);
      expect(text).assertEqual('displayId=0, withAnimation=false, left=0, top=0, width=0, height=0');
      expect(text.split(', ').length).assertEqual(6);
      expect(text.startsWith('displayId=0, withAnimation=false, ')).assertTrue();
      expect(text.endsWith('width=0, height=0')).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartOptionsFormat0008 end');
    })

    /**
     * @tc.number    SUB_ABILITY_FEATURE_OPTIONS_FORMAT_0009
     * @tc.name      testStartOptionsFormat0009
     * @tc.desc      displayId=0、动效false、窗口(-10,-20,1920,1080)格式化为固定六段文本
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testStartOptionsFormat0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartOptionsFormat0009 begin');
      const options: StartOptions = { displayId: 0, withAnimation: false, windowLeft: -10, windowTop: -20, windowWidth: 1920, windowHeight: 1080 };
      const text: string = formatStartOptions(options);
      expect(text).assertEqual('displayId=0, withAnimation=false, left=-10, top=-20, width=1920, height=1080');
      expect(text.split(', ').length).assertEqual(6);
      expect(text.startsWith('displayId=0, withAnimation=false, ')).assertTrue();
      expect(text.endsWith('width=1920, height=1080')).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartOptionsFormat0009 end');
    })

    /**
     * @tc.number    SUB_ABILITY_FEATURE_OPTIONS_FORMAT_0010
     * @tc.name      testStartOptionsFormat0010
     * @tc.desc      displayId=0、动效false、窗口(缺省,缺省,缺省,缺省)格式化为固定六段文本
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testStartOptionsFormat0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartOptionsFormat0010 begin');
      const options: StartOptions = { displayId: 0, withAnimation: false };
      const text: string = formatStartOptions(options);
      expect(text).assertEqual('displayId=0, withAnimation=false, left=undefined, top=undefined, width=undefined, height=undefined');
      expect(text.split(', ').length).assertEqual(6);
      expect(text.startsWith('displayId=0, withAnimation=false, ')).assertTrue();
      expect(text.endsWith('width=undefined, height=undefined')).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartOptionsFormat0010 end');
    })

    /**
     * @tc.number    SUB_ABILITY_FEATURE_OPTIONS_FORMAT_0011
     * @tc.name      testStartOptionsFormat0011
     * @tc.desc      displayId=0、动效false、窗口(1,2,3,4)格式化为固定六段文本
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testStartOptionsFormat0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartOptionsFormat0011 begin');
      const options: StartOptions = { displayId: 0, withAnimation: false, windowLeft: 1, windowTop: 2, windowWidth: 3, windowHeight: 4 };
      const text: string = formatStartOptions(options);
      expect(text).assertEqual('displayId=0, withAnimation=false, left=1, top=2, width=3, height=4');
      expect(text.split(', ').length).assertEqual(6);
      expect(text.startsWith('displayId=0, withAnimation=false, ')).assertTrue();
      expect(text.endsWith('width=3, height=4')).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartOptionsFormat0011 end');
    })

    /**
     * @tc.number    SUB_ABILITY_FEATURE_OPTIONS_FORMAT_0012
     * @tc.name      testStartOptionsFormat0012
     * @tc.desc      displayId=0、动效false、窗口(0.5,1.25,99.9,100)格式化为固定六段文本
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testStartOptionsFormat0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartOptionsFormat0012 begin');
      const options: StartOptions = { displayId: 0, withAnimation: false, windowLeft: 0.5, windowTop: 1.25, windowWidth: 99.9, windowHeight: 100 };
      const text: string = formatStartOptions(options);
      expect(text).assertEqual('displayId=0, withAnimation=false, left=0.5, top=1.25, width=99.9, height=100');
      expect(text.split(', ').length).assertEqual(6);
      expect(text.startsWith('displayId=0, withAnimation=false, ')).assertTrue();
      expect(text.endsWith('width=99.9, height=100')).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartOptionsFormat0012 end');
    })

    /**
     * @tc.number    SUB_ABILITY_FEATURE_OPTIONS_FORMAT_0013
     * @tc.name      testStartOptionsFormat0013
     * @tc.desc      displayId=0、动效缺省、窗口(50,100,300,400)格式化为固定六段文本
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testStartOptionsFormat0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartOptionsFormat0013 begin');
      const options: StartOptions = { displayId: 0, windowLeft: 50, windowTop: 100, windowWidth: 300, windowHeight: 400 };
      const text: string = formatStartOptions(options);
      expect(text).assertEqual('displayId=0, withAnimation=undefined, left=50, top=100, width=300, height=400');
      expect(text.split(', ').length).assertEqual(6);
      expect(text.startsWith('displayId=0, withAnimation=undefined, ')).assertTrue();
      expect(text.endsWith('width=300, height=400')).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartOptionsFormat0013 end');
    })

    /**
     * @tc.number    SUB_ABILITY_FEATURE_OPTIONS_FORMAT_0014
     * @tc.name      testStartOptionsFormat0014
     * @tc.desc      displayId=0、动效缺省、窗口(0,0,0,0)格式化为固定六段文本
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testStartOptionsFormat0014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartOptionsFormat0014 begin');
      const options: StartOptions = { displayId: 0, windowLeft: 0, windowTop: 0, windowWidth: 0, windowHeight: 0 };
      const text: string = formatStartOptions(options);
      expect(text).assertEqual('displayId=0, withAnimation=undefined, left=0, top=0, width=0, height=0');
      expect(text.split(', ').length).assertEqual(6);
      expect(text.startsWith('displayId=0, withAnimation=undefined, ')).assertTrue();
      expect(text.endsWith('width=0, height=0')).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartOptionsFormat0014 end');
    })

    /**
     * @tc.number    SUB_ABILITY_FEATURE_OPTIONS_FORMAT_0015
     * @tc.name      testStartOptionsFormat0015
     * @tc.desc      displayId=0、动效缺省、窗口(-10,-20,1920,1080)格式化为固定六段文本
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testStartOptionsFormat0015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartOptionsFormat0015 begin');
      const options: StartOptions = { displayId: 0, windowLeft: -10, windowTop: -20, windowWidth: 1920, windowHeight: 1080 };
      const text: string = formatStartOptions(options);
      expect(text).assertEqual('displayId=0, withAnimation=undefined, left=-10, top=-20, width=1920, height=1080');
      expect(text.split(', ').length).assertEqual(6);
      expect(text.startsWith('displayId=0, withAnimation=undefined, ')).assertTrue();
      expect(text.endsWith('width=1920, height=1080')).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartOptionsFormat0015 end');
    })

    /**
     * @tc.number    SUB_ABILITY_FEATURE_OPTIONS_FORMAT_0016
     * @tc.name      testStartOptionsFormat0016
     * @tc.desc      displayId=0、动效缺省、窗口(缺省,缺省,缺省,缺省)格式化为固定六段文本
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testStartOptionsFormat0016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartOptionsFormat0016 begin');
      const options: StartOptions = { displayId: 0 };
      const text: string = formatStartOptions(options);
      expect(text).assertEqual('displayId=0, withAnimation=undefined, left=undefined, top=undefined, width=undefined, height=undefined');
      expect(text.split(', ').length).assertEqual(6);
      expect(text.startsWith('displayId=0, withAnimation=undefined, ')).assertTrue();
      expect(text.endsWith('width=undefined, height=undefined')).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartOptionsFormat0016 end');
    })

    /**
     * @tc.number    SUB_ABILITY_FEATURE_OPTIONS_FORMAT_0017
     * @tc.name      testStartOptionsFormat0017
     * @tc.desc      displayId=0、动效缺省、窗口(1,2,3,4)格式化为固定六段文本
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testStartOptionsFormat0017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartOptionsFormat0017 begin');
      const options: StartOptions = { displayId: 0, windowLeft: 1, windowTop: 2, windowWidth: 3, windowHeight: 4 };
      const text: string = formatStartOptions(options);
      expect(text).assertEqual('displayId=0, withAnimation=undefined, left=1, top=2, width=3, height=4');
      expect(text.split(', ').length).assertEqual(6);
      expect(text.startsWith('displayId=0, withAnimation=undefined, ')).assertTrue();
      expect(text.endsWith('width=3, height=4')).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartOptionsFormat0017 end');
    })

    /**
     * @tc.number    SUB_ABILITY_FEATURE_OPTIONS_FORMAT_0018
     * @tc.name      testStartOptionsFormat0018
     * @tc.desc      displayId=0、动效缺省、窗口(0.5,1.25,99.9,100)格式化为固定六段文本
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testStartOptionsFormat0018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartOptionsFormat0018 begin');
      const options: StartOptions = { displayId: 0, windowLeft: 0.5, windowTop: 1.25, windowWidth: 99.9, windowHeight: 100 };
      const text: string = formatStartOptions(options);
      expect(text).assertEqual('displayId=0, withAnimation=undefined, left=0.5, top=1.25, width=99.9, height=100');
      expect(text.split(', ').length).assertEqual(6);
      expect(text.startsWith('displayId=0, withAnimation=undefined, ')).assertTrue();
      expect(text.endsWith('width=99.9, height=100')).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartOptionsFormat0018 end');
    })

    /**
     * @tc.number    SUB_ABILITY_FEATURE_OPTIONS_FORMAT_0019
     * @tc.name      testStartOptionsFormat0019
     * @tc.desc      displayId=1、动效true、窗口(50,100,300,400)格式化为固定六段文本
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testStartOptionsFormat0019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartOptionsFormat0019 begin');
      const options: StartOptions = { displayId: 1, withAnimation: true, windowLeft: 50, windowTop: 100, windowWidth: 300, windowHeight: 400 };
      const text: string = formatStartOptions(options);
      expect(text).assertEqual('displayId=1, withAnimation=true, left=50, top=100, width=300, height=400');
      expect(text.split(', ').length).assertEqual(6);
      expect(text.startsWith('displayId=1, withAnimation=true, ')).assertTrue();
      expect(text.endsWith('width=300, height=400')).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartOptionsFormat0019 end');
    })

    /**
     * @tc.number    SUB_ABILITY_FEATURE_OPTIONS_FORMAT_0020
     * @tc.name      testStartOptionsFormat0020
     * @tc.desc      displayId=1、动效true、窗口(0,0,0,0)格式化为固定六段文本
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testStartOptionsFormat0020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartOptionsFormat0020 begin');
      const options: StartOptions = { displayId: 1, withAnimation: true, windowLeft: 0, windowTop: 0, windowWidth: 0, windowHeight: 0 };
      const text: string = formatStartOptions(options);
      expect(text).assertEqual('displayId=1, withAnimation=true, left=0, top=0, width=0, height=0');
      expect(text.split(', ').length).assertEqual(6);
      expect(text.startsWith('displayId=1, withAnimation=true, ')).assertTrue();
      expect(text.endsWith('width=0, height=0')).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartOptionsFormat0020 end');
    })

    /**
     * @tc.number    SUB_ABILITY_FEATURE_OPTIONS_FORMAT_0021
     * @tc.name      testStartOptionsFormat0021
     * @tc.desc      displayId=1、动效true、窗口(-10,-20,1920,1080)格式化为固定六段文本
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testStartOptionsFormat0021', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartOptionsFormat0021 begin');
      const options: StartOptions = { displayId: 1, withAnimation: true, windowLeft: -10, windowTop: -20, windowWidth: 1920, windowHeight: 1080 };
      const text: string = formatStartOptions(options);
      expect(text).assertEqual('displayId=1, withAnimation=true, left=-10, top=-20, width=1920, height=1080');
      expect(text.split(', ').length).assertEqual(6);
      expect(text.startsWith('displayId=1, withAnimation=true, ')).assertTrue();
      expect(text.endsWith('width=1920, height=1080')).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartOptionsFormat0021 end');
    })

    /**
     * @tc.number    SUB_ABILITY_FEATURE_OPTIONS_FORMAT_0022
     * @tc.name      testStartOptionsFormat0022
     * @tc.desc      displayId=1、动效true、窗口(缺省,缺省,缺省,缺省)格式化为固定六段文本
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testStartOptionsFormat0022', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartOptionsFormat0022 begin');
      const options: StartOptions = { displayId: 1, withAnimation: true };
      const text: string = formatStartOptions(options);
      expect(text).assertEqual('displayId=1, withAnimation=true, left=undefined, top=undefined, width=undefined, height=undefined');
      expect(text.split(', ').length).assertEqual(6);
      expect(text.startsWith('displayId=1, withAnimation=true, ')).assertTrue();
      expect(text.endsWith('width=undefined, height=undefined')).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartOptionsFormat0022 end');
    })

    /**
     * @tc.number    SUB_ABILITY_FEATURE_OPTIONS_FORMAT_0023
     * @tc.name      testStartOptionsFormat0023
     * @tc.desc      displayId=1、动效true、窗口(1,2,3,4)格式化为固定六段文本
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testStartOptionsFormat0023', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartOptionsFormat0023 begin');
      const options: StartOptions = { displayId: 1, withAnimation: true, windowLeft: 1, windowTop: 2, windowWidth: 3, windowHeight: 4 };
      const text: string = formatStartOptions(options);
      expect(text).assertEqual('displayId=1, withAnimation=true, left=1, top=2, width=3, height=4');
      expect(text.split(', ').length).assertEqual(6);
      expect(text.startsWith('displayId=1, withAnimation=true, ')).assertTrue();
      expect(text.endsWith('width=3, height=4')).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartOptionsFormat0023 end');
    })

    /**
     * @tc.number    SUB_ABILITY_FEATURE_OPTIONS_FORMAT_0024
     * @tc.name      testStartOptionsFormat0024
     * @tc.desc      displayId=1、动效true、窗口(0.5,1.25,99.9,100)格式化为固定六段文本
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testStartOptionsFormat0024', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartOptionsFormat0024 begin');
      const options: StartOptions = { displayId: 1, withAnimation: true, windowLeft: 0.5, windowTop: 1.25, windowWidth: 99.9, windowHeight: 100 };
      const text: string = formatStartOptions(options);
      expect(text).assertEqual('displayId=1, withAnimation=true, left=0.5, top=1.25, width=99.9, height=100');
      expect(text.split(', ').length).assertEqual(6);
      expect(text.startsWith('displayId=1, withAnimation=true, ')).assertTrue();
      expect(text.endsWith('width=99.9, height=100')).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartOptionsFormat0024 end');
    })

    /**
     * @tc.number    SUB_ABILITY_FEATURE_OPTIONS_FORMAT_0025
     * @tc.name      testStartOptionsFormat0025
     * @tc.desc      displayId=1、动效false、窗口(50,100,300,400)格式化为固定六段文本
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testStartOptionsFormat0025', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartOptionsFormat0025 begin');
      const options: StartOptions = { displayId: 1, withAnimation: false, windowLeft: 50, windowTop: 100, windowWidth: 300, windowHeight: 400 };
      const text: string = formatStartOptions(options);
      expect(text).assertEqual('displayId=1, withAnimation=false, left=50, top=100, width=300, height=400');
      expect(text.split(', ').length).assertEqual(6);
      expect(text.startsWith('displayId=1, withAnimation=false, ')).assertTrue();
      expect(text.endsWith('width=300, height=400')).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartOptionsFormat0025 end');
    })

    /**
     * @tc.number    SUB_ABILITY_FEATURE_OPTIONS_FORMAT_0026
     * @tc.name      testStartOptionsFormat0026
     * @tc.desc      displayId=1、动效false、窗口(0,0,0,0)格式化为固定六段文本
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testStartOptionsFormat0026', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartOptionsFormat0026 begin');
      const options: StartOptions = { displayId: 1, withAnimation: false, windowLeft: 0, windowTop: 0, windowWidth: 0, windowHeight: 0 };
      const text: string = formatStartOptions(options);
      expect(text).assertEqual('displayId=1, withAnimation=false, left=0, top=0, width=0, height=0');
      expect(text.split(', ').length).assertEqual(6);
      expect(text.startsWith('displayId=1, withAnimation=false, ')).assertTrue();
      expect(text.endsWith('width=0, height=0')).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartOptionsFormat0026 end');
    })

    /**
     * @tc.number    SUB_ABILITY_FEATURE_OPTIONS_FORMAT_0027
     * @tc.name      testStartOptionsFormat0027
     * @tc.desc      displayId=1、动效false、窗口(-10,-20,1920,1080)格式化为固定六段文本
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testStartOptionsFormat0027', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartOptionsFormat0027 begin');
      const options: StartOptions = { displayId: 1, withAnimation: false, windowLeft: -10, windowTop: -20, windowWidth: 1920, windowHeight: 1080 };
      const text: string = formatStartOptions(options);
      expect(text).assertEqual('displayId=1, withAnimation=false, left=-10, top=-20, width=1920, height=1080');
      expect(text.split(', ').length).assertEqual(6);
      expect(text.startsWith('displayId=1, withAnimation=false, ')).assertTrue();
      expect(text.endsWith('width=1920, height=1080')).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartOptionsFormat0027 end');
    })

    /**
     * @tc.number    SUB_ABILITY_FEATURE_OPTIONS_FORMAT_0028
     * @tc.name      testStartOptionsFormat0028
     * @tc.desc      displayId=1、动效false、窗口(缺省,缺省,缺省,缺省)格式化为固定六段文本
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testStartOptionsFormat0028', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartOptionsFormat0028 begin');
      const options: StartOptions = { displayId: 1, withAnimation: false };
      const text: string = formatStartOptions(options);
      expect(text).assertEqual('displayId=1, withAnimation=false, left=undefined, top=undefined, width=undefined, height=undefined');
      expect(text.split(', ').length).assertEqual(6);
      expect(text.startsWith('displayId=1, withAnimation=false, ')).assertTrue();
      expect(text.endsWith('width=undefined, height=undefined')).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartOptionsFormat0028 end');
    })

    /**
     * @tc.number    SUB_ABILITY_FEATURE_OPTIONS_FORMAT_0029
     * @tc.name      testStartOptionsFormat0029
     * @tc.desc      displayId=1、动效false、窗口(1,2,3,4)格式化为固定六段文本
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testStartOptionsFormat0029', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartOptionsFormat0029 begin');
      const options: StartOptions = { displayId: 1, withAnimation: false, windowLeft: 1, windowTop: 2, windowWidth: 3, windowHeight: 4 };
      const text: string = formatStartOptions(options);
      expect(text).assertEqual('displayId=1, withAnimation=false, left=1, top=2, width=3, height=4');
      expect(text.split(', ').length).assertEqual(6);
      expect(text.startsWith('displayId=1, withAnimation=false, ')).assertTrue();
      expect(text.endsWith('width=3, height=4')).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartOptionsFormat0029 end');
    })

    /**
     * @tc.number    SUB_ABILITY_FEATURE_OPTIONS_FORMAT_0030
     * @tc.name      testStartOptionsFormat0030
     * @tc.desc      displayId=1、动效false、窗口(0.5,1.25,99.9,100)格式化为固定六段文本
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testStartOptionsFormat0030', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartOptionsFormat0030 begin');
      const options: StartOptions = { displayId: 1, withAnimation: false, windowLeft: 0.5, windowTop: 1.25, windowWidth: 99.9, windowHeight: 100 };
      const text: string = formatStartOptions(options);
      expect(text).assertEqual('displayId=1, withAnimation=false, left=0.5, top=1.25, width=99.9, height=100');
      expect(text.split(', ').length).assertEqual(6);
      expect(text.startsWith('displayId=1, withAnimation=false, ')).assertTrue();
      expect(text.endsWith('width=99.9, height=100')).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartOptionsFormat0030 end');
    })

    /**
     * @tc.number    SUB_ABILITY_FEATURE_OPTIONS_FORMAT_0031
     * @tc.name      testStartOptionsFormat0031
     * @tc.desc      displayId=1、动效缺省、窗口(50,100,300,400)格式化为固定六段文本
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testStartOptionsFormat0031', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartOptionsFormat0031 begin');
      const options: StartOptions = { displayId: 1, windowLeft: 50, windowTop: 100, windowWidth: 300, windowHeight: 400 };
      const text: string = formatStartOptions(options);
      expect(text).assertEqual('displayId=1, withAnimation=undefined, left=50, top=100, width=300, height=400');
      expect(text.split(', ').length).assertEqual(6);
      expect(text.startsWith('displayId=1, withAnimation=undefined, ')).assertTrue();
      expect(text.endsWith('width=300, height=400')).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartOptionsFormat0031 end');
    })

    /**
     * @tc.number    SUB_ABILITY_FEATURE_OPTIONS_FORMAT_0032
     * @tc.name      testStartOptionsFormat0032
     * @tc.desc      displayId=1、动效缺省、窗口(0,0,0,0)格式化为固定六段文本
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testStartOptionsFormat0032', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartOptionsFormat0032 begin');
      const options: StartOptions = { displayId: 1, windowLeft: 0, windowTop: 0, windowWidth: 0, windowHeight: 0 };
      const text: string = formatStartOptions(options);
      expect(text).assertEqual('displayId=1, withAnimation=undefined, left=0, top=0, width=0, height=0');
      expect(text.split(', ').length).assertEqual(6);
      expect(text.startsWith('displayId=1, withAnimation=undefined, ')).assertTrue();
      expect(text.endsWith('width=0, height=0')).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartOptionsFormat0032 end');
    })

    /**
     * @tc.number    SUB_ABILITY_FEATURE_OPTIONS_FORMAT_0033
     * @tc.name      testStartOptionsFormat0033
     * @tc.desc      displayId=1、动效缺省、窗口(-10,-20,1920,1080)格式化为固定六段文本
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testStartOptionsFormat0033', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartOptionsFormat0033 begin');
      const options: StartOptions = { displayId: 1, windowLeft: -10, windowTop: -20, windowWidth: 1920, windowHeight: 1080 };
      const text: string = formatStartOptions(options);
      expect(text).assertEqual('displayId=1, withAnimation=undefined, left=-10, top=-20, width=1920, height=1080');
      expect(text.split(', ').length).assertEqual(6);
      expect(text.startsWith('displayId=1, withAnimation=undefined, ')).assertTrue();
      expect(text.endsWith('width=1920, height=1080')).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartOptionsFormat0033 end');
    })

    /**
     * @tc.number    SUB_ABILITY_FEATURE_OPTIONS_FORMAT_0034
     * @tc.name      testStartOptionsFormat0034
     * @tc.desc      displayId=1、动效缺省、窗口(缺省,缺省,缺省,缺省)格式化为固定六段文本
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testStartOptionsFormat0034', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartOptionsFormat0034 begin');
      const options: StartOptions = { displayId: 1 };
      const text: string = formatStartOptions(options);
      expect(text).assertEqual('displayId=1, withAnimation=undefined, left=undefined, top=undefined, width=undefined, height=undefined');
      expect(text.split(', ').length).assertEqual(6);
      expect(text.startsWith('displayId=1, withAnimation=undefined, ')).assertTrue();
      expect(text.endsWith('width=undefined, height=undefined')).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartOptionsFormat0034 end');
    })

    /**
     * @tc.number    SUB_ABILITY_FEATURE_OPTIONS_FORMAT_0035
     * @tc.name      testStartOptionsFormat0035
     * @tc.desc      displayId=1、动效缺省、窗口(1,2,3,4)格式化为固定六段文本
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testStartOptionsFormat0035', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartOptionsFormat0035 begin');
      const options: StartOptions = { displayId: 1, windowLeft: 1, windowTop: 2, windowWidth: 3, windowHeight: 4 };
      const text: string = formatStartOptions(options);
      expect(text).assertEqual('displayId=1, withAnimation=undefined, left=1, top=2, width=3, height=4');
      expect(text.split(', ').length).assertEqual(6);
      expect(text.startsWith('displayId=1, withAnimation=undefined, ')).assertTrue();
      expect(text.endsWith('width=3, height=4')).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartOptionsFormat0035 end');
    })

    /**
     * @tc.number    SUB_ABILITY_FEATURE_OPTIONS_FORMAT_0036
     * @tc.name      testStartOptionsFormat0036
     * @tc.desc      displayId=1、动效缺省、窗口(0.5,1.25,99.9,100)格式化为固定六段文本
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testStartOptionsFormat0036', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartOptionsFormat0036 begin');
      const options: StartOptions = { displayId: 1, windowLeft: 0.5, windowTop: 1.25, windowWidth: 99.9, windowHeight: 100 };
      const text: string = formatStartOptions(options);
      expect(text).assertEqual('displayId=1, withAnimation=undefined, left=0.5, top=1.25, width=99.9, height=100');
      expect(text.split(', ').length).assertEqual(6);
      expect(text.startsWith('displayId=1, withAnimation=undefined, ')).assertTrue();
      expect(text.endsWith('width=99.9, height=100')).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartOptionsFormat0036 end');
    })

    /**
     * @tc.number    SUB_ABILITY_FEATURE_OPTIONS_FORMAT_0037
     * @tc.name      testStartOptionsFormat0037
     * @tc.desc      displayId=-1、动效true、窗口(50,100,300,400)格式化为固定六段文本
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testStartOptionsFormat0037', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartOptionsFormat0037 begin');
      const options: StartOptions = { displayId: -1, withAnimation: true, windowLeft: 50, windowTop: 100, windowWidth: 300, windowHeight: 400 };
      const text: string = formatStartOptions(options);
      expect(text).assertEqual('displayId=-1, withAnimation=true, left=50, top=100, width=300, height=400');
      expect(text.split(', ').length).assertEqual(6);
      expect(text.startsWith('displayId=-1, withAnimation=true, ')).assertTrue();
      expect(text.endsWith('width=300, height=400')).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartOptionsFormat0037 end');
    })

    /**
     * @tc.number    SUB_ABILITY_FEATURE_OPTIONS_FORMAT_0038
     * @tc.name      testStartOptionsFormat0038
     * @tc.desc      displayId=-1、动效true、窗口(0,0,0,0)格式化为固定六段文本
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testStartOptionsFormat0038', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartOptionsFormat0038 begin');
      const options: StartOptions = { displayId: -1, withAnimation: true, windowLeft: 0, windowTop: 0, windowWidth: 0, windowHeight: 0 };
      const text: string = formatStartOptions(options);
      expect(text).assertEqual('displayId=-1, withAnimation=true, left=0, top=0, width=0, height=0');
      expect(text.split(', ').length).assertEqual(6);
      expect(text.startsWith('displayId=-1, withAnimation=true, ')).assertTrue();
      expect(text.endsWith('width=0, height=0')).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartOptionsFormat0038 end');
    })

    /**
     * @tc.number    SUB_ABILITY_FEATURE_OPTIONS_FORMAT_0039
     * @tc.name      testStartOptionsFormat0039
     * @tc.desc      displayId=-1、动效true、窗口(-10,-20,1920,1080)格式化为固定六段文本
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testStartOptionsFormat0039', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartOptionsFormat0039 begin');
      const options: StartOptions = { displayId: -1, withAnimation: true, windowLeft: -10, windowTop: -20, windowWidth: 1920, windowHeight: 1080 };
      const text: string = formatStartOptions(options);
      expect(text).assertEqual('displayId=-1, withAnimation=true, left=-10, top=-20, width=1920, height=1080');
      expect(text.split(', ').length).assertEqual(6);
      expect(text.startsWith('displayId=-1, withAnimation=true, ')).assertTrue();
      expect(text.endsWith('width=1920, height=1080')).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartOptionsFormat0039 end');
    })

    /**
     * @tc.number    SUB_ABILITY_FEATURE_OPTIONS_FORMAT_0040
     * @tc.name      testStartOptionsFormat0040
     * @tc.desc      displayId=-1、动效true、窗口(缺省,缺省,缺省,缺省)格式化为固定六段文本
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testStartOptionsFormat0040', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartOptionsFormat0040 begin');
      const options: StartOptions = { displayId: -1, withAnimation: true };
      const text: string = formatStartOptions(options);
      expect(text).assertEqual('displayId=-1, withAnimation=true, left=undefined, top=undefined, width=undefined, height=undefined');
      expect(text.split(', ').length).assertEqual(6);
      expect(text.startsWith('displayId=-1, withAnimation=true, ')).assertTrue();
      expect(text.endsWith('width=undefined, height=undefined')).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartOptionsFormat0040 end');
    })

    /**
     * @tc.number    SUB_ABILITY_FEATURE_OPTIONS_FORMAT_0041
     * @tc.name      testStartOptionsFormat0041
     * @tc.desc      displayId=-1、动效true、窗口(1,2,3,4)格式化为固定六段文本
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testStartOptionsFormat0041', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartOptionsFormat0041 begin');
      const options: StartOptions = { displayId: -1, withAnimation: true, windowLeft: 1, windowTop: 2, windowWidth: 3, windowHeight: 4 };
      const text: string = formatStartOptions(options);
      expect(text).assertEqual('displayId=-1, withAnimation=true, left=1, top=2, width=3, height=4');
      expect(text.split(', ').length).assertEqual(6);
      expect(text.startsWith('displayId=-1, withAnimation=true, ')).assertTrue();
      expect(text.endsWith('width=3, height=4')).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartOptionsFormat0041 end');
    })

    /**
     * @tc.number    SUB_ABILITY_FEATURE_OPTIONS_FORMAT_0042
     * @tc.name      testStartOptionsFormat0042
     * @tc.desc      displayId=-1、动效true、窗口(0.5,1.25,99.9,100)格式化为固定六段文本
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testStartOptionsFormat0042', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartOptionsFormat0042 begin');
      const options: StartOptions = { displayId: -1, withAnimation: true, windowLeft: 0.5, windowTop: 1.25, windowWidth: 99.9, windowHeight: 100 };
      const text: string = formatStartOptions(options);
      expect(text).assertEqual('displayId=-1, withAnimation=true, left=0.5, top=1.25, width=99.9, height=100');
      expect(text.split(', ').length).assertEqual(6);
      expect(text.startsWith('displayId=-1, withAnimation=true, ')).assertTrue();
      expect(text.endsWith('width=99.9, height=100')).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartOptionsFormat0042 end');
    })

    /**
     * @tc.number    SUB_ABILITY_FEATURE_OPTIONS_FORMAT_0043
     * @tc.name      testStartOptionsFormat0043
     * @tc.desc      displayId=-1、动效false、窗口(50,100,300,400)格式化为固定六段文本
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testStartOptionsFormat0043', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartOptionsFormat0043 begin');
      const options: StartOptions = { displayId: -1, withAnimation: false, windowLeft: 50, windowTop: 100, windowWidth: 300, windowHeight: 400 };
      const text: string = formatStartOptions(options);
      expect(text).assertEqual('displayId=-1, withAnimation=false, left=50, top=100, width=300, height=400');
      expect(text.split(', ').length).assertEqual(6);
      expect(text.startsWith('displayId=-1, withAnimation=false, ')).assertTrue();
      expect(text.endsWith('width=300, height=400')).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartOptionsFormat0043 end');
    })

    /**
     * @tc.number    SUB_ABILITY_FEATURE_OPTIONS_FORMAT_0044
     * @tc.name      testStartOptionsFormat0044
     * @tc.desc      displayId=-1、动效false、窗口(0,0,0,0)格式化为固定六段文本
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testStartOptionsFormat0044', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartOptionsFormat0044 begin');
      const options: StartOptions = { displayId: -1, withAnimation: false, windowLeft: 0, windowTop: 0, windowWidth: 0, windowHeight: 0 };
      const text: string = formatStartOptions(options);
      expect(text).assertEqual('displayId=-1, withAnimation=false, left=0, top=0, width=0, height=0');
      expect(text.split(', ').length).assertEqual(6);
      expect(text.startsWith('displayId=-1, withAnimation=false, ')).assertTrue();
      expect(text.endsWith('width=0, height=0')).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartOptionsFormat0044 end');
    })

    /**
     * @tc.number    SUB_ABILITY_FEATURE_OPTIONS_FORMAT_0045
     * @tc.name      testStartOptionsFormat0045
     * @tc.desc      displayId=-1、动效false、窗口(-10,-20,1920,1080)格式化为固定六段文本
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testStartOptionsFormat0045', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartOptionsFormat0045 begin');
      const options: StartOptions = { displayId: -1, withAnimation: false, windowLeft: -10, windowTop: -20, windowWidth: 1920, windowHeight: 1080 };
      const text: string = formatStartOptions(options);
      expect(text).assertEqual('displayId=-1, withAnimation=false, left=-10, top=-20, width=1920, height=1080');
      expect(text.split(', ').length).assertEqual(6);
      expect(text.startsWith('displayId=-1, withAnimation=false, ')).assertTrue();
      expect(text.endsWith('width=1920, height=1080')).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartOptionsFormat0045 end');
    })

    /**
     * @tc.number    SUB_ABILITY_FEATURE_OPTIONS_FORMAT_0046
     * @tc.name      testStartOptionsFormat0046
     * @tc.desc      displayId=-1、动效false、窗口(缺省,缺省,缺省,缺省)格式化为固定六段文本
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testStartOptionsFormat0046', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartOptionsFormat0046 begin');
      const options: StartOptions = { displayId: -1, withAnimation: false };
      const text: string = formatStartOptions(options);
      expect(text).assertEqual('displayId=-1, withAnimation=false, left=undefined, top=undefined, width=undefined, height=undefined');
      expect(text.split(', ').length).assertEqual(6);
      expect(text.startsWith('displayId=-1, withAnimation=false, ')).assertTrue();
      expect(text.endsWith('width=undefined, height=undefined')).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartOptionsFormat0046 end');
    })

    /**
     * @tc.number    SUB_ABILITY_FEATURE_OPTIONS_FORMAT_0047
     * @tc.name      testStartOptionsFormat0047
     * @tc.desc      displayId=-1、动效false、窗口(1,2,3,4)格式化为固定六段文本
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testStartOptionsFormat0047', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartOptionsFormat0047 begin');
      const options: StartOptions = { displayId: -1, withAnimation: false, windowLeft: 1, windowTop: 2, windowWidth: 3, windowHeight: 4 };
      const text: string = formatStartOptions(options);
      expect(text).assertEqual('displayId=-1, withAnimation=false, left=1, top=2, width=3, height=4');
      expect(text.split(', ').length).assertEqual(6);
      expect(text.startsWith('displayId=-1, withAnimation=false, ')).assertTrue();
      expect(text.endsWith('width=3, height=4')).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartOptionsFormat0047 end');
    })

    /**
     * @tc.number    SUB_ABILITY_FEATURE_OPTIONS_FORMAT_0048
     * @tc.name      testStartOptionsFormat0048
     * @tc.desc      displayId=-1、动效false、窗口(0.5,1.25,99.9,100)格式化为固定六段文本
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testStartOptionsFormat0048', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartOptionsFormat0048 begin');
      const options: StartOptions = { displayId: -1, withAnimation: false, windowLeft: 0.5, windowTop: 1.25, windowWidth: 99.9, windowHeight: 100 };
      const text: string = formatStartOptions(options);
      expect(text).assertEqual('displayId=-1, withAnimation=false, left=0.5, top=1.25, width=99.9, height=100');
      expect(text.split(', ').length).assertEqual(6);
      expect(text.startsWith('displayId=-1, withAnimation=false, ')).assertTrue();
      expect(text.endsWith('width=99.9, height=100')).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartOptionsFormat0048 end');
    })

    /**
     * @tc.number    SUB_ABILITY_FEATURE_OPTIONS_FORMAT_0049
     * @tc.name      testStartOptionsFormat0049
     * @tc.desc      displayId=-1、动效缺省、窗口(50,100,300,400)格式化为固定六段文本
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testStartOptionsFormat0049', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartOptionsFormat0049 begin');
      const options: StartOptions = { displayId: -1, windowLeft: 50, windowTop: 100, windowWidth: 300, windowHeight: 400 };
      const text: string = formatStartOptions(options);
      expect(text).assertEqual('displayId=-1, withAnimation=undefined, left=50, top=100, width=300, height=400');
      expect(text.split(', ').length).assertEqual(6);
      expect(text.startsWith('displayId=-1, withAnimation=undefined, ')).assertTrue();
      expect(text.endsWith('width=300, height=400')).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartOptionsFormat0049 end');
    })

    /**
     * @tc.number    SUB_ABILITY_FEATURE_OPTIONS_FORMAT_0050
     * @tc.name      testStartOptionsFormat0050
     * @tc.desc      displayId=-1、动效缺省、窗口(0,0,0,0)格式化为固定六段文本
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testStartOptionsFormat0050', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartOptionsFormat0050 begin');
      const options: StartOptions = { displayId: -1, windowLeft: 0, windowTop: 0, windowWidth: 0, windowHeight: 0 };
      const text: string = formatStartOptions(options);
      expect(text).assertEqual('displayId=-1, withAnimation=undefined, left=0, top=0, width=0, height=0');
      expect(text.split(', ').length).assertEqual(6);
      expect(text.startsWith('displayId=-1, withAnimation=undefined, ')).assertTrue();
      expect(text.endsWith('width=0, height=0')).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartOptionsFormat0050 end');
    })

    /**
     * @tc.number    SUB_ABILITY_FEATURE_OPTIONS_FORMAT_0051
     * @tc.name      testStartOptionsFormat0051
     * @tc.desc      displayId=-1、动效缺省、窗口(-10,-20,1920,1080)格式化为固定六段文本
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testStartOptionsFormat0051', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartOptionsFormat0051 begin');
      const options: StartOptions = { displayId: -1, windowLeft: -10, windowTop: -20, windowWidth: 1920, windowHeight: 1080 };
      const text: string = formatStartOptions(options);
      expect(text).assertEqual('displayId=-1, withAnimation=undefined, left=-10, top=-20, width=1920, height=1080');
      expect(text.split(', ').length).assertEqual(6);
      expect(text.startsWith('displayId=-1, withAnimation=undefined, ')).assertTrue();
      expect(text.endsWith('width=1920, height=1080')).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartOptionsFormat0051 end');
    })

    /**
     * @tc.number    SUB_ABILITY_FEATURE_OPTIONS_FORMAT_0052
     * @tc.name      testStartOptionsFormat0052
     * @tc.desc      displayId=-1、动效缺省、窗口(缺省,缺省,缺省,缺省)格式化为固定六段文本
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testStartOptionsFormat0052', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartOptionsFormat0052 begin');
      const options: StartOptions = { displayId: -1 };
      const text: string = formatStartOptions(options);
      expect(text).assertEqual('displayId=-1, withAnimation=undefined, left=undefined, top=undefined, width=undefined, height=undefined');
      expect(text.split(', ').length).assertEqual(6);
      expect(text.startsWith('displayId=-1, withAnimation=undefined, ')).assertTrue();
      expect(text.endsWith('width=undefined, height=undefined')).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartOptionsFormat0052 end');
    })

    /**
     * @tc.number    SUB_ABILITY_FEATURE_OPTIONS_FORMAT_0053
     * @tc.name      testStartOptionsFormat0053
     * @tc.desc      displayId=-1、动效缺省、窗口(1,2,3,4)格式化为固定六段文本
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testStartOptionsFormat0053', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartOptionsFormat0053 begin');
      const options: StartOptions = { displayId: -1, windowLeft: 1, windowTop: 2, windowWidth: 3, windowHeight: 4 };
      const text: string = formatStartOptions(options);
      expect(text).assertEqual('displayId=-1, withAnimation=undefined, left=1, top=2, width=3, height=4');
      expect(text.split(', ').length).assertEqual(6);
      expect(text.startsWith('displayId=-1, withAnimation=undefined, ')).assertTrue();
      expect(text.endsWith('width=3, height=4')).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartOptionsFormat0053 end');
    })

    /**
     * @tc.number    SUB_ABILITY_FEATURE_OPTIONS_FORMAT_0054
     * @tc.name      testStartOptionsFormat0054
     * @tc.desc      displayId=-1、动效缺省、窗口(0.5,1.25,99.9,100)格式化为固定六段文本
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testStartOptionsFormat0054', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartOptionsFormat0054 begin');
      const options: StartOptions = { displayId: -1, windowLeft: 0.5, windowTop: 1.25, windowWidth: 99.9, windowHeight: 100 };
      const text: string = formatStartOptions(options);
      expect(text).assertEqual('displayId=-1, withAnimation=undefined, left=0.5, top=1.25, width=99.9, height=100');
      expect(text.split(', ').length).assertEqual(6);
      expect(text.startsWith('displayId=-1, withAnimation=undefined, ')).assertTrue();
      expect(text.endsWith('width=99.9, height=100')).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartOptionsFormat0054 end');
    })

    /**
     * @tc.number    SUB_ABILITY_FEATURE_OPTIONS_FORMAT_0055
     * @tc.name      testStartOptionsFormat0055
     * @tc.desc      displayId=2147483647、动效true、窗口(50,100,300,400)格式化为固定六段文本
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testStartOptionsFormat0055', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartOptionsFormat0055 begin');
      const options: StartOptions = { displayId: 2147483647, withAnimation: true, windowLeft: 50, windowTop: 100, windowWidth: 300, windowHeight: 400 };
      const text: string = formatStartOptions(options);
      expect(text).assertEqual('displayId=2147483647, withAnimation=true, left=50, top=100, width=300, height=400');
      expect(text.split(', ').length).assertEqual(6);
      expect(text.startsWith('displayId=2147483647, withAnimation=true, ')).assertTrue();
      expect(text.endsWith('width=300, height=400')).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartOptionsFormat0055 end');
    })

    /**
     * @tc.number    SUB_ABILITY_FEATURE_OPTIONS_FORMAT_0056
     * @tc.name      testStartOptionsFormat0056
     * @tc.desc      displayId=2147483647、动效true、窗口(0,0,0,0)格式化为固定六段文本
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testStartOptionsFormat0056', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartOptionsFormat0056 begin');
      const options: StartOptions = { displayId: 2147483647, withAnimation: true, windowLeft: 0, windowTop: 0, windowWidth: 0, windowHeight: 0 };
      const text: string = formatStartOptions(options);
      expect(text).assertEqual('displayId=2147483647, withAnimation=true, left=0, top=0, width=0, height=0');
      expect(text.split(', ').length).assertEqual(6);
      expect(text.startsWith('displayId=2147483647, withAnimation=true, ')).assertTrue();
      expect(text.endsWith('width=0, height=0')).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartOptionsFormat0056 end');
    })

    /**
     * @tc.number    SUB_ABILITY_FEATURE_OPTIONS_FORMAT_0057
     * @tc.name      testStartOptionsFormat0057
     * @tc.desc      displayId=2147483647、动效true、窗口(-10,-20,1920,1080)格式化为固定六段文本
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testStartOptionsFormat0057', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartOptionsFormat0057 begin');
      const options: StartOptions = { displayId: 2147483647, withAnimation: true, windowLeft: -10, windowTop: -20, windowWidth: 1920, windowHeight: 1080 };
      const text: string = formatStartOptions(options);
      expect(text).assertEqual('displayId=2147483647, withAnimation=true, left=-10, top=-20, width=1920, height=1080');
      expect(text.split(', ').length).assertEqual(6);
      expect(text.startsWith('displayId=2147483647, withAnimation=true, ')).assertTrue();
      expect(text.endsWith('width=1920, height=1080')).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartOptionsFormat0057 end');
    })

    /**
     * @tc.number    SUB_ABILITY_FEATURE_OPTIONS_FORMAT_0058
     * @tc.name      testStartOptionsFormat0058
     * @tc.desc      displayId=2147483647、动效true、窗口(缺省,缺省,缺省,缺省)格式化为固定六段文本
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testStartOptionsFormat0058', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartOptionsFormat0058 begin');
      const options: StartOptions = { displayId: 2147483647, withAnimation: true };
      const text: string = formatStartOptions(options);
      expect(text).assertEqual('displayId=2147483647, withAnimation=true, left=undefined, top=undefined, width=undefined, height=undefined');
      expect(text.split(', ').length).assertEqual(6);
      expect(text.startsWith('displayId=2147483647, withAnimation=true, ')).assertTrue();
      expect(text.endsWith('width=undefined, height=undefined')).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartOptionsFormat0058 end');
    })

    /**
     * @tc.number    SUB_ABILITY_FEATURE_OPTIONS_FORMAT_0059
     * @tc.name      testStartOptionsFormat0059
     * @tc.desc      displayId=2147483647、动效true、窗口(1,2,3,4)格式化为固定六段文本
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testStartOptionsFormat0059', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartOptionsFormat0059 begin');
      const options: StartOptions = { displayId: 2147483647, withAnimation: true, windowLeft: 1, windowTop: 2, windowWidth: 3, windowHeight: 4 };
      const text: string = formatStartOptions(options);
      expect(text).assertEqual('displayId=2147483647, withAnimation=true, left=1, top=2, width=3, height=4');
      expect(text.split(', ').length).assertEqual(6);
      expect(text.startsWith('displayId=2147483647, withAnimation=true, ')).assertTrue();
      expect(text.endsWith('width=3, height=4')).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartOptionsFormat0059 end');
    })

    /**
     * @tc.number    SUB_ABILITY_FEATURE_OPTIONS_FORMAT_0060
     * @tc.name      testStartOptionsFormat0060
     * @tc.desc      displayId=2147483647、动效true、窗口(0.5,1.25,99.9,100)格式化为固定六段文本
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testStartOptionsFormat0060', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartOptionsFormat0060 begin');
      const options: StartOptions = { displayId: 2147483647, withAnimation: true, windowLeft: 0.5, windowTop: 1.25, windowWidth: 99.9, windowHeight: 100 };
      const text: string = formatStartOptions(options);
      expect(text).assertEqual('displayId=2147483647, withAnimation=true, left=0.5, top=1.25, width=99.9, height=100');
      expect(text.split(', ').length).assertEqual(6);
      expect(text.startsWith('displayId=2147483647, withAnimation=true, ')).assertTrue();
      expect(text.endsWith('width=99.9, height=100')).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartOptionsFormat0060 end');
    })

    /**
     * @tc.number    SUB_ABILITY_FEATURE_OPTIONS_FORMAT_0061
     * @tc.name      testStartOptionsFormat0061
     * @tc.desc      displayId=2147483647、动效false、窗口(50,100,300,400)格式化为固定六段文本
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testStartOptionsFormat0061', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartOptionsFormat0061 begin');
      const options: StartOptions = { displayId: 2147483647, withAnimation: false, windowLeft: 50, windowTop: 100, windowWidth: 300, windowHeight: 400 };
      const text: string = formatStartOptions(options);
      expect(text).assertEqual('displayId=2147483647, withAnimation=false, left=50, top=100, width=300, height=400');
      expect(text.split(', ').length).assertEqual(6);
      expect(text.startsWith('displayId=2147483647, withAnimation=false, ')).assertTrue();
      expect(text.endsWith('width=300, height=400')).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartOptionsFormat0061 end');
    })

    /**
     * @tc.number    SUB_ABILITY_FEATURE_OPTIONS_FORMAT_0062
     * @tc.name      testStartOptionsFormat0062
     * @tc.desc      displayId=2147483647、动效false、窗口(0,0,0,0)格式化为固定六段文本
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testStartOptionsFormat0062', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartOptionsFormat0062 begin');
      const options: StartOptions = { displayId: 2147483647, withAnimation: false, windowLeft: 0, windowTop: 0, windowWidth: 0, windowHeight: 0 };
      const text: string = formatStartOptions(options);
      expect(text).assertEqual('displayId=2147483647, withAnimation=false, left=0, top=0, width=0, height=0');
      expect(text.split(', ').length).assertEqual(6);
      expect(text.startsWith('displayId=2147483647, withAnimation=false, ')).assertTrue();
      expect(text.endsWith('width=0, height=0')).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartOptionsFormat0062 end');
    })

    /**
     * @tc.number    SUB_ABILITY_FEATURE_OPTIONS_FORMAT_0063
     * @tc.name      testStartOptionsFormat0063
     * @tc.desc      displayId=2147483647、动效false、窗口(-10,-20,1920,1080)格式化为固定六段文本
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testStartOptionsFormat0063', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartOptionsFormat0063 begin');
      const options: StartOptions = { displayId: 2147483647, withAnimation: false, windowLeft: -10, windowTop: -20, windowWidth: 1920, windowHeight: 1080 };
      const text: string = formatStartOptions(options);
      expect(text).assertEqual('displayId=2147483647, withAnimation=false, left=-10, top=-20, width=1920, height=1080');
      expect(text.split(', ').length).assertEqual(6);
      expect(text.startsWith('displayId=2147483647, withAnimation=false, ')).assertTrue();
      expect(text.endsWith('width=1920, height=1080')).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartOptionsFormat0063 end');
    })

    /**
     * @tc.number    SUB_ABILITY_FEATURE_OPTIONS_FORMAT_0064
     * @tc.name      testStartOptionsFormat0064
     * @tc.desc      displayId=2147483647、动效false、窗口(缺省,缺省,缺省,缺省)格式化为固定六段文本
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testStartOptionsFormat0064', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartOptionsFormat0064 begin');
      const options: StartOptions = { displayId: 2147483647, withAnimation: false };
      const text: string = formatStartOptions(options);
      expect(text).assertEqual('displayId=2147483647, withAnimation=false, left=undefined, top=undefined, width=undefined, height=undefined');
      expect(text.split(', ').length).assertEqual(6);
      expect(text.startsWith('displayId=2147483647, withAnimation=false, ')).assertTrue();
      expect(text.endsWith('width=undefined, height=undefined')).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartOptionsFormat0064 end');
    })

    /**
     * @tc.number    SUB_ABILITY_FEATURE_OPTIONS_FORMAT_0065
     * @tc.name      testStartOptionsFormat0065
     * @tc.desc      displayId=2147483647、动效false、窗口(1,2,3,4)格式化为固定六段文本
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testStartOptionsFormat0065', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartOptionsFormat0065 begin');
      const options: StartOptions = { displayId: 2147483647, withAnimation: false, windowLeft: 1, windowTop: 2, windowWidth: 3, windowHeight: 4 };
      const text: string = formatStartOptions(options);
      expect(text).assertEqual('displayId=2147483647, withAnimation=false, left=1, top=2, width=3, height=4');
      expect(text.split(', ').length).assertEqual(6);
      expect(text.startsWith('displayId=2147483647, withAnimation=false, ')).assertTrue();
      expect(text.endsWith('width=3, height=4')).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartOptionsFormat0065 end');
    })

    /**
     * @tc.number    SUB_ABILITY_FEATURE_OPTIONS_FORMAT_0066
     * @tc.name      testStartOptionsFormat0066
     * @tc.desc      displayId=2147483647、动效false、窗口(0.5,1.25,99.9,100)格式化为固定六段文本
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testStartOptionsFormat0066', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartOptionsFormat0066 begin');
      const options: StartOptions = { displayId: 2147483647, withAnimation: false, windowLeft: 0.5, windowTop: 1.25, windowWidth: 99.9, windowHeight: 100 };
      const text: string = formatStartOptions(options);
      expect(text).assertEqual('displayId=2147483647, withAnimation=false, left=0.5, top=1.25, width=99.9, height=100');
      expect(text.split(', ').length).assertEqual(6);
      expect(text.startsWith('displayId=2147483647, withAnimation=false, ')).assertTrue();
      expect(text.endsWith('width=99.9, height=100')).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartOptionsFormat0066 end');
    })

    /**
     * @tc.number    SUB_ABILITY_FEATURE_OPTIONS_FORMAT_0067
     * @tc.name      testStartOptionsFormat0067
     * @tc.desc      displayId=2147483647、动效缺省、窗口(50,100,300,400)格式化为固定六段文本
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testStartOptionsFormat0067', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartOptionsFormat0067 begin');
      const options: StartOptions = { displayId: 2147483647, windowLeft: 50, windowTop: 100, windowWidth: 300, windowHeight: 400 };
      const text: string = formatStartOptions(options);
      expect(text).assertEqual('displayId=2147483647, withAnimation=undefined, left=50, top=100, width=300, height=400');
      expect(text.split(', ').length).assertEqual(6);
      expect(text.startsWith('displayId=2147483647, withAnimation=undefined, ')).assertTrue();
      expect(text.endsWith('width=300, height=400')).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartOptionsFormat0067 end');
    })

    /**
     * @tc.number    SUB_ABILITY_FEATURE_OPTIONS_FORMAT_0068
     * @tc.name      testStartOptionsFormat0068
     * @tc.desc      displayId=2147483647、动效缺省、窗口(0,0,0,0)格式化为固定六段文本
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testStartOptionsFormat0068', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartOptionsFormat0068 begin');
      const options: StartOptions = { displayId: 2147483647, windowLeft: 0, windowTop: 0, windowWidth: 0, windowHeight: 0 };
      const text: string = formatStartOptions(options);
      expect(text).assertEqual('displayId=2147483647, withAnimation=undefined, left=0, top=0, width=0, height=0');
      expect(text.split(', ').length).assertEqual(6);
      expect(text.startsWith('displayId=2147483647, withAnimation=undefined, ')).assertTrue();
      expect(text.endsWith('width=0, height=0')).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartOptionsFormat0068 end');
    })

    /**
     * @tc.number    SUB_ABILITY_FEATURE_OPTIONS_FORMAT_0069
     * @tc.name      testStartOptionsFormat0069
     * @tc.desc      displayId=2147483647、动效缺省、窗口(-10,-20,1920,1080)格式化为固定六段文本
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testStartOptionsFormat0069', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartOptionsFormat0069 begin');
      const options: StartOptions = { displayId: 2147483647, windowLeft: -10, windowTop: -20, windowWidth: 1920, windowHeight: 1080 };
      const text: string = formatStartOptions(options);
      expect(text).assertEqual('displayId=2147483647, withAnimation=undefined, left=-10, top=-20, width=1920, height=1080');
      expect(text.split(', ').length).assertEqual(6);
      expect(text.startsWith('displayId=2147483647, withAnimation=undefined, ')).assertTrue();
      expect(text.endsWith('width=1920, height=1080')).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartOptionsFormat0069 end');
    })

    /**
     * @tc.number    SUB_ABILITY_FEATURE_OPTIONS_FORMAT_0070
     * @tc.name      testStartOptionsFormat0070
     * @tc.desc      displayId=2147483647、动效缺省、窗口(缺省,缺省,缺省,缺省)格式化为固定六段文本
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testStartOptionsFormat0070', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartOptionsFormat0070 begin');
      const options: StartOptions = { displayId: 2147483647 };
      const text: string = formatStartOptions(options);
      expect(text).assertEqual('displayId=2147483647, withAnimation=undefined, left=undefined, top=undefined, width=undefined, height=undefined');
      expect(text.split(', ').length).assertEqual(6);
      expect(text.startsWith('displayId=2147483647, withAnimation=undefined, ')).assertTrue();
      expect(text.endsWith('width=undefined, height=undefined')).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartOptionsFormat0070 end');
    })

    /**
     * @tc.number    SUB_ABILITY_FEATURE_OPTIONS_FORMAT_0071
     * @tc.name      testStartOptionsFormat0071
     * @tc.desc      displayId=2147483647、动效缺省、窗口(1,2,3,4)格式化为固定六段文本
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testStartOptionsFormat0071', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartOptionsFormat0071 begin');
      const options: StartOptions = { displayId: 2147483647, windowLeft: 1, windowTop: 2, windowWidth: 3, windowHeight: 4 };
      const text: string = formatStartOptions(options);
      expect(text).assertEqual('displayId=2147483647, withAnimation=undefined, left=1, top=2, width=3, height=4');
      expect(text.split(', ').length).assertEqual(6);
      expect(text.startsWith('displayId=2147483647, withAnimation=undefined, ')).assertTrue();
      expect(text.endsWith('width=3, height=4')).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartOptionsFormat0071 end');
    })

    /**
     * @tc.number    SUB_ABILITY_FEATURE_OPTIONS_FORMAT_0072
     * @tc.name      testStartOptionsFormat0072
     * @tc.desc      displayId=2147483647、动效缺省、窗口(0.5,1.25,99.9,100)格式化为固定六段文本
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testStartOptionsFormat0072', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartOptionsFormat0072 begin');
      const options: StartOptions = { displayId: 2147483647, windowLeft: 0.5, windowTop: 1.25, windowWidth: 99.9, windowHeight: 100 };
      const text: string = formatStartOptions(options);
      expect(text).assertEqual('displayId=2147483647, withAnimation=undefined, left=0.5, top=1.25, width=99.9, height=100');
      expect(text.split(', ').length).assertEqual(6);
      expect(text.startsWith('displayId=2147483647, withAnimation=undefined, ')).assertTrue();
      expect(text.endsWith('width=99.9, height=100')).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartOptionsFormat0072 end');
    })

    /**
     * @tc.number    SUB_ABILITY_FEATURE_OPTIONS_FORMAT_0073
     * @tc.name      testStartOptionsFormat0073
     * @tc.desc      空 StartOptions 的六个字段全部格式化为 undefined
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testStartOptionsFormat0073', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartOptionsFormat0073 begin');
      const options: StartOptions = {};
      const text: string = formatStartOptions(options);
      expect(text).assertEqual('displayId=undefined, withAnimation=undefined, left=undefined, top=undefined, width=undefined, height=undefined');
      expect(text.split('undefined').length).assertEqual(7);
      expect(text.includes('=0')).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartOptionsFormat0073 end');
    })

    /**
     * @tc.number    SUB_ABILITY_FEATURE_OPTIONS_FORMAT_0074
     * @tc.name      testStartOptionsFormat0074
     * @tc.desc      buildStartOptions(true) 的格式化结果与示例写死的窗口参数一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testStartOptionsFormat0074', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartOptionsFormat0074 begin');
      const text: string = formatStartOptions(buildStartOptions(true));
      expect(text).assertEqual('displayId=0, withAnimation=true, left=50, top=100, width=300, height=400');
      expect(text.includes('withAnimation=true')).assertTrue();
      expect(text.includes('withAnimation=false')).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartOptionsFormat0074 end');
    })

    /**
     * @tc.number    SUB_ABILITY_FEATURE_OPTIONS_FORMAT_0075
     * @tc.name      testStartOptionsFormat0075
     * @tc.desc      buildStartOptions(false) 的格式化结果与示例写死的窗口参数一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testStartOptionsFormat0075', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartOptionsFormat0075 begin');
      const text: string = formatStartOptions(buildStartOptions(false));
      expect(text).assertEqual('displayId=0, withAnimation=false, left=50, top=100, width=300, height=400');
      expect(text.includes('withAnimation=false')).assertTrue();
      expect(text.includes('withAnimation=true')).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartOptionsFormat0075 end');
    })
  })
}
