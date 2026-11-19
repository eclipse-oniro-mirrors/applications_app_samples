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
import { describe, it, expect, Level, Size, TestType } from '@ohos/hypium';
import { hilog } from '@kit.PerformanceAnalysisKit';
import { COMPONENT_CATEGORIES } from '../../../main/ets/pages/components/ComponentData';
import { UNIVERSAL_CATEGORIES } from '../../../main/ets/pages/universal/UniversialData';
import { GLOBAL_METHOD_CATEGORIES } from '../../../main/ets/pages/globalMethods/GlobalMethodData';
import { ANIMATION_CATEGORIES } from '../../../main/ets/pages/animations/AnimationData';
import {
  ThirdLevelCategory, FourthLevelCategory, SecondLevelCategory
} from '../../../main/ets/model/CategoricalDataType';

const DOMAIN: number = 0xF814;
const TAG: string = 'CategoryExtTest';

function log(message: string): void {
  hilog.info(DOMAIN, TAG, '%{public}s', message);
}

function fourthUrlsOf(group: ThirdLevelCategory): string[] {
  const urls: string[] = [];
  const children: FourthLevelCategory[] = group.childNodes as FourthLevelCategory[];
  children.forEach((child: FourthLevelCategory) => {
    urls.push(child.url);
  });
  return urls;
}

