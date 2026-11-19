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
import { NewsPageModel } from '../model/PullRefreshLogic';

const DOMAIN: number = 0xF811;
const TAG: string = '[Sample_PullToRefresh]';
const BUNDLE: string = 'PullToRefresh_';
const PRECISION: number = 0.000001;

function logInfo(message: string): void {
  hilog.info(DOMAIN, TAG, '%{public}s', message);
}

/** Logic checks for NewsPageModel flow (58 cases). */
export default function newsPageModelFlowTest(): void {
  describe('NewsPageModelFlowTest', (): void => {
    /**
     * @tc.number    SUB_PULLTOREFRESH_NEWS_PAGE_MODEL_FLOW_0001
     * @tc.name      PullToRefresh_NewsPageModelFlow_0001
     * @tc.desc      NewsPageModel call flow footer > onLoadMore > firstId > onRefresh keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('PullToRefresh_NewsPageModelFlow_0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}NewsPageModelFlow_0001 begin`);
      const subject: NewsPageModel = new NewsPageModel();
      const step1: string = subject.footer();
      logInfo(`step1 footer(): step1=${step1}`);
      expect(step1).assertEqual('up:');
      const step2: boolean = subject.onLoadMore();
      logInfo(`step2 onLoadMore(): step2=${step2}`);
      expect(step2).assertTrue();
      const step3: string = subject.firstId();
      logInfo(`step3 firstId(): step3=${step3}`);
      expect(step3).assertEqual('1');
      const step4: string = subject.onRefresh();
      logInfo(`step4 onRefresh(): step4=${step4}`);
      expect(step4).assertEqual('\u5237\u65b0\u5f53\u524d\u6570\u636e\u6210\u529f');
      logInfo(`${BUNDLE}NewsPageModelFlow_0001 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_NEWS_PAGE_MODEL_FLOW_0002
     * @tc.name      PullToRefresh_NewsPageModelFlow_0002
     * @tc.desc      NewsPageModel call flow page > tip > angles > tip > angles keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('PullToRefresh_NewsPageModelFlow_0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}NewsPageModelFlow_0002 begin`);
      const subject: NewsPageModel = new NewsPageModel();
      const step1: number = subject.page();
      logInfo(`step1 page(): step1=${step1}`);
      expect(step1).assertEqual(0);
      const step2: string = subject.tip();
      logInfo(`step2 tip(): step2=${step2}`);
      expect(step2).assertEqual('\u91ca\u653e\u5237\u65b0\u5f53\u524d\u9875\u9762\u6570\u636e');
      const step3: string = subject.angles();
      logInfo(`step3 angles(): step3=${step3}`);
      expect(step3).assertEqual('0/0');
      const step4: string = subject.tip();
      logInfo(`step4 tip(): step4=${step4}`);
      expect(step4).assertEqual('\u91ca\u653e\u5237\u65b0\u5f53\u524d\u9875\u9762\u6570\u636e');
      const step5: string = subject.angles();
      logInfo(`step5 angles(): step5=${step5}`);
      expect(step5).assertEqual('0/0');
      logInfo(`${BUNDLE}NewsPageModelFlow_0002 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_NEWS_PAGE_MODEL_FLOW_0003
     * @tc.name      PullToRefresh_NewsPageModelFlow_0003
     * @tc.desc      NewsPageModel call flow onRefresh > listIndex > onAnimLoading keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_NewsPageModelFlow_0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}NewsPageModelFlow_0003 begin`);
      const subject: NewsPageModel = new NewsPageModel();
      const step1: string = subject.onRefresh();
      logInfo(`step1 onRefresh(): step1=${step1}`);
      expect(step1).assertEqual('\u5237\u65b0\u5f53\u524d\u6570\u636e\u6210\u529f');
      const step2: number = subject.listIndex();
      logInfo(`step2 listIndex(): step2=${step2}`);
      expect(step2).assertEqual(1);
      subject.onAnimLoading(931);
      logInfo(`${BUNDLE}NewsPageModelFlow_0003 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_NEWS_PAGE_MODEL_FLOW_0004
     * @tc.name      PullToRefresh_NewsPageModelFlow_0004
     * @tc.desc      NewsPageModel call flow firstId > aboutToDisappear keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_NewsPageModelFlow_0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}NewsPageModelFlow_0004 begin`);
      const subject: NewsPageModel = new NewsPageModel();
      const step1: string = subject.firstId();
      logInfo(`step1 firstId(): step1=${step1}`);
      expect(step1).assertEqual('1');
      subject.aboutToDisappear();
      logInfo(`${BUNDLE}NewsPageModelFlow_0004 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_NEWS_PAGE_MODEL_FLOW_0005
     * @tc.name      PullToRefresh_NewsPageModelFlow_0005
     * @tc.desc      NewsPageModel call flow iconSize > onAnimLoading > iconSize > onAnimPullUp keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_NewsPageModelFlow_0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}NewsPageModelFlow_0005 begin`);
      const subject: NewsPageModel = new NewsPageModel();
      const step1: number = subject.iconSize(1248);
      logInfo(`step1 iconSize(1248): step1=${step1}`);
      expect(step1).assertEqual(1248);
      subject.onAnimLoading(300);
      const step3: number = subject.iconSize(2112);
      logInfo(`step3 iconSize(2112): step3=${step3}`);
      expect(step3).assertEqual(2112);
      subject.onAnimPullUp(99.62);
      logInfo(`${BUNDLE}NewsPageModelFlow_0005 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_NEWS_PAGE_MODEL_FLOW_0006
     * @tc.name      PullToRefresh_NewsPageModelFlow_0006
     * @tc.desc      NewsPageModel call flow footer > onAnimLoading > firstId > tip > onAnimPullDown keeps state cons...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_NewsPageModelFlow_0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}NewsPageModelFlow_0006 begin`);
      const subject: NewsPageModel = new NewsPageModel();
      const step1: string = subject.footer();
      logInfo(`step1 footer(): step1=${step1}`);
      expect(step1).assertEqual('up:');
      subject.onAnimLoading(-1);
      const step3: string = subject.firstId();
      logInfo(`step3 firstId(): step3=${step3}`);
      expect(step3).assertEqual('1');
      const step4: string = subject.tip();
      logInfo(`step4 tip(): step4=${step4}`);
      expect(step4).assertEqual('\u91ca\u653e\u5237\u65b0\u5f53\u524d\u9875\u9762\u6570\u636e');
      subject.onAnimPullDown(-62);
      logInfo(`${BUNDLE}NewsPageModelFlow_0006 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_NEWS_PAGE_MODEL_FLOW_0007
     * @tc.name      PullToRefresh_NewsPageModelFlow_0007
     * @tc.desc      NewsPageModel call flow aboutToDisappear > listIndex > footer keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_NewsPageModelFlow_0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}NewsPageModelFlow_0007 begin`);
      const subject: NewsPageModel = new NewsPageModel();
      subject.aboutToDisappear();
      const step2: number = subject.listIndex();
      logInfo(`step2 listIndex(): step2=${step2}`);
      expect(step2).assertEqual(1);
      const step3: string = subject.footer();
      logInfo(`step3 footer(): step3=${step3}`);
      expect(step3).assertEqual('up:');
      logInfo(`${BUNDLE}NewsPageModelFlow_0007 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_NEWS_PAGE_MODEL_FLOW_0008
     * @tc.name      PullToRefresh_NewsPageModelFlow_0008
     * @tc.desc      NewsPageModel call flow onAnimPullDown > angles > tip > footer > iconSize keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_NewsPageModelFlow_0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}NewsPageModelFlow_0008 begin`);
      const subject: NewsPageModel = new NewsPageModel();
      subject.onAnimPullDown(26);
      const step2: string = subject.angles();
      logInfo(`step2 angles(): step2=${step2}`);
      expect(step2).assertEqual('0/0');
      const step3: string = subject.tip();
      logInfo(`step3 tip(): step3=${step3}`);
      expect(step3).assertEqual('\u91ca\u653e\u66f4\u65b0\u4e0b\u9875\u6570\u636e');
      const step4: string = subject.footer();
      logInfo(`step4 footer(): step4=${step4}`);
      expect(step4).assertEqual('up:');
      const step5: number = subject.iconSize(1179.81);
      logInfo(`step5 iconSize(1179.81): step5=${step5}`);
      expect(step5).assertClose(1179.81, PRECISION);
      logInfo(`${BUNDLE}NewsPageModelFlow_0008 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_NEWS_PAGE_MODEL_FLOW_0009
     * @tc.name      PullToRefresh_NewsPageModelFlow_0009
     * @tc.desc      NewsPageModel call flow onAnimPullUp > newsCount > iconSize keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_NewsPageModelFlow_0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}NewsPageModelFlow_0009 begin`);
      const subject: NewsPageModel = new NewsPageModel();
      subject.onAnimPullUp(51.93);
      const step2: number = subject.newsCount();
      logInfo(`step2 newsCount(): step2=${step2}`);
      expect(step2).assertEqual(8);
      const step3: number = subject.iconSize(757);
      logInfo(`step3 iconSize(757): step3=${step3}`);
      expect(step3).assertEqual(757);
      logInfo(`${BUNDLE}NewsPageModelFlow_0009 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_NEWS_PAGE_MODEL_FLOW_0010
     * @tc.name      PullToRefresh_NewsPageModelFlow_0010
     * @tc.desc      NewsPageModel call flow onAnimPullUp > page keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_NewsPageModelFlow_0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}NewsPageModelFlow_0010 begin`);
      const subject: NewsPageModel = new NewsPageModel();
      subject.onAnimPullUp(172);
      const step2: number = subject.page();
      logInfo(`step2 page(): step2=${step2}`);
      expect(step2).assertEqual(0);
      logInfo(`${BUNDLE}NewsPageModelFlow_0010 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_NEWS_PAGE_MODEL_FLOW_0011
     * @tc.name      PullToRefresh_NewsPageModelFlow_0011
     * @tc.desc      NewsPageModel call flow firstId > onAnimPullUp > onRefresh > onAnimLoading > firstId keeps state...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_NewsPageModelFlow_0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}NewsPageModelFlow_0011 begin`);
      const subject: NewsPageModel = new NewsPageModel();
      const step1: string = subject.firstId();
      logInfo(`step1 firstId(): step1=${step1}`);
      expect(step1).assertEqual('1');
      subject.onAnimPullUp(55);
      const step3: string = subject.onRefresh();
      logInfo(`step3 onRefresh(): step3=${step3}`);
      expect(step3).assertEqual('\u5237\u65b0\u5f53\u524d\u6570\u636e\u6210\u529f');
      subject.onAnimLoading(-134);
      const step5: string = subject.firstId();
      logInfo(`step5 firstId(): step5=${step5}`);
      expect(step5).assertEqual('1');
      logInfo(`${BUNDLE}NewsPageModelFlow_0011 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_NEWS_PAGE_MODEL_FLOW_0012
     * @tc.name      PullToRefresh_NewsPageModelFlow_0012
     * @tc.desc      NewsPageModel call flow footer > listIndex > onAnimLoading > onRefresh keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_NewsPageModelFlow_0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}NewsPageModelFlow_0012 begin`);
      const subject: NewsPageModel = new NewsPageModel();
      const step1: string = subject.footer();
      logInfo(`step1 footer(): step1=${step1}`);
      expect(step1).assertEqual('up:');
      const step2: number = subject.listIndex();
      logInfo(`step2 listIndex(): step2=${step2}`);
      expect(step2).assertEqual(1);
      subject.onAnimLoading(1260);
      const step4: string = subject.onRefresh();
      logInfo(`step4 onRefresh(): step4=${step4}`);
      expect(step4).assertEqual('\u5237\u65b0\u5f53\u524d\u6570\u636e\u6210\u529f');
      logInfo(`${BUNDLE}NewsPageModelFlow_0012 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_NEWS_PAGE_MODEL_FLOW_0013
     * @tc.name      PullToRefresh_NewsPageModelFlow_0013
     * @tc.desc      NewsPageModel call flow onLoadMore > firstId > aboutToDisappear keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_NewsPageModelFlow_0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}NewsPageModelFlow_0013 begin`);
      const subject: NewsPageModel = new NewsPageModel();
      const step1: boolean = subject.onLoadMore();
      logInfo(`step1 onLoadMore(): step1=${step1}`);
      expect(step1).assertTrue();
      const step2: string = subject.firstId();
      logInfo(`step2 firstId(): step2=${step2}`);
      expect(step2).assertEqual('1');
      subject.aboutToDisappear();
      logInfo(`${BUNDLE}NewsPageModelFlow_0013 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_NEWS_PAGE_MODEL_FLOW_0014
     * @tc.name      PullToRefresh_NewsPageModelFlow_0014
     * @tc.desc      NewsPageModel call flow page > onRefresh > tip keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_NewsPageModelFlow_0014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}NewsPageModelFlow_0014 begin`);
      const subject: NewsPageModel = new NewsPageModel();
      const step1: number = subject.page();
      logInfo(`step1 page(): step1=${step1}`);
      expect(step1).assertEqual(0);
      const step2: string = subject.onRefresh();
      logInfo(`step2 onRefresh(): step2=${step2}`);
      expect(step2).assertEqual('\u5237\u65b0\u5f53\u524d\u6570\u636e\u6210\u529f');
      const step3: string = subject.tip();
      logInfo(`step3 tip(): step3=${step3}`);
      expect(step3).assertEqual('\u91ca\u653e\u5237\u65b0\u5f53\u524d\u9875\u9762\u6570\u636e');
      logInfo(`${BUNDLE}NewsPageModelFlow_0014 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_NEWS_PAGE_MODEL_FLOW_0015
     * @tc.name      PullToRefresh_NewsPageModelFlow_0015
     * @tc.desc      NewsPageModel call flow onAnimPullUp > angles > page > onAnimRefreshing > tip keeps state consis...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_NewsPageModelFlow_0015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}NewsPageModelFlow_0015 begin`);
      const subject: NewsPageModel = new NewsPageModel();
      subject.onAnimPullUp(11.76);
      const step2: string = subject.angles();
      logInfo(`step2 angles(): step2=${step2}`);
      expect(step2).assertEqual('180/0');
      const step3: number = subject.page();
      logInfo(`step3 page(): step3=${step3}`);
      expect(step3).assertEqual(0);
      subject.onAnimRefreshing(710.3);
      const step5: string = subject.tip();
      logInfo(`step5 tip(): step5=${step5}`);
      expect(step5).assertEqual('\u91ca\u653e\u5237\u65b0\u5f53\u524d\u9875\u9762\u6570\u636e');
      logInfo(`${BUNDLE}NewsPageModelFlow_0015 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_NEWS_PAGE_MODEL_FLOW_0016
     * @tc.name      PullToRefresh_NewsPageModelFlow_0016
     * @tc.desc      NewsPageModel call flow page > onAnimPullDown > footer > onRefresh keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_NewsPageModelFlow_0016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}NewsPageModelFlow_0016 begin`);
      const subject: NewsPageModel = new NewsPageModel();
      const step1: number = subject.page();
      logInfo(`step1 page(): step1=${step1}`);
      expect(step1).assertEqual(0);
      subject.onAnimPullDown(195);
      const step3: string = subject.footer();
      logInfo(`step3 footer(): step3=${step3}`);
      expect(step3).assertEqual('up:');
      const step4: string = subject.onRefresh();
      logInfo(`step4 onRefresh(): step4=${step4}`);
      expect(step4).assertEqual('\u5237\u65b0\u5f53\u524d\u6570\u636e\u6210\u529f');
      logInfo(`${BUNDLE}NewsPageModelFlow_0016 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_NEWS_PAGE_MODEL_FLOW_0017
     * @tc.name      PullToRefresh_NewsPageModelFlow_0017
     * @tc.desc      NewsPageModel call flow newsCount > onAnimPullDown > footer > onAnimRefreshing > tip keeps state...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_NewsPageModelFlow_0017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}NewsPageModelFlow_0017 begin`);
      const subject: NewsPageModel = new NewsPageModel();
      const step1: number = subject.newsCount();
      logInfo(`step1 newsCount(): step1=${step1}`);
      expect(step1).assertEqual(8);
      subject.onAnimPullDown(8.09);
      const step3: string = subject.footer();
      logInfo(`step3 footer(): step3=${step3}`);
      expect(step3).assertEqual('up:');
      subject.onAnimRefreshing(513.35);
      const step5: string = subject.tip();
      logInfo(`step5 tip(): step5=${step5}`);
      expect(step5).assertEqual('\u91ca\u653e\u66f4\u65b0\u4e0b\u9875\u6570\u636e');
      logInfo(`${BUNDLE}NewsPageModelFlow_0017 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_NEWS_PAGE_MODEL_FLOW_0018
     * @tc.name      PullToRefresh_NewsPageModelFlow_0018
     * @tc.desc      NewsPageModel call flow onLoadMore > onLoadMore > iconSize > onAnimPullUp > onAnimPullDown keeps...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_NewsPageModelFlow_0018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}NewsPageModelFlow_0018 begin`);
      const subject: NewsPageModel = new NewsPageModel();
      const step1: boolean = subject.onLoadMore();
      logInfo(`step1 onLoadMore(): step1=${step1}`);
      expect(step1).assertTrue();
      const step2: boolean = subject.onLoadMore();
      logInfo(`step2 onLoadMore(): step2=${step2}`);
      expect(step2).assertTrue();
      const step3: number = subject.iconSize(2880);
      logInfo(`step3 iconSize(2880): step3=${step3}`);
      expect(step3).assertEqual(2880);
      subject.onAnimPullUp(90);
      subject.onAnimPullDown(38);
      logInfo(`${BUNDLE}NewsPageModelFlow_0018 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_NEWS_PAGE_MODEL_FLOW_0019
     * @tc.name      PullToRefresh_NewsPageModelFlow_0019
     * @tc.desc      NewsPageModel call flow newsCount > angles > newsCount > page keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_NewsPageModelFlow_0019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}NewsPageModelFlow_0019 begin`);
      const subject: NewsPageModel = new NewsPageModel();
      const step1: number = subject.newsCount();
      logInfo(`step1 newsCount(): step1=${step1}`);
      expect(step1).assertEqual(8);
      const step2: string = subject.angles();
      logInfo(`step2 angles(): step2=${step2}`);
      expect(step2).assertEqual('0/0');
      const step3: number = subject.newsCount();
      logInfo(`step3 newsCount(): step3=${step3}`);
      expect(step3).assertEqual(8);
      const step4: number = subject.page();
      logInfo(`step4 page(): step4=${step4}`);
      expect(step4).assertEqual(0);
      logInfo(`${BUNDLE}NewsPageModelFlow_0019 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_NEWS_PAGE_MODEL_FLOW_0020
     * @tc.name      PullToRefresh_NewsPageModelFlow_0020
     * @tc.desc      NewsPageModel call flow firstId > aboutToDisappear > angles > onAnimLoading keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_NewsPageModelFlow_0020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}NewsPageModelFlow_0020 begin`);
      const subject: NewsPageModel = new NewsPageModel();
      const step1: string = subject.firstId();
      logInfo(`step1 firstId(): step1=${step1}`);
      expect(step1).assertEqual('1');
      subject.aboutToDisappear();
      const step3: string = subject.angles();
      logInfo(`step3 angles(): step3=${step3}`);
      expect(step3).assertEqual('0/0');
      subject.onAnimLoading(26);
      logInfo(`${BUNDLE}NewsPageModelFlow_0020 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_NEWS_PAGE_MODEL_FLOW_0021
     * @tc.name      PullToRefresh_NewsPageModelFlow_0021
     * @tc.desc      NewsPageModel call flow iconSize > footer > firstId > firstId keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_NewsPageModelFlow_0021', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}NewsPageModelFlow_0021 begin`);
      const subject: NewsPageModel = new NewsPageModel();
      const step1: number = subject.iconSize(523);
      logInfo(`step1 iconSize(523): step1=${step1}`);
      expect(step1).assertEqual(523);
      const step2: string = subject.footer();
      logInfo(`step2 footer(): step2=${step2}`);
      expect(step2).assertEqual('up:');
      const step3: string = subject.firstId();
      logInfo(`step3 firstId(): step3=${step3}`);
      expect(step3).assertEqual('1');
      const step4: string = subject.firstId();
      logInfo(`step4 firstId(): step4=${step4}`);
      expect(step4).assertEqual('1');
      logInfo(`${BUNDLE}NewsPageModelFlow_0021 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_NEWS_PAGE_MODEL_FLOW_0022
     * @tc.name      PullToRefresh_NewsPageModelFlow_0022
     * @tc.desc      NewsPageModel call flow onAnimPullDown > tip > iconSize > iconSize keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_NewsPageModelFlow_0022', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}NewsPageModelFlow_0022 begin`);
      const subject: NewsPageModel = new NewsPageModel();
      subject.onAnimPullDown(-87);
      const step2: string = subject.tip();
      logInfo(`step2 tip(): step2=${step2}`);
      expect(step2).assertEqual('\u91ca\u653e\u5237\u65b0\u5f53\u524d\u9875\u9762\u6570\u636e');
      const step3: number = subject.iconSize(2496);
      logInfo(`step3 iconSize(2496): step3=${step3}`);
      expect(step3).assertEqual(2496);
      const step4: number = subject.iconSize(1440);
      logInfo(`step4 iconSize(1440): step4=${step4}`);
      expect(step4).assertEqual(1440);
      logInfo(`${BUNDLE}NewsPageModelFlow_0022 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_NEWS_PAGE_MODEL_FLOW_0023
     * @tc.name      PullToRefresh_NewsPageModelFlow_0023
     * @tc.desc      NewsPageModel call flow onLoadMore > footer > onAnimPullUp > onRefresh > changesPage keeps state...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_NewsPageModelFlow_0023', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}NewsPageModelFlow_0023 begin`);
      const subject: NewsPageModel = new NewsPageModel();
      const step1: boolean = subject.onLoadMore();
      logInfo(`step1 onLoadMore(): step1=${step1}`);
      expect(step1).assertTrue();
      const step2: string = subject.footer();
      logInfo(`step2 footer(): step2=${step2}`);
      expect(step2).assertEqual('up:');
      subject.onAnimPullUp(92);
      const step4: string = subject.onRefresh();
      logInfo(`step4 onRefresh(): step4=${step4}`);
      expect(step4).assertEqual('\u5237\u65b0\u5f53\u524d\u6570\u636e\u6210\u529f');
      const step5: boolean = subject.changesPage();
      logInfo(`step5 changesPage(): step5=${step5}`);
      expect(step5).assertFalse();
      logInfo(`${BUNDLE}NewsPageModelFlow_0023 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_NEWS_PAGE_MODEL_FLOW_0024
     * @tc.name      PullToRefresh_NewsPageModelFlow_0024
     * @tc.desc      NewsPageModel call flow changesPage > aboutToDisappear keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_NewsPageModelFlow_0024', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}NewsPageModelFlow_0024 begin`);
      const subject: NewsPageModel = new NewsPageModel();
      const step1: boolean = subject.changesPage();
      logInfo(`step1 changesPage(): step1=${step1}`);
      expect(step1).assertFalse();
      subject.aboutToDisappear();
      logInfo(`${BUNDLE}NewsPageModelFlow_0024 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_NEWS_PAGE_MODEL_FLOW_0025
     * @tc.name      PullToRefresh_NewsPageModelFlow_0025
     * @tc.desc      NewsPageModel call flow aboutToDisappear > onRefresh > iconSize > footer keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_NewsPageModelFlow_0025', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}NewsPageModelFlow_0025 begin`);
      const subject: NewsPageModel = new NewsPageModel();
      subject.aboutToDisappear();
      const step2: string = subject.onRefresh();
      logInfo(`step2 onRefresh(): step2=${step2}`);
      expect(step2).assertEqual('\u5237\u65b0\u5f53\u524d\u6570\u636e\u6210\u529f');
      const step3: number = subject.iconSize(-1203);
      logInfo(`step3 iconSize(-1203): step3=${step3}`);
      expect(step3).assertEqual(-1203);
      const step4: string = subject.footer();
      logInfo(`step4 footer(): step4=${step4}`);
      expect(step4).assertEqual('up:');
      logInfo(`${BUNDLE}NewsPageModelFlow_0025 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_NEWS_PAGE_MODEL_FLOW_0026
     * @tc.name      PullToRefresh_NewsPageModelFlow_0026
     * @tc.desc      NewsPageModel call flow tip > iconSize keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_NewsPageModelFlow_0026', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}NewsPageModelFlow_0026 begin`);
      const subject: NewsPageModel = new NewsPageModel();
      const step1: string = subject.tip();
      logInfo(`step1 tip(): step1=${step1}`);
      expect(step1).assertEqual('\u91ca\u653e\u5237\u65b0\u5f53\u524d\u9875\u9762\u6570\u636e');
      const step2: number = subject.iconSize(1152);
      logInfo(`step2 iconSize(1152): step2=${step2}`);
      expect(step2).assertEqual(1152);
      logInfo(`${BUNDLE}NewsPageModelFlow_0026 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_NEWS_PAGE_MODEL_FLOW_0027
     * @tc.name      PullToRefresh_NewsPageModelFlow_0027
     * @tc.desc      NewsPageModel call flow changesPage > changesPage > footer > tip keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_NewsPageModelFlow_0027', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}NewsPageModelFlow_0027 begin`);
      const subject: NewsPageModel = new NewsPageModel();
      const step1: boolean = subject.changesPage();
      logInfo(`step1 changesPage(): step1=${step1}`);
      expect(step1).assertFalse();
      const step2: boolean = subject.changesPage();
      logInfo(`step2 changesPage(): step2=${step2}`);
      expect(step2).assertFalse();
      const step3: string = subject.footer();
      logInfo(`step3 footer(): step3=${step3}`);
      expect(step3).assertEqual('up:');
      const step4: string = subject.tip();
      logInfo(`step4 tip(): step4=${step4}`);
      expect(step4).assertEqual('\u91ca\u653e\u5237\u65b0\u5f53\u524d\u9875\u9762\u6570\u636e');
      logInfo(`${BUNDLE}NewsPageModelFlow_0027 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_NEWS_PAGE_MODEL_FLOW_0028
     * @tc.name      PullToRefresh_NewsPageModelFlow_0028
     * @tc.desc      NewsPageModel call flow listIndex > onAnimLoading > onAnimRefreshing keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_NewsPageModelFlow_0028', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}NewsPageModelFlow_0028 begin`);
      const subject: NewsPageModel = new NewsPageModel();
      const step1: number = subject.listIndex();
      logInfo(`step1 listIndex(): step1=${step1}`);
      expect(step1).assertEqual(1);
      subject.onAnimLoading(-409);
      subject.onAnimRefreshing(330.69);
      logInfo(`${BUNDLE}NewsPageModelFlow_0028 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_NEWS_PAGE_MODEL_FLOW_0029
     * @tc.name      PullToRefresh_NewsPageModelFlow_0029
     * @tc.desc      NewsPageModel call flow changesPage > onAnimPullDown > listIndex keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_NewsPageModelFlow_0029', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}NewsPageModelFlow_0029 begin`);
      const subject: NewsPageModel = new NewsPageModel();
      const step1: boolean = subject.changesPage();
      logInfo(`step1 changesPage(): step1=${step1}`);
      expect(step1).assertFalse();
      subject.onAnimPullDown(145);
      const step3: number = subject.listIndex();
      logInfo(`step3 listIndex(): step3=${step3}`);
      expect(step3).assertEqual(1);
      logInfo(`${BUNDLE}NewsPageModelFlow_0029 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_NEWS_PAGE_MODEL_FLOW_0030
     * @tc.name      PullToRefresh_NewsPageModelFlow_0030
     * @tc.desc      NewsPageModel call flow onRefresh > onAnimLoading > newsCount keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_NewsPageModelFlow_0030', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}NewsPageModelFlow_0030 begin`);
      const subject: NewsPageModel = new NewsPageModel();
      const step1: string = subject.onRefresh();
      logInfo(`step1 onRefresh(): step1=${step1}`);
      expect(step1).assertEqual('\u5237\u65b0\u5f53\u524d\u6570\u636e\u6210\u529f');
      subject.onAnimLoading(268);
      const step3: number = subject.newsCount();
      logInfo(`step3 newsCount(): step3=${step3}`);
      expect(step3).assertEqual(8);
      logInfo(`${BUNDLE}NewsPageModelFlow_0030 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_NEWS_PAGE_MODEL_FLOW_0031
     * @tc.name      PullToRefresh_NewsPageModelFlow_0031
     * @tc.desc      NewsPageModel call flow onAnimPullUp > firstId > onAnimPullUp > newsCount > firstId keeps state ...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_NewsPageModelFlow_0031', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}NewsPageModelFlow_0031 begin`);
      const subject: NewsPageModel = new NewsPageModel();
      subject.onAnimPullUp(11.9);
      const step2: string = subject.firstId();
      logInfo(`step2 firstId(): step2=${step2}`);
      expect(step2).assertEqual('1');
      subject.onAnimPullUp(-25);
      const step4: number = subject.newsCount();
      logInfo(`step4 newsCount(): step4=${step4}`);
      expect(step4).assertEqual(8);
      const step5: string = subject.firstId();
      logInfo(`step5 firstId(): step5=${step5}`);
      expect(step5).assertEqual('1');
      logInfo(`${BUNDLE}NewsPageModelFlow_0031 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_NEWS_PAGE_MODEL_FLOW_0032
     * @tc.name      PullToRefresh_NewsPageModelFlow_0032
     * @tc.desc      NewsPageModel call flow iconSize > tip keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_NewsPageModelFlow_0032', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}NewsPageModelFlow_0032 begin`);
      const subject: NewsPageModel = new NewsPageModel();
      const step1: number = subject.iconSize(1591.54);
      logInfo(`step1 iconSize(1591.54): step1=${step1}`);
      expect(step1).assertClose(1591.54, PRECISION);
      const step2: string = subject.tip();
      logInfo(`step2 tip(): step2=${step2}`);
      expect(step2).assertEqual('\u91ca\u653e\u5237\u65b0\u5f53\u524d\u9875\u9762\u6570\u636e');
      logInfo(`${BUNDLE}NewsPageModelFlow_0032 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_NEWS_PAGE_MODEL_FLOW_0033
     * @tc.name      PullToRefresh_NewsPageModelFlow_0033
     * @tc.desc      NewsPageModel call flow page > listIndex > footer > aboutToDisappear > onAnimLoading keeps state...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_NewsPageModelFlow_0033', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}NewsPageModelFlow_0033 begin`);
      const subject: NewsPageModel = new NewsPageModel();
      const step1: number = subject.page();
      logInfo(`step1 page(): step1=${step1}`);
      expect(step1).assertEqual(0);
      const step2: number = subject.listIndex();
      logInfo(`step2 listIndex(): step2=${step2}`);
      expect(step2).assertEqual(1);
      const step3: string = subject.footer();
      logInfo(`step3 footer(): step3=${step3}`);
      expect(step3).assertEqual('up:');
      subject.aboutToDisappear();
      subject.onAnimLoading(541.62);
      logInfo(`${BUNDLE}NewsPageModelFlow_0033 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_NEWS_PAGE_MODEL_FLOW_0034
     * @tc.name      PullToRefresh_NewsPageModelFlow_0034
     * @tc.desc      NewsPageModel call flow footer > onAnimPullDown > footer keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_NewsPageModelFlow_0034', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}NewsPageModelFlow_0034 begin`);
      const subject: NewsPageModel = new NewsPageModel();
      const step1: string = subject.footer();
      logInfo(`step1 footer(): step1=${step1}`);
      expect(step1).assertEqual('up:');
      subject.onAnimPullDown(157);
      const step3: string = subject.footer();
      logInfo(`step3 footer(): step3=${step3}`);
      expect(step3).assertEqual('up:');
      logInfo(`${BUNDLE}NewsPageModelFlow_0034 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_NEWS_PAGE_MODEL_FLOW_0035
     * @tc.name      PullToRefresh_NewsPageModelFlow_0035
     * @tc.desc      NewsPageModel call flow onAnimLoading > onAnimRefreshing > onRefresh > tip keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_NewsPageModelFlow_0035', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}NewsPageModelFlow_0035 begin`);
      const subject: NewsPageModel = new NewsPageModel();
      subject.onAnimLoading(-509);
      subject.onAnimRefreshing(792);
      const step3: string = subject.onRefresh();
      logInfo(`step3 onRefresh(): step3=${step3}`);
      expect(step3).assertEqual('\u66f4\u65b0\u6570\u636e\u6210\u529f');
      const step4: string = subject.tip();
      logInfo(`step4 tip(): step4=${step4}`);
      expect(step4).assertEqual('\u91ca\u653e\u5237\u65b0\u5f53\u524d\u9875\u9762\u6570\u636e');
      logInfo(`${BUNDLE}NewsPageModelFlow_0035 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_NEWS_PAGE_MODEL_FLOW_0036
     * @tc.name      PullToRefresh_NewsPageModelFlow_0036
     * @tc.desc      NewsPageModel call flow changesPage > changesPage > iconSize keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_NewsPageModelFlow_0036', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}NewsPageModelFlow_0036 begin`);
      const subject: NewsPageModel = new NewsPageModel();
      const step1: boolean = subject.changesPage();
      logInfo(`step1 changesPage(): step1=${step1}`);
      expect(step1).assertFalse();
      const step2: boolean = subject.changesPage();
      logInfo(`step2 changesPage(): step2=${step2}`);
      expect(step2).assertFalse();
      const step3: number = subject.iconSize(360);
      logInfo(`step3 iconSize(360): step3=${step3}`);
      expect(step3).assertEqual(360);
      logInfo(`${BUNDLE}NewsPageModelFlow_0036 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_NEWS_PAGE_MODEL_FLOW_0037
     * @tc.name      PullToRefresh_NewsPageModelFlow_0037
     * @tc.desc      NewsPageModel call flow onAnimPullDown > newsCount > onAnimRefreshing > angles > onLoadMore keep...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_NewsPageModelFlow_0037', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}NewsPageModelFlow_0037 begin`);
      const subject: NewsPageModel = new NewsPageModel();
      subject.onAnimPullDown(88.37);
      const step2: number = subject.newsCount();
      logInfo(`step2 newsCount(): step2=${step2}`);
      expect(step2).assertEqual(8);
      subject.onAnimRefreshing(324);
      const step4: string = subject.angles();
      logInfo(`step4 angles(): step4=${step4}`);
      expect(step4).assertEqual('0/116640');
      const step5: boolean = subject.onLoadMore();
      logInfo(`step5 onLoadMore(): step5=${step5}`);
      expect(step5).assertTrue();
      logInfo(`${BUNDLE}NewsPageModelFlow_0037 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_NEWS_PAGE_MODEL_FLOW_0038
     * @tc.name      PullToRefresh_NewsPageModelFlow_0038
     * @tc.desc      NewsPageModel call flow onAnimLoading > onLoadMore > page keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_NewsPageModelFlow_0038', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}NewsPageModelFlow_0038 begin`);
      const subject: NewsPageModel = new NewsPageModel();
      subject.onAnimLoading(419.89);
      const step2: boolean = subject.onLoadMore();
      logInfo(`step2 onLoadMore(): step2=${step2}`);
      expect(step2).assertTrue();
      const step3: number = subject.page();
      logInfo(`step3 page(): step3=${step3}`);
      expect(step3).assertEqual(0);
      logInfo(`${BUNDLE}NewsPageModelFlow_0038 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_NEWS_PAGE_MODEL_FLOW_0039
     * @tc.name      PullToRefresh_NewsPageModelFlow_0039
     * @tc.desc      NewsPageModel call flow firstId > listIndex > onLoadMore > onAnimRefreshing keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_NewsPageModelFlow_0039', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}NewsPageModelFlow_0039 begin`);
      const subject: NewsPageModel = new NewsPageModel();
      const step1: string = subject.firstId();
      logInfo(`step1 firstId(): step1=${step1}`);
      expect(step1).assertEqual('1');
      const step2: number = subject.listIndex();
      logInfo(`step2 listIndex(): step2=${step2}`);
      expect(step2).assertEqual(1);
      const step3: boolean = subject.onLoadMore();
      logInfo(`step3 onLoadMore(): step3=${step3}`);
      expect(step3).assertTrue();
      subject.onAnimRefreshing(1296);
      logInfo(`${BUNDLE}NewsPageModelFlow_0039 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_NEWS_PAGE_MODEL_FLOW_0040
     * @tc.name      PullToRefresh_NewsPageModelFlow_0040
     * @tc.desc      NewsPageModel call flow onRefresh > newsCount > onLoadMore > onLoadMore > aboutToDisappear keeps...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_NewsPageModelFlow_0040', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}NewsPageModelFlow_0040 begin`);
      const subject: NewsPageModel = new NewsPageModel();
      const step1: string = subject.onRefresh();
      logInfo(`step1 onRefresh(): step1=${step1}`);
      expect(step1).assertEqual('\u5237\u65b0\u5f53\u524d\u6570\u636e\u6210\u529f');
      const step2: number = subject.newsCount();
      logInfo(`step2 newsCount(): step2=${step2}`);
      expect(step2).assertEqual(8);
      const step3: boolean = subject.onLoadMore();
      logInfo(`step3 onLoadMore(): step3=${step3}`);
      expect(step3).assertTrue();
      const step4: boolean = subject.onLoadMore();
      logInfo(`step4 onLoadMore(): step4=${step4}`);
      expect(step4).assertTrue();
      subject.aboutToDisappear();
      logInfo(`${BUNDLE}NewsPageModelFlow_0040 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_NEWS_PAGE_MODEL_FLOW_0041
     * @tc.name      PullToRefresh_NewsPageModelFlow_0041
     * @tc.desc      NewsPageModel call flow onAnimLoading > listIndex > aboutToDisappear > tip keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_NewsPageModelFlow_0041', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}NewsPageModelFlow_0041 begin`);
      const subject: NewsPageModel = new NewsPageModel();
      subject.onAnimLoading(881);
      const step2: number = subject.listIndex();
      logInfo(`step2 listIndex(): step2=${step2}`);
      expect(step2).assertEqual(1);
      subject.aboutToDisappear();
      const step4: string = subject.tip();
      logInfo(`step4 tip(): step4=${step4}`);
      expect(step4).assertEqual('\u91ca\u653e\u5237\u65b0\u5f53\u524d\u9875\u9762\u6570\u636e');
      logInfo(`${BUNDLE}NewsPageModelFlow_0041 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_NEWS_PAGE_MODEL_FLOW_0042
     * @tc.name      PullToRefresh_NewsPageModelFlow_0042
     * @tc.desc      NewsPageModel call flow listIndex > iconSize keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_NewsPageModelFlow_0042', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}NewsPageModelFlow_0042 begin`);
      const subject: NewsPageModel = new NewsPageModel();
      const step1: number = subject.listIndex();
      logInfo(`step1 listIndex(): step1=${step1}`);
      expect(step1).assertEqual(1);
      const step2: number = subject.iconSize(1357.39);
      logInfo(`step2 iconSize(1357.39): step2=${step2}`);
      expect(step2).assertClose(1357.39, PRECISION);
      logInfo(`${BUNDLE}NewsPageModelFlow_0042 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_NEWS_PAGE_MODEL_FLOW_0043
     * @tc.name      PullToRefresh_NewsPageModelFlow_0043
     * @tc.desc      NewsPageModel call flow onLoadMore > angles keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_NewsPageModelFlow_0043', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}NewsPageModelFlow_0043 begin`);
      const subject: NewsPageModel = new NewsPageModel();
      const step1: boolean = subject.onLoadMore();
      logInfo(`step1 onLoadMore(): step1=${step1}`);
      expect(step1).assertTrue();
      const step2: string = subject.angles();
      logInfo(`step2 angles(): step2=${step2}`);
      expect(step2).assertEqual('0/0');
      logInfo(`${BUNDLE}NewsPageModelFlow_0043 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_NEWS_PAGE_MODEL_FLOW_0044
     * @tc.name      PullToRefresh_NewsPageModelFlow_0044
     * @tc.desc      NewsPageModel call flow page > firstId > page keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_NewsPageModelFlow_0044', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}NewsPageModelFlow_0044 begin`);
      const subject: NewsPageModel = new NewsPageModel();
      const step1: number = subject.page();
      logInfo(`step1 page(): step1=${step1}`);
      expect(step1).assertEqual(0);
      const step2: string = subject.firstId();
      logInfo(`step2 firstId(): step2=${step2}`);
      expect(step2).assertEqual('1');
      const step3: number = subject.page();
      logInfo(`step3 page(): step3=${step3}`);
      expect(step3).assertEqual(0);
      logInfo(`${BUNDLE}NewsPageModelFlow_0044 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_NEWS_PAGE_MODEL_FLOW_0045
     * @tc.name      PullToRefresh_NewsPageModelFlow_0045
     * @tc.desc      NewsPageModel call flow listIndex > onAnimLoading > page > changesPage > aboutToDisappear keeps ...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_NewsPageModelFlow_0045', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}NewsPageModelFlow_0045 begin`);
      const subject: NewsPageModel = new NewsPageModel();
      const step1: number = subject.listIndex();
      logInfo(`step1 listIndex(): step1=${step1}`);
      expect(step1).assertEqual(1);
      subject.onAnimLoading(864);
      const step3: number = subject.page();
      logInfo(`step3 page(): step3=${step3}`);
      expect(step3).assertEqual(0);
      const step4: boolean = subject.changesPage();
      logInfo(`step4 changesPage(): step4=${step4}`);
      expect(step4).assertFalse();
      subject.aboutToDisappear();
      logInfo(`${BUNDLE}NewsPageModelFlow_0045 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_NEWS_PAGE_MODEL_FLOW_0046
     * @tc.name      PullToRefresh_NewsPageModelFlow_0046
     * @tc.desc      NewsPageModel call flow footer > iconSize > iconSize keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_NewsPageModelFlow_0046', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}NewsPageModelFlow_0046 begin`);
      const subject: NewsPageModel = new NewsPageModel();
      const step1: string = subject.footer();
      logInfo(`step1 footer(): step1=${step1}`);
      expect(step1).assertEqual('up:');
      const step2: number = subject.iconSize(2698);
      logInfo(`step2 iconSize(2698): step2=${step2}`);
      expect(step2).assertEqual(2698);
      const step3: number = subject.iconSize(966);
      logInfo(`step3 iconSize(966): step3=${step3}`);
      expect(step3).assertEqual(966);
      logInfo(`${BUNDLE}NewsPageModelFlow_0046 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_NEWS_PAGE_MODEL_FLOW_0047
     * @tc.name      PullToRefresh_NewsPageModelFlow_0047
     * @tc.desc      NewsPageModel call flow listIndex > onAnimRefreshing > firstId > page keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_NewsPageModelFlow_0047', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}NewsPageModelFlow_0047 begin`);
      const subject: NewsPageModel = new NewsPageModel();
      const step1: number = subject.listIndex();
      logInfo(`step1 listIndex(): step1=${step1}`);
      expect(step1).assertEqual(1);
      subject.onAnimRefreshing(288);
      const step3: string = subject.firstId();
      logInfo(`step3 firstId(): step3=${step3}`);
      expect(step3).assertEqual('1');
      const step4: number = subject.page();
      logInfo(`step4 page(): step4=${step4}`);
      expect(step4).assertEqual(0);
      logInfo(`${BUNDLE}NewsPageModelFlow_0047 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_NEWS_PAGE_MODEL_FLOW_0048
     * @tc.name      PullToRefresh_NewsPageModelFlow_0048
     * @tc.desc      NewsPageModel call flow onAnimPullDown > tip > tip > onAnimLoading keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_NewsPageModelFlow_0048', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}NewsPageModelFlow_0048 begin`);
      const subject: NewsPageModel = new NewsPageModel();
      subject.onAnimPullDown(-16);
      const step2: string = subject.tip();
      logInfo(`step2 tip(): step2=${step2}`);
      expect(step2).assertEqual('\u91ca\u653e\u5237\u65b0\u5f53\u524d\u9875\u9762\u6570\u636e');
      const step3: string = subject.tip();
      logInfo(`step3 tip(): step3=${step3}`);
      expect(step3).assertEqual('\u91ca\u653e\u5237\u65b0\u5f53\u524d\u9875\u9762\u6570\u636e');
      subject.onAnimLoading(735);
      logInfo(`${BUNDLE}NewsPageModelFlow_0048 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_NEWS_PAGE_MODEL_FLOW_0049
     * @tc.name      PullToRefresh_NewsPageModelFlow_0049
     * @tc.desc      NewsPageModel call flow listIndex > onLoadMore > onAnimLoading > firstId keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_NewsPageModelFlow_0049', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}NewsPageModelFlow_0049 begin`);
      const subject: NewsPageModel = new NewsPageModel();
      const step1: number = subject.listIndex();
      logInfo(`step1 listIndex(): step1=${step1}`);
      expect(step1).assertEqual(1);
      const step2: boolean = subject.onLoadMore();
      logInfo(`step2 onLoadMore(): step2=${step2}`);
      expect(step2).assertTrue();
      subject.onAnimLoading(-279);
      const step4: string = subject.firstId();
      logInfo(`step4 firstId(): step4=${step4}`);
      expect(step4).assertEqual('1');
      logInfo(`${BUNDLE}NewsPageModelFlow_0049 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_NEWS_PAGE_MODEL_FLOW_0050
     * @tc.name      PullToRefresh_NewsPageModelFlow_0050
     * @tc.desc      NewsPageModel call flow page > listIndex > onLoadMore > newsCount keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_NewsPageModelFlow_0050', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}NewsPageModelFlow_0050 begin`);
      const subject: NewsPageModel = new NewsPageModel();
      const step1: number = subject.page();
      logInfo(`step1 page(): step1=${step1}`);
      expect(step1).assertEqual(0);
      const step2: number = subject.listIndex();
      logInfo(`step2 listIndex(): step2=${step2}`);
      expect(step2).assertEqual(1);
      const step3: boolean = subject.onLoadMore();
      logInfo(`step3 onLoadMore(): step3=${step3}`);
      expect(step3).assertTrue();
      const step4: number = subject.newsCount();
      logInfo(`step4 newsCount(): step4=${step4}`);
      expect(step4).assertEqual(16);
      logInfo(`${BUNDLE}NewsPageModelFlow_0050 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_NEWS_PAGE_MODEL_FLOW_0051
     * @tc.name      PullToRefresh_NewsPageModelFlow_0051
     * @tc.desc      NewsPageModel call flow aboutToDisappear > listIndex > onAnimLoading keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_NewsPageModelFlow_0051', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}NewsPageModelFlow_0051 begin`);
      const subject: NewsPageModel = new NewsPageModel();
      subject.aboutToDisappear();
      const step2: number = subject.listIndex();
      logInfo(`step2 listIndex(): step2=${step2}`);
      expect(step2).assertEqual(1);
      subject.onAnimLoading(3);
      logInfo(`${BUNDLE}NewsPageModelFlow_0051 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_NEWS_PAGE_MODEL_FLOW_0052
     * @tc.name      PullToRefresh_NewsPageModelFlow_0052
     * @tc.desc      NewsPageModel call flow page > listIndex > iconSize > onLoadMore keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_NewsPageModelFlow_0052', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}NewsPageModelFlow_0052 begin`);
      const subject: NewsPageModel = new NewsPageModel();
      const step1: number = subject.page();
      logInfo(`step1 page(): step1=${step1}`);
      expect(step1).assertEqual(0);
      const step2: number = subject.listIndex();
      logInfo(`step2 listIndex(): step2=${step2}`);
      expect(step2).assertEqual(1);
      const step3: number = subject.iconSize(360);
      logInfo(`step3 iconSize(360): step3=${step3}`);
      expect(step3).assertEqual(360);
      const step4: boolean = subject.onLoadMore();
      logInfo(`step4 onLoadMore(): step4=${step4}`);
      expect(step4).assertTrue();
      logInfo(`${BUNDLE}NewsPageModelFlow_0052 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_NEWS_PAGE_MODEL_FLOW_0053
     * @tc.name      PullToRefresh_NewsPageModelFlow_0053
     * @tc.desc      NewsPageModel call flow onAnimLoading > onLoadMore > onLoadMore > listIndex keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_NewsPageModelFlow_0053', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}NewsPageModelFlow_0053 begin`);
      const subject: NewsPageModel = new NewsPageModel();
      subject.onAnimLoading(3);
      const step2: boolean = subject.onLoadMore();
      logInfo(`step2 onLoadMore(): step2=${step2}`);
      expect(step2).assertTrue();
      const step3: boolean = subject.onLoadMore();
      logInfo(`step3 onLoadMore(): step3=${step3}`);
      expect(step3).assertTrue();
      const step4: number = subject.listIndex();
      logInfo(`step4 listIndex(): step4=${step4}`);
      expect(step4).assertEqual(3);
      logInfo(`${BUNDLE}NewsPageModelFlow_0053 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_NEWS_PAGE_MODEL_FLOW_0054
     * @tc.name      PullToRefresh_NewsPageModelFlow_0054
     * @tc.desc      NewsPageModel call flow changesPage > tip > onRefresh > footer > footer keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_NewsPageModelFlow_0054', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}NewsPageModelFlow_0054 begin`);
      const subject: NewsPageModel = new NewsPageModel();
      const step1: boolean = subject.changesPage();
      logInfo(`step1 changesPage(): step1=${step1}`);
      expect(step1).assertFalse();
      const step2: string = subject.tip();
      logInfo(`step2 tip(): step2=${step2}`);
      expect(step2).assertEqual('\u91ca\u653e\u5237\u65b0\u5f53\u524d\u9875\u9762\u6570\u636e');
      const step3: string = subject.onRefresh();
      logInfo(`step3 onRefresh(): step3=${step3}`);
      expect(step3).assertEqual('\u5237\u65b0\u5f53\u524d\u6570\u636e\u6210\u529f');
      const step4: string = subject.footer();
      logInfo(`step4 footer(): step4=${step4}`);
      expect(step4).assertEqual('up:');
      const step5: string = subject.footer();
      logInfo(`step5 footer(): step5=${step5}`);
      expect(step5).assertEqual('up:');
      logInfo(`${BUNDLE}NewsPageModelFlow_0054 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_NEWS_PAGE_MODEL_FLOW_0055
     * @tc.name      PullToRefresh_NewsPageModelFlow_0055
     * @tc.desc      NewsPageModel call flow angles > iconSize > iconSize keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_NewsPageModelFlow_0055', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}NewsPageModelFlow_0055 begin`);
      const subject: NewsPageModel = new NewsPageModel();
      const step1: string = subject.angles();
      logInfo(`step1 angles(): step1=${step1}`);
      expect(step1).assertEqual('0/0');
      const step2: number = subject.iconSize(1728);
      logInfo(`step2 iconSize(1728): step2=${step2}`);
      expect(step2).assertEqual(1728);
      const step3: number = subject.iconSize(287);
      logInfo(`step3 iconSize(287): step3=${step3}`);
      expect(step3).assertEqual(287);
      logInfo(`${BUNDLE}NewsPageModelFlow_0055 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_NEWS_PAGE_MODEL_FLOW_0056
     * @tc.name      PullToRefresh_NewsPageModelFlow_0056
     * @tc.desc      NewsPageModel call flow onAnimRefreshing > iconSize > listIndex > angles keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_NewsPageModelFlow_0056', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}NewsPageModelFlow_0056 begin`);
      const subject: NewsPageModel = new NewsPageModel();
      subject.onAnimRefreshing(57.65);
      const step2: number = subject.iconSize(-1203);
      logInfo(`step2 iconSize(-1203): step2=${step2}`);
      expect(step2).assertEqual(-1203);
      const step3: number = subject.listIndex();
      logInfo(`step3 listIndex(): step3=${step3}`);
      expect(step3).assertEqual(1);
      const step4: string = subject.angles();
      logInfo(`step4 angles(): step4=${step4}`);
      expect(step4).assertEqual('0/20754');
      logInfo(`${BUNDLE}NewsPageModelFlow_0056 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_NEWS_PAGE_MODEL_FLOW_0057
     * @tc.name      PullToRefresh_NewsPageModelFlow_0057
     * @tc.desc      NewsPageModel call flow aboutToDisappear > aboutToDisappear > aboutToDisappear > onLoadMore > pa...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_NewsPageModelFlow_0057', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}NewsPageModelFlow_0057 begin`);
      const subject: NewsPageModel = new NewsPageModel();
      subject.aboutToDisappear();
      subject.aboutToDisappear();
      subject.aboutToDisappear();
      const step4: boolean = subject.onLoadMore();
      logInfo(`step4 onLoadMore(): step4=${step4}`);
      expect(step4).assertTrue();
      const step5: number = subject.page();
      logInfo(`step5 page(): step5=${step5}`);
      expect(step5).assertEqual(0);
      logInfo(`${BUNDLE}NewsPageModelFlow_0057 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_NEWS_PAGE_MODEL_FLOW_0058
     * @tc.name      PullToRefresh_NewsPageModelFlow_0058
     * @tc.desc      NewsPageModel call flow tip > listIndex > iconSize > onRefresh keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_NewsPageModelFlow_0058', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}NewsPageModelFlow_0058 begin`);
      const subject: NewsPageModel = new NewsPageModel();
      const step1: string = subject.tip();
      logInfo(`step1 tip(): step1=${step1}`);
      expect(step1).assertEqual('\u91ca\u653e\u5237\u65b0\u5f53\u524d\u9875\u9762\u6570\u636e');
      const step2: number = subject.listIndex();
      logInfo(`step2 listIndex(): step2=${step2}`);
      expect(step2).assertEqual(1);
      const step3: number = subject.iconSize(2496);
      logInfo(`step3 iconSize(2496): step3=${step3}`);
      expect(step3).assertEqual(2496);
      const step4: string = subject.onRefresh();
      logInfo(`step4 onRefresh(): step4=${step4}`);
      expect(step4).assertEqual('\u5237\u65b0\u5f53\u524d\u6570\u636e\u6210\u529f');
      logInfo(`${BUNDLE}NewsPageModelFlow_0058 end`);
    });
  });
}
