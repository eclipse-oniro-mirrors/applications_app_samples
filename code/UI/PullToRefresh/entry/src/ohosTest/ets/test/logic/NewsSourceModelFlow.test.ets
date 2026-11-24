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
import { hilog } from '@kit.PerformanceAnalysisKit';
import { NewsItem, NewsSourceModel } from '../model/PullRefreshLogic';

const DOMAIN: number = 0xF811;
const TAG: string = '[Sample_PullToRefresh]';
const BUNDLE: string = 'PullToRefresh_';

function logInfo(message: string): void {
  hilog.info(DOMAIN, TAG, '%{public}s', message);
}

/** Logic checks for NewsSourceModel flow (59 cases). */
export default function newsSourceModelFlowTest(): void {
  describe('NewsSourceModelFlowTest', (): void => {
    /**
     * @tc.number    SUB_PULLTOREFRESH_NEWS_SOURCE_MODEL_FLOW_0001
     * @tc.name      PullToRefresh_NewsSourceModelFlow_0001
     * @tc.desc      NewsSourceModel call flow totalCount > getData keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('PullToRefresh_NewsSourceModelFlow_0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}NewsSourceModelFlow_0001 begin`);
      const subject: NewsSourceModel = new NewsSourceModel();
      const step1: number = subject.totalCount();
      logInfo(`step1 totalCount(): step1=${step1}`);
      expect(step1).assertEqual(0);
      const step2: NewsItem | undefined = subject.getData(125);
      logInfo(`step2 getData(125): step2=${step2}`);
      expect(step2).assertUndefined();
      logInfo(`${BUNDLE}NewsSourceModelFlow_0001 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_NEWS_SOURCE_MODEL_FLOW_0002
     * @tc.name      PullToRefresh_NewsSourceModelFlow_0002
     * @tc.desc      NewsSourceModel call flow ids > addNotifications > addNotifications keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('PullToRefresh_NewsSourceModelFlow_0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}NewsSourceModelFlow_0002 begin`);
      const subject: NewsSourceModel = new NewsSourceModel();
      const step1: string[] = subject.ids();
      logInfo(`step1 ids(): step1.length=${step1.length}`);
      expect(step1.length).assertEqual(0);
      const step2: number[] = subject.addNotifications();
      logInfo(`step2 addNotifications(): step2.length=${step2.length}`);
      expect(step2.length).assertEqual(0);
      const step3: number[] = subject.addNotifications();
      logInfo(`step3 addNotifications(): step3.length=${step3.length}`);
      expect(step3.length).assertEqual(0);
      logInfo(`${BUNDLE}NewsSourceModelFlow_0002 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_NEWS_SOURCE_MODEL_FLOW_0003
     * @tc.name      PullToRefresh_NewsSourceModelFlow_0003
     * @tc.desc      NewsSourceModel call flow getData > pushData > addNotifications keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_NewsSourceModelFlow_0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}NewsSourceModelFlow_0003 begin`);
      const subject: NewsSourceModel = new NewsSourceModel();
      const step1: NewsItem | undefined = subject.getData(42.76);
      logInfo(`step1 getData(42.76): step1=${step1}`);
      expect(step1).assertUndefined();
      subject.pushData(new NewsItem('a', 'Hello', 'Hello', ''));
      const step3: number[] = subject.addNotifications();
      logInfo(`step3 addNotifications(): step3.length=${step3.length}`);
      expect(step3.length).assertEqual(1);
      logInfo(`step3 addNotifications(): JSON.stringify(step3)=${JSON.stringify(step3)}`);
      expect(JSON.stringify(step3)).assertEqual('[0]');
      logInfo(`${BUNDLE}NewsSourceModelFlow_0003 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_NEWS_SOURCE_MODEL_FLOW_0004
     * @tc.name      PullToRefresh_NewsSourceModelFlow_0004
     * @tc.desc      NewsSourceModel call flow totalCount > addData > clear > pushData keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_NewsSourceModelFlow_0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}NewsSourceModelFlow_0004 begin`);
      const subject: NewsSourceModel = new NewsSourceModel();
      const step1: number = subject.totalCount();
      logInfo(`step1 totalCount(): step1=${step1}`);
      expect(step1).assertEqual(0);
      subject.addData(110, new NewsItem('Hello World', 'Hello', 'Hello', ''));
      subject.clear();
      subject.pushData(new NewsItem('abc', 'Hello', 'Hello', ''));
      logInfo(`${BUNDLE}NewsSourceModelFlow_0004 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_NEWS_SOURCE_MODEL_FLOW_0005
     * @tc.name      PullToRefresh_NewsSourceModelFlow_0005
     * @tc.desc      NewsSourceModel call flow addNotifications > clear keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_NewsSourceModelFlow_0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}NewsSourceModelFlow_0005 begin`);
      const subject: NewsSourceModel = new NewsSourceModel();
      const step1: number[] = subject.addNotifications();
      logInfo(`step1 addNotifications(): step1.length=${step1.length}`);
      expect(step1.length).assertEqual(0);
      subject.clear();
      logInfo(`${BUNDLE}NewsSourceModelFlow_0005 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_NEWS_SOURCE_MODEL_FLOW_0006
     * @tc.name      PullToRefresh_NewsSourceModelFlow_0006
     * @tc.desc      NewsSourceModel call flow getData > getData keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_NewsSourceModelFlow_0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}NewsSourceModelFlow_0006 begin`);
      const subject: NewsSourceModel = new NewsSourceModel();
      const step1: NewsItem | undefined = subject.getData(70);
      logInfo(`step1 getData(70): step1=${step1}`);
      expect(step1).assertUndefined();
      const step2: NewsItem | undefined = subject.getData(-22);
      logInfo(`step2 getData(-22): step2=${step2}`);
      expect(step2).assertUndefined();
      logInfo(`${BUNDLE}NewsSourceModelFlow_0006 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_NEWS_SOURCE_MODEL_FLOW_0007
     * @tc.name      PullToRefresh_NewsSourceModelFlow_0007
     * @tc.desc      NewsSourceModel call flow clear > getData > pushData keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_NewsSourceModelFlow_0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}NewsSourceModelFlow_0007 begin`);
      const subject: NewsSourceModel = new NewsSourceModel();
      subject.clear();
      const step2: NewsItem | undefined = subject.getData(80.03);
      logInfo(`step2 getData(80.03): step2=${step2}`);
      expect(step2).assertUndefined();
      subject.pushData(new NewsItem('abc', 'Hello', 'Hello', ''));
      logInfo(`${BUNDLE}NewsSourceModelFlow_0007 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_NEWS_SOURCE_MODEL_FLOW_0008
     * @tc.name      PullToRefresh_NewsSourceModelFlow_0008
     * @tc.desc      NewsSourceModel call flow addData > ids > clear keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_NewsSourceModelFlow_0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}NewsSourceModelFlow_0008 begin`);
      const subject: NewsSourceModel = new NewsSourceModel();
      subject.addData(80, new NewsItem('Hello World', 'Hello', 'Hello', ''));
      const step2: string[] = subject.ids();
      logInfo(`step2 ids(): step2.length=${step2.length}`);
      expect(step2.length).assertEqual(1);
      logInfo(`step2 ids(): JSON.stringify(step2)=${JSON.stringify(step2)}`);
      expect(JSON.stringify(step2)).assertEqual('["Hello World"]');
      subject.clear();
      logInfo(`${BUNDLE}NewsSourceModelFlow_0008 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_NEWS_SOURCE_MODEL_FLOW_0009
     * @tc.name      PullToRefresh_NewsSourceModelFlow_0009
     * @tc.desc      NewsSourceModel call flow clear > addNotifications > ids > addNotifications > addData keeps stat...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_NewsSourceModelFlow_0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}NewsSourceModelFlow_0009 begin`);
      const subject: NewsSourceModel = new NewsSourceModel();
      subject.clear();
      const step2: number[] = subject.addNotifications();
      logInfo(`step2 addNotifications(): step2.length=${step2.length}`);
      expect(step2.length).assertEqual(0);
      const step3: string[] = subject.ids();
      logInfo(`step3 ids(): step3.length=${step3.length}`);
      expect(step3.length).assertEqual(0);
      const step4: number[] = subject.addNotifications();
      logInfo(`step4 addNotifications(): step4.length=${step4.length}`);
      expect(step4.length).assertEqual(0);
      subject.addData(65, new NewsItem('', 'Hello', 'Hello', ''));
      logInfo(`${BUNDLE}NewsSourceModelFlow_0009 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_NEWS_SOURCE_MODEL_FLOW_0010
     * @tc.name      PullToRefresh_NewsSourceModelFlow_0010
     * @tc.desc      NewsSourceModel call flow addData > totalCount > totalCount > ids keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_NewsSourceModelFlow_0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}NewsSourceModelFlow_0010 begin`);
      const subject: NewsSourceModel = new NewsSourceModel();
      subject.addData(110, new NewsItem('', 'Hello', 'Hello', ''));
      const step2: number = subject.totalCount();
      logInfo(`step2 totalCount(): step2=${step2}`);
      expect(step2).assertEqual(1);
      const step3: number = subject.totalCount();
      logInfo(`step3 totalCount(): step3=${step3}`);
      expect(step3).assertEqual(1);
      const step4: string[] = subject.ids();
      logInfo(`step4 ids(): step4.length=${step4.length}`);
      expect(step4.length).assertEqual(1);
      logInfo(`step4 ids(): JSON.stringify(step4)=${JSON.stringify(step4)}`);
      expect(JSON.stringify(step4)).assertEqual('[""]');
      logInfo(`${BUNDLE}NewsSourceModelFlow_0010 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_NEWS_SOURCE_MODEL_FLOW_0011
     * @tc.name      PullToRefresh_NewsSourceModelFlow_0011
     * @tc.desc      NewsSourceModel call flow clear > ids > clear > pushData keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_NewsSourceModelFlow_0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}NewsSourceModelFlow_0011 begin`);
      const subject: NewsSourceModel = new NewsSourceModel();
      subject.clear();
      const step2: string[] = subject.ids();
      logInfo(`step2 ids(): step2.length=${step2.length}`);
      expect(step2.length).assertEqual(0);
      subject.clear();
      subject.pushData(new NewsItem('', 'Hello', 'Hello', ''));
      logInfo(`${BUNDLE}NewsSourceModelFlow_0011 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_NEWS_SOURCE_MODEL_FLOW_0012
     * @tc.name      PullToRefresh_NewsSourceModelFlow_0012
     * @tc.desc      NewsSourceModel call flow addData > pushData > addNotifications > totalCount > clear keeps state...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_NewsSourceModelFlow_0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}NewsSourceModelFlow_0012 begin`);
      const subject: NewsSourceModel = new NewsSourceModel();
      subject.addData(-14, new NewsItem('Hello World', 'Hello', 'Hello', ''));
      subject.pushData(new NewsItem('Hello World', 'Hello', 'Hello', ''));
      const step3: number[] = subject.addNotifications();
      logInfo(`step3 addNotifications(): step3.length=${step3.length}`);
      expect(step3.length).assertEqual(2);
      logInfo(`step3 addNotifications(): JSON.stringify(step3)=${JSON.stringify(step3)}`);
      expect(JSON.stringify(step3)).assertEqual('[-14,1]');
      const step4: number = subject.totalCount();
      logInfo(`step4 totalCount(): step4=${step4}`);
      expect(step4).assertEqual(2);
      subject.clear();
      logInfo(`${BUNDLE}NewsSourceModelFlow_0012 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_NEWS_SOURCE_MODEL_FLOW_0013
     * @tc.name      PullToRefresh_NewsSourceModelFlow_0013
     * @tc.desc      NewsSourceModel call flow ids > totalCount > getData keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_NewsSourceModelFlow_0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}NewsSourceModelFlow_0013 begin`);
      const subject: NewsSourceModel = new NewsSourceModel();
      const step1: string[] = subject.ids();
      logInfo(`step1 ids(): step1.length=${step1.length}`);
      expect(step1.length).assertEqual(0);
      const step2: number = subject.totalCount();
      logInfo(`step2 totalCount(): step2=${step2}`);
      expect(step2).assertEqual(0);
      const step3: NewsItem | undefined = subject.getData(-87);
      logInfo(`step3 getData(-87): step3=${step3}`);
      expect(step3).assertUndefined();
      logInfo(`${BUNDLE}NewsSourceModelFlow_0013 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_NEWS_SOURCE_MODEL_FLOW_0014
     * @tc.name      PullToRefresh_NewsSourceModelFlow_0014
     * @tc.desc      NewsSourceModel call flow clear > addNotifications > getData keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_NewsSourceModelFlow_0014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}NewsSourceModelFlow_0014 begin`);
      const subject: NewsSourceModel = new NewsSourceModel();
      subject.clear();
      const step2: number[] = subject.addNotifications();
      logInfo(`step2 addNotifications(): step2.length=${step2.length}`);
      expect(step2.length).assertEqual(0);
      const step3: NewsItem | undefined = subject.getData(16.25);
      logInfo(`step3 getData(16.25): step3=${step3}`);
      expect(step3).assertUndefined();
      logInfo(`${BUNDLE}NewsSourceModelFlow_0014 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_NEWS_SOURCE_MODEL_FLOW_0015
     * @tc.name      PullToRefresh_NewsSourceModelFlow_0015
     * @tc.desc      NewsSourceModel call flow pushData > addNotifications > ids > getData keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_NewsSourceModelFlow_0015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}NewsSourceModelFlow_0015 begin`);
      const subject: NewsSourceModel = new NewsSourceModel();
      subject.pushData(new NewsItem('', 'Hello', 'Hello', ''));
      const step2: number[] = subject.addNotifications();
      logInfo(`step2 addNotifications(): step2.length=${step2.length}`);
      expect(step2.length).assertEqual(1);
      logInfo(`step2 addNotifications(): JSON.stringify(step2)=${JSON.stringify(step2)}`);
      expect(JSON.stringify(step2)).assertEqual('[0]');
      const step3: string[] = subject.ids();
      logInfo(`step3 ids(): step3.length=${step3.length}`);
      expect(step3.length).assertEqual(1);
      logInfo(`step3 ids(): JSON.stringify(step3)=${JSON.stringify(step3)}`);
      expect(JSON.stringify(step3)).assertEqual('[""]');
      const step4: NewsItem | undefined = subject.getData(89);
      logInfo(`step4 getData(89): step4=${step4}`);
      expect(step4).assertUndefined();
      logInfo(`${BUNDLE}NewsSourceModelFlow_0015 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_NEWS_SOURCE_MODEL_FLOW_0016
     * @tc.name      PullToRefresh_NewsSourceModelFlow_0016
     * @tc.desc      NewsSourceModel call flow totalCount > ids > clear > pushData > addNotifications keeps state con...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_NewsSourceModelFlow_0016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}NewsSourceModelFlow_0016 begin`);
      const subject: NewsSourceModel = new NewsSourceModel();
      const step1: number = subject.totalCount();
      logInfo(`step1 totalCount(): step1=${step1}`);
      expect(step1).assertEqual(0);
      const step2: string[] = subject.ids();
      logInfo(`step2 ids(): step2.length=${step2.length}`);
      expect(step2.length).assertEqual(0);
      subject.clear();
      subject.pushData(new NewsItem('', 'Hello', 'Hello', ''));
      const step5: number[] = subject.addNotifications();
      logInfo(`step5 addNotifications(): step5.length=${step5.length}`);
      expect(step5.length).assertEqual(1);
      logInfo(`step5 addNotifications(): JSON.stringify(step5)=${JSON.stringify(step5)}`);
      expect(JSON.stringify(step5)).assertEqual('[0]');
      logInfo(`${BUNDLE}NewsSourceModelFlow_0016 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_NEWS_SOURCE_MODEL_FLOW_0017
     * @tc.name      PullToRefresh_NewsSourceModelFlow_0017
     * @tc.desc      NewsSourceModel call flow ids > ids keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_NewsSourceModelFlow_0017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}NewsSourceModelFlow_0017 begin`);
      const subject: NewsSourceModel = new NewsSourceModel();
      const step1: string[] = subject.ids();
      logInfo(`step1 ids(): step1.length=${step1.length}`);
      expect(step1.length).assertEqual(0);
      const step2: string[] = subject.ids();
      logInfo(`step2 ids(): step2.length=${step2.length}`);
      expect(step2.length).assertEqual(0);
      logInfo(`${BUNDLE}NewsSourceModelFlow_0017 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_NEWS_SOURCE_MODEL_FLOW_0018
     * @tc.name      PullToRefresh_NewsSourceModelFlow_0018
     * @tc.desc      NewsSourceModel call flow ids > getData keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_NewsSourceModelFlow_0018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}NewsSourceModelFlow_0018 begin`);
      const subject: NewsSourceModel = new NewsSourceModel();
      const step1: string[] = subject.ids();
      logInfo(`step1 ids(): step1.length=${step1.length}`);
      expect(step1.length).assertEqual(0);
      const step2: NewsItem | undefined = subject.getData(30);
      logInfo(`step2 getData(30): step2=${step2}`);
      expect(step2).assertUndefined();
      logInfo(`${BUNDLE}NewsSourceModelFlow_0018 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_NEWS_SOURCE_MODEL_FLOW_0019
     * @tc.name      PullToRefresh_NewsSourceModelFlow_0019
     * @tc.desc      NewsSourceModel call flow addNotifications > addData > getData > totalCount > ids keeps state co...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_NewsSourceModelFlow_0019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}NewsSourceModelFlow_0019 begin`);
      const subject: NewsSourceModel = new NewsSourceModel();
      const step1: number[] = subject.addNotifications();
      logInfo(`step1 addNotifications(): step1.length=${step1.length}`);
      expect(step1.length).assertEqual(0);
      subject.addData(100, new NewsItem('abc', 'Hello', 'Hello', ''));
      const step3: NewsItem | undefined = subject.getData(-2);
      logInfo(`step3 getData(-2): step3=${step3}`);
      expect(step3).assertUndefined();
      const step4: number = subject.totalCount();
      logInfo(`step4 totalCount(): step4=${step4}`);
      expect(step4).assertEqual(1);
      const step5: string[] = subject.ids();
      logInfo(`step5 ids(): step5.length=${step5.length}`);
      expect(step5.length).assertEqual(1);
      logInfo(`step5 ids(): JSON.stringify(step5)=${JSON.stringify(step5)}`);
      expect(JSON.stringify(step5)).assertEqual('["abc"]');
      logInfo(`${BUNDLE}NewsSourceModelFlow_0019 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_NEWS_SOURCE_MODEL_FLOW_0020
     * @tc.name      PullToRefresh_NewsSourceModelFlow_0020
     * @tc.desc      NewsSourceModel call flow totalCount > addNotifications > addData keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_NewsSourceModelFlow_0020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}NewsSourceModelFlow_0020 begin`);
      const subject: NewsSourceModel = new NewsSourceModel();
      const step1: number = subject.totalCount();
      logInfo(`step1 totalCount(): step1=${step1}`);
      expect(step1).assertEqual(0);
      const step2: number[] = subject.addNotifications();
      logInfo(`step2 addNotifications(): step2.length=${step2.length}`);
      expect(step2.length).assertEqual(0);
      subject.addData(15, new NewsItem('a', 'Hello', 'Hello', ''));
      logInfo(`${BUNDLE}NewsSourceModelFlow_0020 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_NEWS_SOURCE_MODEL_FLOW_0021
     * @tc.name      PullToRefresh_NewsSourceModelFlow_0021
     * @tc.desc      NewsSourceModel call flow ids > clear > clear > addNotifications keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_NewsSourceModelFlow_0021', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}NewsSourceModelFlow_0021 begin`);
      const subject: NewsSourceModel = new NewsSourceModel();
      const step1: string[] = subject.ids();
      logInfo(`step1 ids(): step1.length=${step1.length}`);
      expect(step1.length).assertEqual(0);
      subject.clear();
      subject.clear();
      const step4: number[] = subject.addNotifications();
      logInfo(`step4 addNotifications(): step4.length=${step4.length}`);
      expect(step4.length).assertEqual(0);
      logInfo(`${BUNDLE}NewsSourceModelFlow_0021 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_NEWS_SOURCE_MODEL_FLOW_0022
     * @tc.name      PullToRefresh_NewsSourceModelFlow_0022
     * @tc.desc      NewsSourceModel call flow pushData > pushData > getData > totalCount keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_NewsSourceModelFlow_0022', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}NewsSourceModelFlow_0022 begin`);
      const subject: NewsSourceModel = new NewsSourceModel();
      subject.pushData(new NewsItem('', 'Hello', 'Hello', ''));
      subject.pushData(new NewsItem('Hello World', 'Hello', 'Hello', ''));
      const step3: NewsItem | undefined = subject.getData(167);
      logInfo(`step3 getData(167): step3=${step3}`);
      expect(step3).assertUndefined();
      const step4: number = subject.totalCount();
      logInfo(`step4 totalCount(): step4=${step4}`);
      expect(step4).assertEqual(2);
      logInfo(`${BUNDLE}NewsSourceModelFlow_0022 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_NEWS_SOURCE_MODEL_FLOW_0023
     * @tc.name      PullToRefresh_NewsSourceModelFlow_0023
     * @tc.desc      NewsSourceModel call flow addData > pushData > addNotifications keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_NewsSourceModelFlow_0023', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}NewsSourceModelFlow_0023 begin`);
      const subject: NewsSourceModel = new NewsSourceModel();
      subject.addData(80, new NewsItem('Hello World', 'Hello', 'Hello', ''));
      subject.pushData(new NewsItem('a', 'Hello', 'Hello', ''));
      const step3: number[] = subject.addNotifications();
      logInfo(`step3 addNotifications(): step3.length=${step3.length}`);
      expect(step3.length).assertEqual(2);
      logInfo(`step3 addNotifications(): JSON.stringify(step3)=${JSON.stringify(step3)}`);
      expect(JSON.stringify(step3)).assertEqual('[80,1]');
      logInfo(`${BUNDLE}NewsSourceModelFlow_0023 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_NEWS_SOURCE_MODEL_FLOW_0024
     * @tc.name      PullToRefresh_NewsSourceModelFlow_0024
     * @tc.desc      NewsSourceModel call flow getData > addNotifications > pushData > ids keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_NewsSourceModelFlow_0024', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}NewsSourceModelFlow_0024 begin`);
      const subject: NewsSourceModel = new NewsSourceModel();
      const step1: NewsItem | undefined = subject.getData(98);
      logInfo(`step1 getData(98): step1=${step1}`);
      expect(step1).assertUndefined();
      const step2: number[] = subject.addNotifications();
      logInfo(`step2 addNotifications(): step2.length=${step2.length}`);
      expect(step2.length).assertEqual(0);
      subject.pushData(new NewsItem('Hello World', 'Hello', 'Hello', ''));
      const step4: string[] = subject.ids();
      logInfo(`step4 ids(): step4.length=${step4.length}`);
      expect(step4.length).assertEqual(1);
      logInfo(`step4 ids(): JSON.stringify(step4)=${JSON.stringify(step4)}`);
      expect(JSON.stringify(step4)).assertEqual('["Hello World"]');
      logInfo(`${BUNDLE}NewsSourceModelFlow_0024 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_NEWS_SOURCE_MODEL_FLOW_0025
     * @tc.name      PullToRefresh_NewsSourceModelFlow_0025
     * @tc.desc      NewsSourceModel call flow pushData > getData > addNotifications > getData keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_NewsSourceModelFlow_0025', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}NewsSourceModelFlow_0025 begin`);
      const subject: NewsSourceModel = new NewsSourceModel();
      subject.pushData(new NewsItem('', 'Hello', 'Hello', ''));
      const step2: NewsItem | undefined = subject.getData(184);
      logInfo(`step2 getData(184): step2=${step2}`);
      expect(step2).assertUndefined();
      const step3: number[] = subject.addNotifications();
      logInfo(`step3 addNotifications(): step3.length=${step3.length}`);
      expect(step3.length).assertEqual(1);
      logInfo(`step3 addNotifications(): JSON.stringify(step3)=${JSON.stringify(step3)}`);
      expect(JSON.stringify(step3)).assertEqual('[0]');
      const step4: NewsItem | undefined = subject.getData(18.31);
      logInfo(`step4 getData(18.31): step4=${step4}`);
      expect(step4).assertUndefined();
      logInfo(`${BUNDLE}NewsSourceModelFlow_0025 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_NEWS_SOURCE_MODEL_FLOW_0026
     * @tc.name      PullToRefresh_NewsSourceModelFlow_0026
     * @tc.desc      NewsSourceModel call flow totalCount > addNotifications > clear > getData > clear keeps state co...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_NewsSourceModelFlow_0026', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}NewsSourceModelFlow_0026 begin`);
      const subject: NewsSourceModel = new NewsSourceModel();
      const step1: number = subject.totalCount();
      logInfo(`step1 totalCount(): step1=${step1}`);
      expect(step1).assertEqual(0);
      const step2: number[] = subject.addNotifications();
      logInfo(`step2 addNotifications(): step2.length=${step2.length}`);
      expect(step2.length).assertEqual(0);
      subject.clear();
      const step4: NewsItem | undefined = subject.getData(195);
      logInfo(`step4 getData(195): step4=${step4}`);
      expect(step4).assertUndefined();
      subject.clear();
      logInfo(`${BUNDLE}NewsSourceModelFlow_0026 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_NEWS_SOURCE_MODEL_FLOW_0027
     * @tc.name      PullToRefresh_NewsSourceModelFlow_0027
     * @tc.desc      NewsSourceModel call flow ids > pushData > getData > clear > getData keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_NewsSourceModelFlow_0027', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}NewsSourceModelFlow_0027 begin`);
      const subject: NewsSourceModel = new NewsSourceModel();
      const step1: string[] = subject.ids();
      logInfo(`step1 ids(): step1.length=${step1.length}`);
      expect(step1.length).assertEqual(0);
      subject.pushData(new NewsItem('a', 'Hello', 'Hello', ''));
      const step3: NewsItem | undefined = subject.getData(-26);
      logInfo(`step3 getData(-26): step3=${step3}`);
      expect(step3).assertUndefined();
      subject.clear();
      const step5: NewsItem | undefined = subject.getData(-5);
      logInfo(`step5 getData(-5): step5=${step5}`);
      expect(step5).assertUndefined();
      logInfo(`${BUNDLE}NewsSourceModelFlow_0027 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_NEWS_SOURCE_MODEL_FLOW_0028
     * @tc.name      PullToRefresh_NewsSourceModelFlow_0028
     * @tc.desc      NewsSourceModel call flow pushData > totalCount > clear > totalCount keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_NewsSourceModelFlow_0028', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}NewsSourceModelFlow_0028 begin`);
      const subject: NewsSourceModel = new NewsSourceModel();
      subject.pushData(new NewsItem('a', 'Hello', 'Hello', ''));
      const step2: number = subject.totalCount();
      logInfo(`step2 totalCount(): step2=${step2}`);
      expect(step2).assertEqual(1);
      subject.clear();
      const step4: number = subject.totalCount();
      logInfo(`step4 totalCount(): step4=${step4}`);
      expect(step4).assertEqual(0);
      logInfo(`${BUNDLE}NewsSourceModelFlow_0028 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_NEWS_SOURCE_MODEL_FLOW_0029
     * @tc.name      PullToRefresh_NewsSourceModelFlow_0029
     * @tc.desc      NewsSourceModel call flow pushData > ids > getData keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_NewsSourceModelFlow_0029', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}NewsSourceModelFlow_0029 begin`);
      const subject: NewsSourceModel = new NewsSourceModel();
      subject.pushData(new NewsItem('abc', 'Hello', 'Hello', ''));
      const step2: string[] = subject.ids();
      logInfo(`step2 ids(): step2.length=${step2.length}`);
      expect(step2.length).assertEqual(1);
      logInfo(`step2 ids(): JSON.stringify(step2)=${JSON.stringify(step2)}`);
      expect(JSON.stringify(step2)).assertEqual('["abc"]');
      const step3: NewsItem | undefined = subject.getData(-59);
      logInfo(`step3 getData(-59): step3=${step3}`);
      expect(step3).assertUndefined();
      logInfo(`${BUNDLE}NewsSourceModelFlow_0029 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_NEWS_SOURCE_MODEL_FLOW_0030
     * @tc.name      PullToRefresh_NewsSourceModelFlow_0030
     * @tc.desc      NewsSourceModel call flow totalCount > totalCount > addData keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_NewsSourceModelFlow_0030', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}NewsSourceModelFlow_0030 begin`);
      const subject: NewsSourceModel = new NewsSourceModel();
      const step1: number = subject.totalCount();
      logInfo(`step1 totalCount(): step1=${step1}`);
      expect(step1).assertEqual(0);
      const step2: number = subject.totalCount();
      logInfo(`step2 totalCount(): step2=${step2}`);
      expect(step2).assertEqual(0);
      subject.addData(80, new NewsItem('a', 'Hello', 'Hello', ''));
      logInfo(`${BUNDLE}NewsSourceModelFlow_0030 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_NEWS_SOURCE_MODEL_FLOW_0031
     * @tc.name      PullToRefresh_NewsSourceModelFlow_0031
     * @tc.desc      NewsSourceModel call flow totalCount > getData > pushData > getData > pushData keeps state consi...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_NewsSourceModelFlow_0031', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}NewsSourceModelFlow_0031 begin`);
      const subject: NewsSourceModel = new NewsSourceModel();
      const step1: number = subject.totalCount();
      logInfo(`step1 totalCount(): step1=${step1}`);
      expect(step1).assertEqual(0);
      const step2: NewsItem | undefined = subject.getData(-87);
      logInfo(`step2 getData(-87): step2=${step2}`);
      expect(step2).assertUndefined();
      subject.pushData(new NewsItem('abc', 'Hello', 'Hello', ''));
      const step4: NewsItem | undefined = subject.getData(70.16);
      logInfo(`step4 getData(70.16): step4=${step4}`);
      expect(step4).assertUndefined();
      subject.pushData(new NewsItem('a', 'Hello', 'Hello', ''));
      logInfo(`${BUNDLE}NewsSourceModelFlow_0031 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_NEWS_SOURCE_MODEL_FLOW_0032
     * @tc.name      PullToRefresh_NewsSourceModelFlow_0032
     * @tc.desc      NewsSourceModel call flow pushData > clear > pushData > addData > addNotifications keeps state c...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_NewsSourceModelFlow_0032', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}NewsSourceModelFlow_0032 begin`);
      const subject: NewsSourceModel = new NewsSourceModel();
      subject.pushData(new NewsItem('abc', 'Hello', 'Hello', ''));
      subject.clear();
      subject.pushData(new NewsItem('Hello World', 'Hello', 'Hello', ''));
      subject.addData(60, new NewsItem('a', 'Hello', 'Hello', ''));
      const step5: number[] = subject.addNotifications();
      logInfo(`step5 addNotifications(): step5.length=${step5.length}`);
      expect(step5.length).assertEqual(3);
      logInfo(`step5 addNotifications(): JSON.stringify(step5)=${JSON.stringify(step5)}`);
      expect(JSON.stringify(step5)).assertEqual('[0,0,60]');
      logInfo(`${BUNDLE}NewsSourceModelFlow_0032 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_NEWS_SOURCE_MODEL_FLOW_0033
     * @tc.name      PullToRefresh_NewsSourceModelFlow_0033
     * @tc.desc      NewsSourceModel call flow addData > ids keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_NewsSourceModelFlow_0033', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}NewsSourceModelFlow_0033 begin`);
      const subject: NewsSourceModel = new NewsSourceModel();
      subject.addData(85, new NewsItem('abc', 'Hello', 'Hello', ''));
      const step2: string[] = subject.ids();
      logInfo(`step2 ids(): step2.length=${step2.length}`);
      expect(step2.length).assertEqual(1);
      logInfo(`step2 ids(): JSON.stringify(step2)=${JSON.stringify(step2)}`);
      expect(JSON.stringify(step2)).assertEqual('["abc"]');
      logInfo(`${BUNDLE}NewsSourceModelFlow_0033 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_NEWS_SOURCE_MODEL_FLOW_0034
     * @tc.name      PullToRefresh_NewsSourceModelFlow_0034
     * @tc.desc      NewsSourceModel call flow pushData > pushData > addNotifications > addData > totalCount keeps st...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_NewsSourceModelFlow_0034', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}NewsSourceModelFlow_0034 begin`);
      const subject: NewsSourceModel = new NewsSourceModel();
      subject.pushData(new NewsItem('Hello World', 'Hello', 'Hello', ''));
      subject.pushData(new NewsItem('Hello World', 'Hello', 'Hello', ''));
      const step3: number[] = subject.addNotifications();
      logInfo(`step3 addNotifications(): step3.length=${step3.length}`);
      expect(step3.length).assertEqual(2);
      logInfo(`step3 addNotifications(): JSON.stringify(step3)=${JSON.stringify(step3)}`);
      expect(JSON.stringify(step3)).assertEqual('[0,1]');
      subject.addData(30, new NewsItem('a', 'Hello', 'Hello', ''));
      const step5: number = subject.totalCount();
      logInfo(`step5 totalCount(): step5=${step5}`);
      expect(step5).assertEqual(3);
      logInfo(`${BUNDLE}NewsSourceModelFlow_0034 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_NEWS_SOURCE_MODEL_FLOW_0035
     * @tc.name      PullToRefresh_NewsSourceModelFlow_0035
     * @tc.desc      NewsSourceModel call flow addData > pushData > addNotifications keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_NewsSourceModelFlow_0035', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}NewsSourceModelFlow_0035 begin`);
      const subject: NewsSourceModel = new NewsSourceModel();
      subject.addData(35, new NewsItem('a', 'Hello', 'Hello', ''));
      subject.pushData(new NewsItem('a', 'Hello', 'Hello', ''));
      const step3: number[] = subject.addNotifications();
      logInfo(`step3 addNotifications(): step3.length=${step3.length}`);
      expect(step3.length).assertEqual(2);
      logInfo(`step3 addNotifications(): JSON.stringify(step3)=${JSON.stringify(step3)}`);
      expect(JSON.stringify(step3)).assertEqual('[35,1]');
      logInfo(`${BUNDLE}NewsSourceModelFlow_0035 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_NEWS_SOURCE_MODEL_FLOW_0036
     * @tc.name      PullToRefresh_NewsSourceModelFlow_0036
     * @tc.desc      NewsSourceModel call flow ids > addNotifications > getData keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_NewsSourceModelFlow_0036', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}NewsSourceModelFlow_0036 begin`);
      const subject: NewsSourceModel = new NewsSourceModel();
      const step1: string[] = subject.ids();
      logInfo(`step1 ids(): step1.length=${step1.length}`);
      expect(step1.length).assertEqual(0);
      const step2: number[] = subject.addNotifications();
      logInfo(`step2 addNotifications(): step2.length=${step2.length}`);
      expect(step2.length).assertEqual(0);
      const step3: NewsItem | undefined = subject.getData(80.03);
      logInfo(`step3 getData(80.03): step3=${step3}`);
      expect(step3).assertUndefined();
      logInfo(`${BUNDLE}NewsSourceModelFlow_0036 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_NEWS_SOURCE_MODEL_FLOW_0037
     * @tc.name      PullToRefresh_NewsSourceModelFlow_0037
     * @tc.desc      NewsSourceModel call flow pushData > pushData > ids > totalCount keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_NewsSourceModelFlow_0037', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}NewsSourceModelFlow_0037 begin`);
      const subject: NewsSourceModel = new NewsSourceModel();
      subject.pushData(new NewsItem('Hello World', 'Hello', 'Hello', ''));
      subject.pushData(new NewsItem('a', 'Hello', 'Hello', ''));
      const step3: string[] = subject.ids();
      logInfo(`step3 ids(): step3.length=${step3.length}`);
      expect(step3.length).assertEqual(2);
      logInfo(`step3 ids(): JSON.stringify(step3)=${JSON.stringify(step3)}`);
      expect(JSON.stringify(step3)).assertEqual('["Hello World","a"]');
      const step4: number = subject.totalCount();
      logInfo(`step4 totalCount(): step4=${step4}`);
      expect(step4).assertEqual(2);
      logInfo(`${BUNDLE}NewsSourceModelFlow_0037 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_NEWS_SOURCE_MODEL_FLOW_0038
     * @tc.name      PullToRefresh_NewsSourceModelFlow_0038
     * @tc.desc      NewsSourceModel call flow addData > pushData > addNotifications > addData keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_NewsSourceModelFlow_0038', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}NewsSourceModelFlow_0038 begin`);
      const subject: NewsSourceModel = new NewsSourceModel();
      subject.addData(1, new NewsItem('', 'Hello', 'Hello', ''));
      subject.pushData(new NewsItem('abc', 'Hello', 'Hello', ''));
      const step3: number[] = subject.addNotifications();
      logInfo(`step3 addNotifications(): step3.length=${step3.length}`);
      expect(step3.length).assertEqual(2);
      logInfo(`step3 addNotifications(): JSON.stringify(step3)=${JSON.stringify(step3)}`);
      expect(JSON.stringify(step3)).assertEqual('[1,1]');
      subject.addData(39.47, new NewsItem('abc', 'Hello', 'Hello', ''));
      logInfo(`${BUNDLE}NewsSourceModelFlow_0038 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_NEWS_SOURCE_MODEL_FLOW_0039
     * @tc.name      PullToRefresh_NewsSourceModelFlow_0039
     * @tc.desc      NewsSourceModel call flow addNotifications > addData > addNotifications keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_NewsSourceModelFlow_0039', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}NewsSourceModelFlow_0039 begin`);
      const subject: NewsSourceModel = new NewsSourceModel();
      const step1: number[] = subject.addNotifications();
      logInfo(`step1 addNotifications(): step1.length=${step1.length}`);
      expect(step1.length).assertEqual(0);
      subject.addData(15, new NewsItem('a', 'Hello', 'Hello', ''));
      const step3: number[] = subject.addNotifications();
      logInfo(`step3 addNotifications(): step3.length=${step3.length}`);
      expect(step3.length).assertEqual(1);
      logInfo(`step3 addNotifications(): JSON.stringify(step3)=${JSON.stringify(step3)}`);
      expect(JSON.stringify(step3)).assertEqual('[15]');
      logInfo(`${BUNDLE}NewsSourceModelFlow_0039 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_NEWS_SOURCE_MODEL_FLOW_0040
     * @tc.name      PullToRefresh_NewsSourceModelFlow_0040
     * @tc.desc      NewsSourceModel call flow clear > ids > getData > clear > totalCount keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_NewsSourceModelFlow_0040', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}NewsSourceModelFlow_0040 begin`);
      const subject: NewsSourceModel = new NewsSourceModel();
      subject.clear();
      const step2: string[] = subject.ids();
      logInfo(`step2 ids(): step2.length=${step2.length}`);
      expect(step2.length).assertEqual(0);
      const step3: NewsItem | undefined = subject.getData(-59);
      logInfo(`step3 getData(-59): step3=${step3}`);
      expect(step3).assertUndefined();
      subject.clear();
      const step5: number = subject.totalCount();
      logInfo(`step5 totalCount(): step5=${step5}`);
      expect(step5).assertEqual(0);
      logInfo(`${BUNDLE}NewsSourceModelFlow_0040 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_NEWS_SOURCE_MODEL_FLOW_0041
     * @tc.name      PullToRefresh_NewsSourceModelFlow_0041
     * @tc.desc      NewsSourceModel call flow addData > ids > ids keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_NewsSourceModelFlow_0041', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}NewsSourceModelFlow_0041 begin`);
      const subject: NewsSourceModel = new NewsSourceModel();
      subject.addData(1, new NewsItem('abc', 'Hello', 'Hello', ''));
      const step2: string[] = subject.ids();
      logInfo(`step2 ids(): step2.length=${step2.length}`);
      expect(step2.length).assertEqual(1);
      logInfo(`step2 ids(): JSON.stringify(step2)=${JSON.stringify(step2)}`);
      expect(JSON.stringify(step2)).assertEqual('["abc"]');
      const step3: string[] = subject.ids();
      logInfo(`step3 ids(): step3.length=${step3.length}`);
      expect(step3.length).assertEqual(1);
      logInfo(`step3 ids(): JSON.stringify(step3)=${JSON.stringify(step3)}`);
      expect(JSON.stringify(step3)).assertEqual('["abc"]');
      logInfo(`${BUNDLE}NewsSourceModelFlow_0041 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_NEWS_SOURCE_MODEL_FLOW_0042
     * @tc.name      PullToRefresh_NewsSourceModelFlow_0042
     * @tc.desc      NewsSourceModel call flow pushData > clear > pushData > clear > getData keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_NewsSourceModelFlow_0042', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}NewsSourceModelFlow_0042 begin`);
      const subject: NewsSourceModel = new NewsSourceModel();
      subject.pushData(new NewsItem('abc', 'Hello', 'Hello', ''));
      subject.clear();
      subject.pushData(new NewsItem('Hello World', 'Hello', 'Hello', ''));
      subject.clear();
      const step5: NewsItem | undefined = subject.getData(16.25);
      logInfo(`step5 getData(16.25): step5=${step5}`);
      expect(step5).assertUndefined();
      logInfo(`${BUNDLE}NewsSourceModelFlow_0042 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_NEWS_SOURCE_MODEL_FLOW_0043
     * @tc.name      PullToRefresh_NewsSourceModelFlow_0043
     * @tc.desc      NewsSourceModel call flow getData > addNotifications keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_NewsSourceModelFlow_0043', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}NewsSourceModelFlow_0043 begin`);
      const subject: NewsSourceModel = new NewsSourceModel();
      const step1: NewsItem | undefined = subject.getData(-16);
      logInfo(`step1 getData(-16): step1=${step1}`);
      expect(step1).assertUndefined();
      const step2: number[] = subject.addNotifications();
      logInfo(`step2 addNotifications(): step2.length=${step2.length}`);
      expect(step2.length).assertEqual(0);
      logInfo(`${BUNDLE}NewsSourceModelFlow_0043 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_NEWS_SOURCE_MODEL_FLOW_0044
     * @tc.name      PullToRefresh_NewsSourceModelFlow_0044
     * @tc.desc      NewsSourceModel call flow ids > clear > ids > getData keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_NewsSourceModelFlow_0044', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}NewsSourceModelFlow_0044 begin`);
      const subject: NewsSourceModel = new NewsSourceModel();
      const step1: string[] = subject.ids();
      logInfo(`step1 ids(): step1.length=${step1.length}`);
      expect(step1.length).assertEqual(0);
      subject.clear();
      const step3: string[] = subject.ids();
      logInfo(`step3 ids(): step3.length=${step3.length}`);
      expect(step3.length).assertEqual(0);
      const step4: NewsItem | undefined = subject.getData(2);
      logInfo(`step4 getData(2): step4=${step4}`);
      expect(step4).assertUndefined();
      logInfo(`${BUNDLE}NewsSourceModelFlow_0044 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_NEWS_SOURCE_MODEL_FLOW_0045
     * @tc.name      PullToRefresh_NewsSourceModelFlow_0045
     * @tc.desc      NewsSourceModel call flow pushData > totalCount > getData > clear keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_NewsSourceModelFlow_0045', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}NewsSourceModelFlow_0045 begin`);
      const subject: NewsSourceModel = new NewsSourceModel();
      subject.pushData(new NewsItem('abc', 'Hello', 'Hello', ''));
      const step2: number = subject.totalCount();
      logInfo(`step2 totalCount(): step2=${step2}`);
      expect(step2).assertEqual(1);
      const step3: NewsItem | undefined = subject.getData(150);
      logInfo(`step3 getData(150): step3=${step3}`);
      expect(step3).assertUndefined();
      subject.clear();
      logInfo(`${BUNDLE}NewsSourceModelFlow_0045 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_NEWS_SOURCE_MODEL_FLOW_0046
     * @tc.name      PullToRefresh_NewsSourceModelFlow_0046
     * @tc.desc      NewsSourceModel call flow addNotifications > ids > addData > addNotifications keeps state consis...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_NewsSourceModelFlow_0046', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}NewsSourceModelFlow_0046 begin`);
      const subject: NewsSourceModel = new NewsSourceModel();
      const step1: number[] = subject.addNotifications();
      logInfo(`step1 addNotifications(): step1.length=${step1.length}`);
      expect(step1.length).assertEqual(0);
      const step2: string[] = subject.ids();
      logInfo(`step2 ids(): step2.length=${step2.length}`);
      expect(step2.length).assertEqual(0);
      subject.addData(95, new NewsItem('', 'Hello', 'Hello', ''));
      const step4: number[] = subject.addNotifications();
      logInfo(`step4 addNotifications(): step4.length=${step4.length}`);
      expect(step4.length).assertEqual(1);
      logInfo(`step4 addNotifications(): JSON.stringify(step4)=${JSON.stringify(step4)}`);
      expect(JSON.stringify(step4)).assertEqual('[95]');
      logInfo(`${BUNDLE}NewsSourceModelFlow_0046 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_NEWS_SOURCE_MODEL_FLOW_0047
     * @tc.name      PullToRefresh_NewsSourceModelFlow_0047
     * @tc.desc      NewsSourceModel call flow clear > addNotifications > getData > addData > getData keeps state con...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_NewsSourceModelFlow_0047', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}NewsSourceModelFlow_0047 begin`);
      const subject: NewsSourceModel = new NewsSourceModel();
      subject.clear();
      const step2: number[] = subject.addNotifications();
      logInfo(`step2 addNotifications(): step2.length=${step2.length}`);
      expect(step2.length).assertEqual(0);
      const step3: NewsItem | undefined = subject.getData(63.85);
      logInfo(`step3 getData(63.85): step3=${step3}`);
      expect(step3).assertUndefined();
      subject.addData(85, new NewsItem('', 'Hello', 'Hello', ''));
      const step5: NewsItem | undefined = subject.getData(173);
      logInfo(`step5 getData(173): step5=${step5}`);
      expect(step5).assertUndefined();
      logInfo(`${BUNDLE}NewsSourceModelFlow_0047 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_NEWS_SOURCE_MODEL_FLOW_0048
     * @tc.name      PullToRefresh_NewsSourceModelFlow_0048
     * @tc.desc      NewsSourceModel call flow addData > getData > addData > pushData > ids keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_NewsSourceModelFlow_0048', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}NewsSourceModelFlow_0048 begin`);
      const subject: NewsSourceModel = new NewsSourceModel();
      subject.addData(15, new NewsItem('a', 'Hello', 'Hello', ''));
      const step2: NewsItem | undefined = subject.getData(11.39);
      logInfo(`step2 getData(11.39): step2=${step2}`);
      expect(step2).assertUndefined();
      subject.addData(40, new NewsItem('Hello World', 'Hello', 'Hello', ''));
      subject.pushData(new NewsItem('abc', 'Hello', 'Hello', ''));
      const step5: string[] = subject.ids();
      logInfo(`step5 ids(): step5.length=${step5.length}`);
      expect(step5.length).assertEqual(3);
      logInfo(`step5 ids(): JSON.stringify(step5)=${JSON.stringify(step5)}`);
      expect(JSON.stringify(step5)).assertEqual('["a","Hello World","abc"]');
      logInfo(`${BUNDLE}NewsSourceModelFlow_0048 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_NEWS_SOURCE_MODEL_FLOW_0049
     * @tc.name      PullToRefresh_NewsSourceModelFlow_0049
     * @tc.desc      NewsSourceModel call flow pushData > addNotifications > clear > clear > totalCount keeps state c...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_NewsSourceModelFlow_0049', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}NewsSourceModelFlow_0049 begin`);
      const subject: NewsSourceModel = new NewsSourceModel();
      subject.pushData(new NewsItem('abc', 'Hello', 'Hello', ''));
      const step2: number[] = subject.addNotifications();
      logInfo(`step2 addNotifications(): step2.length=${step2.length}`);
      expect(step2.length).assertEqual(1);
      logInfo(`step2 addNotifications(): JSON.stringify(step2)=${JSON.stringify(step2)}`);
      expect(JSON.stringify(step2)).assertEqual('[0]');
      subject.clear();
      subject.clear();
      const step5: number = subject.totalCount();
      logInfo(`step5 totalCount(): step5=${step5}`);
      expect(step5).assertEqual(0);
      logInfo(`${BUNDLE}NewsSourceModelFlow_0049 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_NEWS_SOURCE_MODEL_FLOW_0050
     * @tc.name      PullToRefresh_NewsSourceModelFlow_0050
     * @tc.desc      NewsSourceModel call flow addNotifications > clear > addNotifications > addNotifications keeps s...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_NewsSourceModelFlow_0050', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}NewsSourceModelFlow_0050 begin`);
      const subject: NewsSourceModel = new NewsSourceModel();
      const step1: number[] = subject.addNotifications();
      logInfo(`step1 addNotifications(): step1.length=${step1.length}`);
      expect(step1.length).assertEqual(0);
      subject.clear();
      const step3: number[] = subject.addNotifications();
      logInfo(`step3 addNotifications(): step3.length=${step3.length}`);
      expect(step3.length).assertEqual(0);
      const step4: number[] = subject.addNotifications();
      logInfo(`step4 addNotifications(): step4.length=${step4.length}`);
      expect(step4.length).assertEqual(0);
      logInfo(`${BUNDLE}NewsSourceModelFlow_0050 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_NEWS_SOURCE_MODEL_FLOW_0051
     * @tc.name      PullToRefresh_NewsSourceModelFlow_0051
     * @tc.desc      NewsSourceModel call flow addData > getData > addData > getData > totalCount keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_NewsSourceModelFlow_0051', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}NewsSourceModelFlow_0051 begin`);
      const subject: NewsSourceModel = new NewsSourceModel();
      subject.addData(35, new NewsItem('abc', 'Hello', 'Hello', ''));
      const step2: NewsItem | undefined = subject.getData(-80);
      logInfo(`step2 getData(-80): step2=${step2}`);
      expect(step2).assertUndefined();
      subject.addData(25, new NewsItem('abc', 'Hello', 'Hello', ''));
      const step4: NewsItem | undefined = subject.getData(60);
      logInfo(`step4 getData(60): step4=${step4}`);
      expect(step4).assertUndefined();
      const step5: number = subject.totalCount();
      logInfo(`step5 totalCount(): step5=${step5}`);
      expect(step5).assertEqual(2);
      logInfo(`${BUNDLE}NewsSourceModelFlow_0051 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_NEWS_SOURCE_MODEL_FLOW_0052
     * @tc.name      PullToRefresh_NewsSourceModelFlow_0052
     * @tc.desc      NewsSourceModel call flow addNotifications > addData > ids > addData keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_NewsSourceModelFlow_0052', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}NewsSourceModelFlow_0052 begin`);
      const subject: NewsSourceModel = new NewsSourceModel();
      const step1: number[] = subject.addNotifications();
      logInfo(`step1 addNotifications(): step1.length=${step1.length}`);
      expect(step1.length).assertEqual(0);
      subject.addData(40, new NewsItem('a', 'Hello', 'Hello', ''));
      const step3: string[] = subject.ids();
      logInfo(`step3 ids(): step3.length=${step3.length}`);
      expect(step3.length).assertEqual(1);
      logInfo(`step3 ids(): JSON.stringify(step3)=${JSON.stringify(step3)}`);
      expect(JSON.stringify(step3)).assertEqual('["a"]');
      subject.addData(15, new NewsItem('abc', 'Hello', 'Hello', ''));
      logInfo(`${BUNDLE}NewsSourceModelFlow_0052 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_NEWS_SOURCE_MODEL_FLOW_0053
     * @tc.name      PullToRefresh_NewsSourceModelFlow_0053
     * @tc.desc      NewsSourceModel call flow ids > ids > getData > addData > totalCount keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_NewsSourceModelFlow_0053', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}NewsSourceModelFlow_0053 begin`);
      const subject: NewsSourceModel = new NewsSourceModel();
      const step1: string[] = subject.ids();
      logInfo(`step1 ids(): step1.length=${step1.length}`);
      expect(step1.length).assertEqual(0);
      const step2: string[] = subject.ids();
      logInfo(`step2 ids(): step2.length=${step2.length}`);
      expect(step2.length).assertEqual(0);
      const step3: NewsItem | undefined = subject.getData(160);
      logInfo(`step3 getData(160): step3=${step3}`);
      expect(step3).assertUndefined();
      subject.addData(55, new NewsItem('a', 'Hello', 'Hello', ''));
      const step5: number = subject.totalCount();
      logInfo(`step5 totalCount(): step5=${step5}`);
      expect(step5).assertEqual(1);
      logInfo(`${BUNDLE}NewsSourceModelFlow_0053 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_NEWS_SOURCE_MODEL_FLOW_0054
     * @tc.name      PullToRefresh_NewsSourceModelFlow_0054
     * @tc.desc      NewsSourceModel call flow ids > getData > totalCount keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_NewsSourceModelFlow_0054', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}NewsSourceModelFlow_0054 begin`);
      const subject: NewsSourceModel = new NewsSourceModel();
      const step1: string[] = subject.ids();
      logInfo(`step1 ids(): step1.length=${step1.length}`);
      expect(step1.length).assertEqual(0);
      const step2: NewsItem | undefined = subject.getData(94);
      logInfo(`step2 getData(94): step2=${step2}`);
      expect(step2).assertUndefined();
      const step3: number = subject.totalCount();
      logInfo(`step3 totalCount(): step3=${step3}`);
      expect(step3).assertEqual(0);
      logInfo(`${BUNDLE}NewsSourceModelFlow_0054 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_NEWS_SOURCE_MODEL_FLOW_0055
     * @tc.name      PullToRefresh_NewsSourceModelFlow_0055
     * @tc.desc      NewsSourceModel call flow ids > totalCount > pushData keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_NewsSourceModelFlow_0055', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}NewsSourceModelFlow_0055 begin`);
      const subject: NewsSourceModel = new NewsSourceModel();
      const step1: string[] = subject.ids();
      logInfo(`step1 ids(): step1.length=${step1.length}`);
      expect(step1.length).assertEqual(0);
      const step2: number = subject.totalCount();
      logInfo(`step2 totalCount(): step2=${step2}`);
      expect(step2).assertEqual(0);
      subject.pushData(new NewsItem('', 'Hello', 'Hello', ''));
      logInfo(`${BUNDLE}NewsSourceModelFlow_0055 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_NEWS_SOURCE_MODEL_FLOW_0056
     * @tc.name      PullToRefresh_NewsSourceModelFlow_0056
     * @tc.desc      NewsSourceModel call flow getData > addNotifications > ids > totalCount > addData keeps state co...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_NewsSourceModelFlow_0056', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}NewsSourceModelFlow_0056 begin`);
      const subject: NewsSourceModel = new NewsSourceModel();
      const step1: NewsItem | undefined = subject.getData(63.85);
      logInfo(`step1 getData(63.85): step1=${step1}`);
      expect(step1).assertUndefined();
      const step2: number[] = subject.addNotifications();
      logInfo(`step2 addNotifications(): step2.length=${step2.length}`);
      expect(step2.length).assertEqual(0);
      const step3: string[] = subject.ids();
      logInfo(`step3 ids(): step3.length=${step3.length}`);
      expect(step3.length).assertEqual(0);
      const step4: number = subject.totalCount();
      logInfo(`step4 totalCount(): step4=${step4}`);
      expect(step4).assertEqual(0);
      subject.addData(105, new NewsItem('', 'Hello', 'Hello', ''));
      logInfo(`${BUNDLE}NewsSourceModelFlow_0056 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_NEWS_SOURCE_MODEL_FLOW_0057
     * @tc.name      PullToRefresh_NewsSourceModelFlow_0057
     * @tc.desc      NewsSourceModel call flow pushData > clear > addData > totalCount keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_NewsSourceModelFlow_0057', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}NewsSourceModelFlow_0057 begin`);
      const subject: NewsSourceModel = new NewsSourceModel();
      subject.pushData(new NewsItem('a', 'Hello', 'Hello', ''));
      subject.clear();
      subject.addData(-1, new NewsItem('', 'Hello', 'Hello', ''));
      const step4: number = subject.totalCount();
      logInfo(`step4 totalCount(): step4=${step4}`);
      expect(step4).assertEqual(1);
      logInfo(`${BUNDLE}NewsSourceModelFlow_0057 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_NEWS_SOURCE_MODEL_FLOW_0058
     * @tc.name      PullToRefresh_NewsSourceModelFlow_0058
     * @tc.desc      NewsSourceModel call flow addNotifications > pushData > addData > getData keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_NewsSourceModelFlow_0058', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}NewsSourceModelFlow_0058 begin`);
      const subject: NewsSourceModel = new NewsSourceModel();
      const step1: number[] = subject.addNotifications();
      logInfo(`step1 addNotifications(): step1.length=${step1.length}`);
      expect(step1.length).assertEqual(0);
      subject.pushData(new NewsItem('', 'Hello', 'Hello', ''));
      subject.addData(30, new NewsItem('', 'Hello', 'Hello', ''));
      const step4: NewsItem | undefined = subject.getData(188);
      logInfo(`step4 getData(188): step4=${step4}`);
      expect(step4).assertUndefined();
      logInfo(`${BUNDLE}NewsSourceModelFlow_0058 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_NEWS_SOURCE_MODEL_FLOW_0059
     * @tc.name      PullToRefresh_NewsSourceModelFlow_0059
     * @tc.desc      NewsSourceModel call flow getData > addNotifications > addNotifications > clear > totalCount kee...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_NewsSourceModelFlow_0059', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}NewsSourceModelFlow_0059 begin`);
      const subject: NewsSourceModel = new NewsSourceModel();
      const step1: NewsItem | undefined = subject.getData(20);
      logInfo(`step1 getData(20): step1=${step1}`);
      expect(step1).assertUndefined();
      const step2: number[] = subject.addNotifications();
      logInfo(`step2 addNotifications(): step2.length=${step2.length}`);
      expect(step2.length).assertEqual(0);
      const step3: number[] = subject.addNotifications();
      logInfo(`step3 addNotifications(): step3.length=${step3.length}`);
      expect(step3.length).assertEqual(0);
      subject.clear();
      const step5: number = subject.totalCount();
      logInfo(`step5 totalCount(): step5=${step5}`);
      expect(step5).assertEqual(0);
      logInfo(`${BUNDLE}NewsSourceModelFlow_0059 end`);
    });
  });
}