export default function categoryDataExtendedTest(): void {
  describe('CategoryDataExtendedTest', () => {
    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_CATEGORYURL_0333
     * @tc.name      testCategoryUrl0333
     * @tc.desc      Verify the divider sample route used by UI tests is registered in data.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testCategoryUrl0333', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testCategoryUrl0333 begin');
      const firstGroup: ThirdLevelCategory = COMPONENT_CATEGORIES[0];
      const urls: string[] = fourthUrlsOf(firstGroup);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual urls[0]=${urls[0]}, expected='pages/components/blankAndD...`);
      expect(urls[0]).assertEqual('pages/components/blankAndDivider/dividerSample/DividerSample');
      log('testCategoryUrl0333 end');
    })

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_CATEGORYURL_0334
     * @tc.name      testCategoryUrl0334
     * @tc.desc      Verify all fourth-level urls start with the pages prefix.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testCategoryUrl0334', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testCategoryUrl0334 begin');
      let allValid: boolean = true;
      COMPONENT_CATEGORIES.forEach((group: ThirdLevelCategory) => {
        fourthUrlsOf(group).forEach((url: string) => {
          if (!url.startsWith('pages/')) {
            allValid = false;
          }
        });
      });
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue allValid=${allValid}`);
      expect(allValid).assertTrue();
      log('testCategoryUrl0334 end');
    })

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_CATEGORYURL_0335
     * @tc.name      testCategoryUrl0335
     * @tc.desc      Verify all fourth-level urls are unique across component groups.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testCategoryUrl0335', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testCategoryUrl0335 begin');
      const allUrls: string[] = [];
      COMPONENT_CATEGORIES.forEach((group: ThirdLevelCategory) => {
        fourthUrlsOf(group).forEach((url: string) => {
          allUrls.push(url);
        });
      });
      const uniqueUrls: Set<string> = new Set<string>(allUrls);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual uniqueUrls.size=${uniqueUrls.size}, expected=allUrls.length`);
      expect(uniqueUrls.size).assertEqual(allUrls.length);
      log('testCategoryUrl0335 end');
    })

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_CATEGORYURL_0336
     * @tc.name      testCategoryUrl0336
     * @tc.desc      Verify the component collection exposes 83 fourth-level routes.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testCategoryUrl0336', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testCategoryUrl0336 begin');
      let totalCount: number = 0;
      COMPONENT_CATEGORIES.forEach((group: ThirdLevelCategory) => {
        totalCount += fourthUrlsOf(group).length;
      });
      log('assertEqual totalCount=' + totalCount + ', expected=83');
      expect(totalCount).assertEqual(83);
      log('testCategoryUrl0336 end');
    })

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_CATEGORYURL_0337
     * @tc.name      testCategoryUrl0337
     * @tc.desc      Verify group 0 blank and divider routes are valid page urls.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testCategoryUrl0337', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testCategoryUrl0337 begin');
      const urls: string[] = fourthUrlsOf(COMPONENT_CATEGORIES[0]);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual urls.length=${urls.length}, expected=1`);
      expect(urls.length).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue urls[0].startsWith('pages/')=${urls[0].startsWith('pages/')}`);
      expect(urls[0].startsWith('pages/')).assertTrue();
      log('testCategoryUrl0337 end');
    })

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_CATEGORYURL_0338
     * @tc.name      testCategoryUrl0338
     * @tc.desc      Verify group 1 button and selection routes are valid page urls.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testCategoryUrl0338', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testCategoryUrl0338 begin');
      const urls: string[] = fourthUrlsOf(COMPONENT_CATEGORIES[1]);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertLarger urls.length=${urls.length}, expected=0`);
      expect(urls.length).assertLarger(0);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue urls[0].startsWith('pages/')=${urls[0].startsWith('pages/')}`);
      expect(urls[0].startsWith('pages/')).assertTrue();
      log('testCategoryUrl0338 end');
    })

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_CATEGORYURL_0339
     * @tc.name      testCategoryUrl0339
     * @tc.desc      Verify group 2 scroll and swipe routes are valid page urls.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testCategoryUrl0339', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testCategoryUrl0339 begin');
      const urls: string[] = fourthUrlsOf(COMPONENT_CATEGORIES[2]);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertLarger urls.length=${urls.length}, expected=0`);
      expect(urls.length).assertLarger(0);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue urls[0].startsWith('pages/')=${urls[0].startsWith('pages/')}`);
      expect(urls[0].startsWith('pages/')).assertTrue();
      log('testCategoryUrl0339 end');
    })

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_CATEGORYURL_0340
     * @tc.name      testCategoryUrl0340
     * @tc.desc      Verify group 3 information display routes are valid page urls.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testCategoryUrl0340', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testCategoryUrl0340 begin');
      const urls: string[] = fourthUrlsOf(COMPONENT_CATEGORIES[3]);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertLarger urls.length=${urls.length}, expected=0`);
      expect(urls.length).assertLarger(0);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue urls[0].startsWith('pages/')=${urls[0].startsWith('pages/')}`);
      expect(urls[0].startsWith('pages/')).assertTrue();
      log('testCategoryUrl0340 end');
    })

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_CATEGORYURL_0341
     * @tc.name      testCategoryUrl0341
     * @tc.desc      Verify group 4 text and input routes are valid page urls.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testCategoryUrl0341', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testCategoryUrl0341 begin');
      const urls: string[] = fourthUrlsOf(COMPONENT_CATEGORIES[4]);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertLarger urls.length=${urls.length}, expected=0`);
      expect(urls.length).assertLarger(0);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue urls[0].startsWith('pages/')=${urls[0].startsWith('pages/')}`);
      expect(urls[0].startsWith('pages/')).assertTrue();
      log('testCategoryUrl0341 end');
    })

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_CATEGORYURL_0342
     * @tc.name      testCategoryUrl0342
     * @tc.desc      Verify group 5 auxiliary routes are valid page urls.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testCategoryUrl0342', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testCategoryUrl0342 begin');
      const urls: string[] = fourthUrlsOf(COMPONENT_CATEGORIES[5]);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual urls.length=${urls.length}, expected=5`);
      expect(urls.length).assertEqual(5);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue urls[0].startsWith('pages/')=${urls[0].startsWith('pages/')}`);
      expect(urls[0].startsWith('pages/')).assertTrue();
      log('testCategoryUrl0342 end');
    })

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_CATEGORYURL_0343
     * @tc.name      testCategoryUrl0343
     * @tc.desc      Verify group 6 canvas routes are valid page urls.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testCategoryUrl0343', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testCategoryUrl0343 begin');
      const urls: string[] = fourthUrlsOf(COMPONENT_CATEGORIES[6]);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual urls.length=${urls.length}, expected=7`);
      expect(urls.length).assertEqual(7);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue urls[0].startsWith('pages/')=${urls[0].startsWith('pages/')}`);
      expect(urls[0].startsWith('pages/')).assertTrue();
      log('testCategoryUrl0343 end');
    })

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_CATEGORYURL_0344
     * @tc.name      testCategoryUrl0344
     * @tc.desc      Verify group 7 rows and columns routes are valid page urls.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testCategoryUrl0344', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testCategoryUrl0344 begin');
      const urls: string[] = fourthUrlsOf(COMPONENT_CATEGORIES[7]);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertLarger urls.length=${urls.length}, expected=0`);
      expect(urls.length).assertLarger(0);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue urls[0].startsWith('pages/')=${urls[0].startsWith('pages/')}`);
      expect(urls[0].startsWith('pages/')).assertTrue();
      log('testCategoryUrl0344 end');
    })

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_CATEGORYURL_0345
     * @tc.name      testCategoryUrl0345
     * @tc.desc      Verify group 8 stack flex grid routes are valid page urls.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testCategoryUrl0345', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testCategoryUrl0345 begin');
      const urls: string[] = fourthUrlsOf(COMPONENT_CATEGORIES[8]);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertLarger urls.length=${urls.length}, expected=0`);
      expect(urls.length).assertLarger(0);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue urls[0].startsWith('pages/')=${urls[0].startsWith('pages/')}`);
      expect(urls[0].startsWith('pages/')).assertTrue();
      log('testCategoryUrl0345 end');
    })

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_CATEGORYURL_0346
     * @tc.name      testCategoryUrl0346
     * @tc.desc      Verify group 9 list and grid routes are valid page urls.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testCategoryUrl0346', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testCategoryUrl0346 begin');
      const urls: string[] = fourthUrlsOf(COMPONENT_CATEGORIES[9]);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertLarger urls.length=${urls.length}, expected=0`);
      expect(urls.length).assertLarger(0);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue urls[0].startsWith('pages/')=${urls[0].startsWith('pages/')}`);
      expect(urls[0].startsWith('pages/')).assertTrue();
      log('testCategoryUrl0346 end');
    })

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_CATEGORYURL_0347
     * @tc.name      testCategoryUrl0347
     * @tc.desc      Verify group 10 navigation routes are valid page urls.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testCategoryUrl0347', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testCategoryUrl0347 begin');
      const urls: string[] = fourthUrlsOf(COMPONENT_CATEGORIES[10]);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertLarger urls.length=${urls.length}, expected=0`);
      expect(urls.length).assertLarger(0);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue urls[0].startsWith('pages/')=${urls[0].startsWith('pages/')}`);
      expect(urls[0].startsWith('pages/')).assertTrue();
      log('testCategoryUrl0347 end');
    })

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_CATEGORYURL_0348
     * @tc.name      testCategoryUrl0348
     * @tc.desc      Verify group 11 canvas drawing routes are valid page urls.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testCategoryUrl0348', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testCategoryUrl0348 begin');
      const urls: string[] = fourthUrlsOf(COMPONENT_CATEGORIES[11]);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertLarger urls.length=${urls.length}, expected=0`);
      expect(urls.length).assertLarger(0);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue urls[0].startsWith('pages/')=${urls[0].startsWith('pages/')}`);
      expect(urls[0].startsWith('pages/')).assertTrue();
      log('testCategoryUrl0348 end');
    })

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_CATEGORYURL_0349
     * @tc.name      testCategoryUrl0349
     * @tc.desc      Verify group 12 media routes are valid page urls.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testCategoryUrl0349', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testCategoryUrl0349 begin');
      const urls: string[] = fourthUrlsOf(COMPONENT_CATEGORIES[12]);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertLarger urls.length=${urls.length}, expected=0`);
      expect(urls.length).assertLarger(0);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue urls[0].startsWith('pages/')=${urls[0].startsWith('pages/')}`);
      expect(urls[0].startsWith('pages/')).assertTrue();
      log('testCategoryUrl0349 end');
    })

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_CATEGORYURL_0350
     * @tc.name      testCategoryUrl0350
     * @tc.desc      Verify group 13 web route points to the web sample page.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testCategoryUrl0350', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testCategoryUrl0350 begin');
      const urls: string[] = fourthUrlsOf(COMPONENT_CATEGORIES[13]);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual urls.length=${urls.length}, expected=1`);
      expect(urls.length).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual urls[0]=${urls[0]}, expected='pages/components/web/webSa...`);
      expect(urls[0]).assertEqual('pages/components/web/webSample/WebSample');
      log('testCategoryUrl0350 end');
    })

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_CATEGORYURL_0351
     * @tc.name      testCategoryUrl0351
     * @tc.desc      Verify the gesture first entry routes to bind gesture sample.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testCategoryUrl0351', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testCategoryUrl0351 begin');
      const gestureGroup: SecondLevelCategory = UNIVERSAL_CATEGORIES[2];
      const children: ThirdLevelCategory[] = gestureGroup.childNodes;
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual children[0].url=${children[0].url}`);
      expect(children[0].url).assertEqual('pages/universal/gesture/bindGestureSample/BindGestureSample');
      log('testCategoryUrl0351 end');
    })

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_CATEGORYURL_0352
     * @tc.name      testCategoryUrl0352
     * @tc.desc      Verify the common events first entry routes to click event sample.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testCategoryUrl0352', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testCategoryUrl0352 begin');
      const eventsGroup: SecondLevelCategory = UNIVERSAL_CATEGORIES[0];
      const children: ThirdLevelCategory[] = eventsGroup.childNodes;
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual children[0].url=${children[0].url}`);
      expect(children[0].url).assertEqual('pages/universal/events/clickEventSample/ClickEventSample');
      log('testCategoryUrl0352 end');
    })

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_CATEGORYURL_0353
     * @tc.name      testCategoryUrl0353
     * @tc.desc      Verify the common properties first entry routes to foreground sample.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testCategoryUrl0353', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testCategoryUrl0353 begin');
      const propertiesGroup: SecondLevelCategory = UNIVERSAL_CATEGORIES[1];
      const children: ThirdLevelCategory[] = propertiesGroup.childNodes;
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual children[0].url=${children[0].url}`);
      expect(children[0].url).assertEqual('pages/universal/properties/foregroundSample/ForegroundSample');
      log('testCategoryUrl0353 end');
    })

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_CATEGORYURL_0354
     * @tc.name      testCategoryUrl0354
     * @tc.desc      Verify every universal third-level entry has url or child nodes.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testCategoryUrl0354', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testCategoryUrl0354 begin');
      let allNavigable: boolean = true;
      UNIVERSAL_CATEGORIES.forEach((group: SecondLevelCategory) => {
        group.childNodes.forEach((entry: ThirdLevelCategory) => {
          if (entry.url === undefined && (entry.childNodes === undefined || entry.childNodes.length <= 0)) {
            allNavigable = false;
          }
        });
      });
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue allNavigable=${allNavigable}`);
      expect(allNavigable).assertTrue();
      log('testCategoryUrl0354 end');
    })

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_CATEGORYURL_0355
     * @tc.name      testCategoryUrl0355
     * @tc.desc      Verify the menu global entry routes to menu sample.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testCategoryUrl0355', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testCategoryUrl0355 begin');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual actual=${GLOBAL_METHOD_CATEGORIES[1].url}`);
      expect(GLOBAL_METHOD_CATEGORIES[1].url).assertEqual('pages/globalMethods/dialogs/menuSample/MenuSample');
      log('testCategoryUrl0355 end');
    })

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_CATEGORYURL_0356
     * @tc.name      testCategoryUrl0356
     * @tc.desc      Verify the bind sheet global entry routes to bind sheet sample.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testCategoryUrl0356', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testCategoryUrl0356 begin');
      hilog.info(DOMAIN, TAG, '%{public}s', `assert actual=${GLOBAL_METHOD_CATEGORIES[2].url}`);
      expect(GLOBAL_METHOD_CATEGORIES[2].url)
        .assertEqual('pages/globalMethods/dialogs/bindSheetSample/BindSheetSample');
      log('testCategoryUrl0356 end');
    })

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_CATEGORYURL_0357
     * @tc.name      testCategoryUrl0357
     * @tc.desc      Verify the popup global entry routes to popup sample.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testCategoryUrl0357', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testCategoryUrl0357 begin');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual actual=${GLOBAL_METHOD_CATEGORIES[3].url}`);
      expect(GLOBAL_METHOD_CATEGORIES[3].url).assertEqual('pages/globalMethods/dialogs/popUpSample/PopUpSample');
      log('testCategoryUrl0357 end');
    })

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_CATEGORYURL_0358
     * @tc.name      testCategoryUrl0358
     * @tc.desc      Verify dialog group children all start with pages prefix.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testCategoryUrl0358', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testCategoryUrl0358 begin');
      const dialogGroup: ThirdLevelCategory = GLOBAL_METHOD_CATEGORIES[0];
      const children: FourthLevelCategory[] = dialogGroup.childNodes as FourthLevelCategory[];
      let allValid: boolean = true;
      children.forEach((child: FourthLevelCategory) => {
        if (!child.url.startsWith('pages/')) {
          allValid = false;
        }
      });
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue allValid=${allValid}`);
      expect(allValid).assertTrue();
      log('testCategoryUrl0358 end');
    })

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_CATEGORYURL_0359
     * @tc.name      testCategoryUrl0359
     * @tc.desc      Verify the last four animation entries expose direct urls.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testCategoryUrl0359', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testCategoryUrl0359 begin');
      let allDirect: boolean = true;
      for (let i: number = 1; i < ANIMATION_CATEGORIES.length; i++) {
        if (ANIMATION_CATEGORIES[i].url === undefined) {
          allDirect = false;
        }
      }
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue allDirect=${allDirect}`);
      expect(allDirect).assertTrue();
      log('testCategoryUrl0359 end');
    })

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_CATEGORYURL_0360
     * @tc.name      testCategoryUrl0360
     * @tc.desc      Verify all common event entries expose direct urls.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testCategoryUrl0360', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testCategoryUrl0360 begin');
      const eventsGroup: SecondLevelCategory = UNIVERSAL_CATEGORIES[0];
      let allDirect: boolean = true;
      eventsGroup.childNodes.forEach((entry: ThirdLevelCategory) => {
        if (entry.url === undefined) {
          allDirect = false;
        }
      });
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue allDirect=${allDirect}`);
      expect(allDirect).assertTrue();
      log('testCategoryUrl0360 end');
    })

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_CATEGORYURL_0361
     * @tc.name      testCategoryUrl0361
     * @tc.desc      Verify the touch event entry follows click event in data order.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testCategoryUrl0361', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testCategoryUrl0361 begin');
      const eventsGroup: SecondLevelCategory = UNIVERSAL_CATEGORIES[0];
      const children: ThirdLevelCategory[] = eventsGroup.childNodes;
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual children[1].url=${children[1].url}`);
      expect(children[1].url).assertEqual('pages/universal/events/touchEventSample/TouchEventSample');
      log('testCategoryUrl0361 end');
    })

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_CATEGORYURL_0362
     * @tc.name      testCategoryUrl0362
     * @tc.desc      Verify the gesture group holds four third-level entries.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testCategoryUrl0362', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testCategoryUrl0362 begin');
      const gestureGroup: SecondLevelCategory = UNIVERSAL_CATEGORIES[2];
      log('assertEqual gestureGroup.childNodes.length=' + gestureGroup.childNodes.length + ', expected=4');
      expect(gestureGroup.childNodes.length).assertEqual(4);
      log('testCategoryUrl0362 end');
    })

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_CATEGORYURL_0363
     * @tc.name      testCategoryUrl0363
     * @tc.desc      Verify fourth-level titles are defined across component groups.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testCategoryUrl0363', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testCategoryUrl0363 begin');
      let allHaveTitle: boolean = true;
      COMPONENT_CATEGORIES.forEach((group: ThirdLevelCategory) => {
        const children: FourthLevelCategory[] = group.childNodes as FourthLevelCategory[];
        children.forEach((child: FourthLevelCategory) => {
          if (child.title === undefined || child.title === null) {
            allHaveTitle = false;
          }
        });
      });
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue allHaveTitle=${allHaveTitle}`);
      expect(allHaveTitle).assertTrue();
      log('testCategoryUrl0363 end');
    })

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_CATEGORYURL_0364
     * @tc.name      testCategoryUrl0364
     * @tc.desc      Verify group titles carry positive resource ids.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testCategoryUrl0364', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testCategoryUrl0364 begin');
      let allPositive: boolean = true;
      COMPONENT_CATEGORIES.forEach((group: ThirdLevelCategory) => {
        if (group.title.id <= 0) {
          allPositive = false;
        }
      });
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue allPositive=${allPositive}`);
      expect(allPositive).assertTrue();
      log('testCategoryUrl0364 end');
    })

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_CATEGORYURL_0365
     * @tc.name      testCategoryUrl0365
     * @tc.desc      Verify group images carry positive resource ids.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testCategoryUrl0365', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testCategoryUrl0365 begin');
      let allPositive: boolean = true;
      COMPONENT_CATEGORIES.forEach((group: ThirdLevelCategory) => {
        if (group.image.id <= 0) {
          allPositive = false;
        }
      });
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue allPositive=${allPositive}`);
      expect(allPositive).assertTrue();
      log('testCategoryUrl0365 end');
    })

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_CATEGORYURL_0366
     * @tc.name      testCategoryUrl0366
     * @tc.desc      Verify the interpolation animation entry routes to its sample page.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testCategoryUrl0366', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testCategoryUrl0366 begin');
      hilog.info(DOMAIN, TAG, '%{public}s', `assert ANIMATION_CATEGORIES[1].url=${ANIMATION_CATEGORIES[1].url}`);
      expect(ANIMATION_CATEGORIES[1].url).assertEqual(
        'pages/animations/interpolationCalculationSample/InterpolationCalculationSample');
      log('testCategoryUrl0366 end');
    })

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_CATEGORYURL_0367
     * @tc.name      testCategoryUrl0367
     * @tc.desc      Verify the animate to entry routes to its sample page.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testCategoryUrl0367', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testCategoryUrl0367 begin');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual ANIMATION_CATEGORIES[2].url=${ANIMATION_CATEGORIES[2].url}`);
      expect(ANIMATION_CATEGORIES[2].url).assertEqual('pages/animations/animateToSample/AnimateToSample');
      log('testCategoryUrl0367 end');
    })

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_CATEGORYURL_0368
     * @tc.name      testCategoryUrl0368
     * @tc.desc      Verify the attribute animation entry routes to its sample page.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testCategoryUrl0368', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testCategoryUrl0368 begin');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual ANIMATION_CATEGORIES[3].url=${ANIMATION_CATEGORIES[3].url}`);
      expect(ANIMATION_CATEGORIES[3].url).assertEqual('pages/animations/animationSample/AnimationSample');
      log('testCategoryUrl0368 end');
    })

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_CATEGORYURL_0369
     * @tc.name      testCategoryUrl0369
     * @tc.desc      Verify the motion path entry routes to its sample page.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testCategoryUrl0369', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testCategoryUrl0369 begin');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual ANIMATION_CATEGORIES[4].url=${ANIMATION_CATEGORIES[4].url}`);
      expect(ANIMATION_CATEGORIES[4].url).assertEqual('pages/animations/motionPathSample/MotionPathSample');
      log('testCategoryUrl0369 end');
    })

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_CATEGORYURL_0370
     * @tc.name      testCategoryUrl0370
     * @tc.desc      Verify global method titles carry positive resource ids.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testCategoryUrl0370', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testCategoryUrl0370 begin');
      let allPositive: boolean = true;
      GLOBAL_METHOD_CATEGORIES.forEach((group: ThirdLevelCategory) => {
        if (group.title.id <= 0) {
          allPositive = false;
        }
      });
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue allPositive=${allPositive}`);
      expect(allPositive).assertTrue();
      log('testCategoryUrl0370 end');
    })

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_CATEGORYURL_0371
     * @tc.name      testCategoryUrl0371
     * @tc.desc      Verify universal group titles carry positive resource ids.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testCategoryUrl0371', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testCategoryUrl0371 begin');
      let allPositive: boolean = true;
      UNIVERSAL_CATEGORIES.forEach((group: SecondLevelCategory) => {
        if (group.title.id <= 0) {
          allPositive = false;
        }
      });
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue allPositive=${allPositive}`);
      expect(allPositive).assertTrue();
      log('testCategoryUrl0371 end');
    })

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_CATEGORYURL_0372
     * @tc.name      testCategoryUrl0372
     * @tc.desc      Verify the page transition entry is the first transition sample.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testCategoryUrl0372', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testCategoryUrl0372 begin');
      const transitionGroup: ThirdLevelCategory = ANIMATION_CATEGORIES[0];
      const children: FourthLevelCategory[] = transitionGroup.childNodes as FourthLevelCategory[];
      hilog.info(DOMAIN, TAG, '%{public}s', `assert children[0].url=${children[0].url}`);
      expect(children[0].url).assertEqual(
        'pages/animations/TransitionAnimations/pageTransitionSample/PageTransitionSample');
      log('testCategoryUrl0372 end');
    })
  })
}
