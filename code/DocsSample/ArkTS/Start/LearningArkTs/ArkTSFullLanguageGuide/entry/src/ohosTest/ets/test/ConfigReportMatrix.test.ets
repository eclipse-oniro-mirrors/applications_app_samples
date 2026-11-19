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
import { describe, beforeEach, expect, it, Level, Size, TestType } from '@ohos/hypium';
import { hilog } from '@kit.PerformanceAnalysisKit';
import { APP_NAME, APP_LABEL, version } from '../../../main/ets/common/Config';
import { getFeatureLabel } from '../../../main/ets/common/Feature';
import { getProfileLabel } from '../../../main/ets/common/ProfileFeature';
import { getSettingsLabel } from '../../../main/ets/common/SettingsFeature';
import ReportBuilder, { ReportOptions } from '../../../main/ets/common/Report';

const DOMAIN: number = 0xF815;
const TAG: string = '[Sample_ARKTS_GUIDE_CONFIG]';

export default function ConfigReportMatrixTest(): void {
  describe('ConfigReportMatrixTest', () => {
    beforeEach(async () => {
      await new Promise<void>((resolve) => {
        setTimeout(() => resolve(), 20);
      });
    })

    /**
     * @tc.number    SUB_ARKTS_GUIDE_CONFIG_testConfigReportMatrix0001
     * @tc.name      testConfigReportMatrix0001
     * @tc.desc      Config constants and label functions stay stable, report title #1.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testConfigReportMatrix0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConfigReportMatrix0001 begin');
      expect(APP_NAME).assertEqual('DemoApp');
      expect(APP_LABEL).assertEqual('DemoApp');
      expect(version).assertEqual('1.0');
      expect(getFeatureLabel()).assertEqual('feature');
      expect(getProfileLabel()).assertEqual('profile');
      expect(getSettingsLabel()).assertEqual('settings');
      const options: ReportOptions = { title: "" };
      const built: string = new ReportBuilder().build(options);
      expect(built).assertEqual("");
      expect(built.length).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConfigReportMatrix0001 end');
    })

    /**
     * @tc.number    SUB_ARKTS_GUIDE_CONFIG_testConfigReportMatrix0002
     * @tc.name      testConfigReportMatrix0002
     * @tc.desc      Config constants and label functions stay stable, report title #2.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testConfigReportMatrix0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConfigReportMatrix0002 begin');
      expect(APP_NAME).assertEqual('DemoApp');
      expect(APP_LABEL).assertEqual('DemoApp');
      expect(version).assertEqual('1.0');
      expect(getFeatureLabel()).assertEqual('feature');
      expect(getProfileLabel()).assertEqual('profile');
      expect(getSettingsLabel()).assertEqual('settings');
      const options: ReportOptions = { title: "R" };
      const built: string = new ReportBuilder().build(options);
      expect(built).assertEqual("R");
      expect(built.length).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConfigReportMatrix0002 end');
    })

    /**
     * @tc.number    SUB_ARKTS_GUIDE_CONFIG_testConfigReportMatrix0003
     * @tc.name      testConfigReportMatrix0003
     * @tc.desc      Config constants and label functions stay stable, report title #3.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testConfigReportMatrix0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConfigReportMatrix0003 begin');
      expect(APP_NAME).assertEqual('DemoApp');
      expect(APP_LABEL).assertEqual('DemoApp');
      expect(version).assertEqual('1.0');
      expect(getFeatureLabel()).assertEqual('feature');
      expect(getProfileLabel()).assertEqual('profile');
      expect(getSettingsLabel()).assertEqual('settings');
      const options: ReportOptions = { title: "Report" };
      const built: string = new ReportBuilder().build(options);
      expect(built).assertEqual("Report");
      expect(built.length).assertEqual(6);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConfigReportMatrix0003 end');
    })

    /**
     * @tc.number    SUB_ARKTS_GUIDE_CONFIG_testConfigReportMatrix0004
     * @tc.name      testConfigReportMatrix0004
     * @tc.desc      Config constants and label functions stay stable, report title #4.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testConfigReportMatrix0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConfigReportMatrix0004 begin');
      expect(APP_NAME).assertEqual('DemoApp');
      expect(APP_LABEL).assertEqual('DemoApp');
      expect(version).assertEqual('1.0');
      expect(getFeatureLabel()).assertEqual('feature');
      expect(getProfileLabel()).assertEqual('profile');
      expect(getSettingsLabel()).assertEqual('settings');
      const options: ReportOptions = { title: "中文报表" };
      const built: string = new ReportBuilder().build(options);
      expect(built).assertEqual("中文报表");
      expect(built.length).assertEqual(4);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConfigReportMatrix0004 end');
    })

    /**
     * @tc.number    SUB_ARKTS_GUIDE_CONFIG_testConfigReportMatrix0005
     * @tc.name      testConfigReportMatrix0005
     * @tc.desc      Config constants and label functions stay stable, report title #5.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testConfigReportMatrix0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConfigReportMatrix0005 begin');
      expect(APP_NAME).assertEqual('DemoApp');
      expect(APP_LABEL).assertEqual('DemoApp');
      expect(version).assertEqual('1.0');
      expect(getFeatureLabel()).assertEqual('feature');
      expect(getProfileLabel()).assertEqual('profile');
      expect(getSettingsLabel()).assertEqual('settings');
      const options: ReportOptions = { title: "a b" };
      const built: string = new ReportBuilder().build(options);
      expect(built).assertEqual("a b");
      expect(built.length).assertEqual(3);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConfigReportMatrix0005 end');
    })

    /**
     * @tc.number    SUB_ARKTS_GUIDE_CONFIG_testConfigReportMatrix0006
     * @tc.name      testConfigReportMatrix0006
     * @tc.desc      Config constants and label functions stay stable, report title #6.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testConfigReportMatrix0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConfigReportMatrix0006 begin');
      expect(APP_NAME).assertEqual('DemoApp');
      expect(APP_LABEL).assertEqual('DemoApp');
      expect(version).assertEqual('1.0');
      expect(getFeatureLabel()).assertEqual('feature');
      expect(getProfileLabel()).assertEqual('profile');
      expect(getSettingsLabel()).assertEqual('settings');
      const options: ReportOptions = { title: "xxxxxxxxxxxxxxxxxxxx" };
      const built: string = new ReportBuilder().build(options);
      expect(built).assertEqual("xxxxxxxxxxxxxxxxxxxx");
      expect(built.length).assertEqual(20);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConfigReportMatrix0006 end');
    })

    /**
     * @tc.number    SUB_ARKTS_GUIDE_CONFIG_testConfigReportMatrix0007
     * @tc.name      testConfigReportMatrix0007
     * @tc.desc      Config constants and label functions stay stable, report title #7.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testConfigReportMatrix0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConfigReportMatrix0007 begin');
      expect(APP_NAME).assertEqual('DemoApp');
      expect(APP_LABEL).assertEqual('DemoApp');
      expect(version).assertEqual('1.0');
      expect(getFeatureLabel()).assertEqual('feature');
      expect(getProfileLabel()).assertEqual('profile');
      expect(getSettingsLabel()).assertEqual('settings');
      const options: ReportOptions = { title: "line\n" };
      const built: string = new ReportBuilder().build(options);
      expect(built).assertEqual("line\n");
      expect(built.length).assertEqual(5);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConfigReportMatrix0007 end');
    })

    /**
     * @tc.number    SUB_ARKTS_GUIDE_CONFIG_testConfigReportMatrix0008
     * @tc.name      testConfigReportMatrix0008
     * @tc.desc      Config constants and label functions stay stable, report title #8.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testConfigReportMatrix0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConfigReportMatrix0008 begin');
      expect(APP_NAME).assertEqual('DemoApp');
      expect(APP_LABEL).assertEqual('DemoApp');
      expect(version).assertEqual('1.0');
      expect(getFeatureLabel()).assertEqual('feature');
      expect(getProfileLabel()).assertEqual('profile');
      expect(getSettingsLabel()).assertEqual('settings');
      const options: ReportOptions = { title: "tab\t" };
      const built: string = new ReportBuilder().build(options);
      expect(built).assertEqual("tab\t");
      expect(built.length).assertEqual(4);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConfigReportMatrix0008 end');
    })

    /**
     * @tc.number    SUB_ARKTS_GUIDE_CONFIG_testConfigReportMatrix0009
     * @tc.name      testConfigReportMatrix0009
     * @tc.desc      Config constants and label functions stay stable, report title #9.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testConfigReportMatrix0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConfigReportMatrix0009 begin');
      expect(APP_NAME).assertEqual('DemoApp');
      expect(APP_LABEL).assertEqual('DemoApp');
      expect(version).assertEqual('1.0');
      expect(getFeatureLabel()).assertEqual('feature');
      expect(getProfileLabel()).assertEqual('profile');
      expect(getSettingsLabel()).assertEqual('settings');
      const options: ReportOptions = { title: "2026-11-11" };
      const built: string = new ReportBuilder().build(options);
      expect(built).assertEqual("2026-11-11");
      expect(built.length).assertEqual(10);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConfigReportMatrix0009 end');
    })

    /**
     * @tc.number    SUB_ARKTS_GUIDE_CONFIG_testConfigReportMatrix0010
     * @tc.name      testConfigReportMatrix0010
     * @tc.desc      Config constants and label functions stay stable, report title #10.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testConfigReportMatrix0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConfigReportMatrix0010 begin');
      expect(APP_NAME).assertEqual('DemoApp');
      expect(APP_LABEL).assertEqual('DemoApp');
      expect(version).assertEqual('1.0');
      expect(getFeatureLabel()).assertEqual('feature');
      expect(getProfileLabel()).assertEqual('profile');
      expect(getSettingsLabel()).assertEqual('settings');
      const options: ReportOptions = { title: "Title: 1" };
      const built: string = new ReportBuilder().build(options);
      expect(built).assertEqual("Title: 1");
      expect(built.length).assertEqual(8);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConfigReportMatrix0010 end');
    })

  });
}
