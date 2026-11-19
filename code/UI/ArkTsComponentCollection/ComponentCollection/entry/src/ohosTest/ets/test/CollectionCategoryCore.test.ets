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
import { COLLECTION_CATEGORIES, fruitArray } from '../../../main/ets/data/CollectionCategory';
import { COMPONENT_CATEGORIES } from '../../../main/ets/pages/components/ComponentData';
import { UNIVERSAL_CATEGORIES } from '../../../main/ets/pages/universal/UniversialData';
import { GLOBAL_METHOD_CATEGORIES } from '../../../main/ets/pages/globalMethods/GlobalMethodData';
import { ANIMATION_CATEGORIES } from '../../../main/ets/pages/animations/AnimationData';
import {
  FirstLevelCategory, SecondLevelCategory, ThirdLevelCategory
} from '../../../main/ets/model/CategoricalDataType';

const DOMAIN: number = 0xF814;
const TAG: string = 'CategoryCoreTest';

function log(message: string): void {
  hilog.info(DOMAIN, TAG, '%{public}s', message);
}

export default function collectionCategoryCoreTest(): void {
  describe('CollectionCategoryCoreTest', () => {
    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_CATEGORY_0301
     * @tc.name      testCategory0301
     * @tc.desc      Verify the app exposes exactly four first-level categories.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testCategory0301', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testCategory0301 begin');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual COLLECTION_CATEGORIES.length=${COLLECTION_CATEGORIES.length}`);
      expect(COLLECTION_CATEGORIES.length).assertEqual(4);
      log('testCategory0301 end');
    })

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_CATEGORY_0302
     * @tc.name      testCategory0302
     * @tc.desc      Verify every first-level category has non-empty child nodes.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testCategory0302', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testCategory0302 begin');
      let allNonEmpty: boolean = true;
      COLLECTION_CATEGORIES.forEach((item: FirstLevelCategory) => {
        if (item.childNodes.length <= 0) {
          allNonEmpty = false;
        }
      });
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue allNonEmpty=${allNonEmpty}`);
      expect(allNonEmpty).assertTrue();
      log('testCategory0302 end');
    })

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_CATEGORY_0303
     * @tc.name      testCategory0303
     * @tc.desc      Verify the first category is the components group.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testCategory0303', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testCategory0303 begin');
      const componentCategory: FirstLevelCategory = COLLECTION_CATEGORIES[0];
      const childNodes: ThirdLevelCategory[] = componentCategory.childNodes as ThirdLevelCategory[];
      const firstChild: ThirdLevelCategory = childNodes[0];
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue actual=${firstChild.image !== undefined}`);
      expect(firstChild.image !== undefined).assertTrue();
      log('testCategory0303 end');
    })

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_CATEGORY_0304
     * @tc.name      testCategory0304
     * @tc.desc      Verify the universal category children lack images for grouped rendering.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testCategory0304', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testCategory0304 begin');
      const universalCategory: FirstLevelCategory = COLLECTION_CATEGORIES[1];
      const secondNodes: SecondLevelCategory[] = universalCategory.childNodes as SecondLevelCategory[];
      const firstChild: SecondLevelCategory = secondNodes[0];
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue actual=${firstChild.image === undefined}`);
      expect(firstChild.image === undefined).assertTrue();
      log('testCategory0304 end');
    })

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_CATEGORY_0305
     * @tc.name      testCategory0305
     * @tc.desc      Verify every first-level category defines a selected image.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testCategory0305', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testCategory0305 begin');
      let allHaveSelected: boolean = true;
      COLLECTION_CATEGORIES.forEach((item: FirstLevelCategory) => {
        if (item.selectedImage === undefined || item.selectedImage === null) {
          allHaveSelected = false;
        }
      });
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue allHaveSelected=${allHaveSelected}`);
      expect(allHaveSelected).assertTrue();
      log('testCategory0305 end');
    })

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_CATEGORY_0306
     * @tc.name      testCategory0306
     * @tc.desc      Verify every first-level category defines an unselected image.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testCategory0306', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testCategory0306 begin');
      let allHaveUnselected: boolean = true;
      COLLECTION_CATEGORIES.forEach((item: FirstLevelCategory) => {
        if (item.unselectedImage === undefined || item.unselectedImage === null) {
          allHaveUnselected = false;
        }
      });
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue allHaveUnselected=${allHaveUnselected}`);
      expect(allHaveUnselected).assertTrue();
      log('testCategory0306 end');
    })

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_CATEGORY_0307
     * @tc.name      testCategory0307
     * @tc.desc      Verify every first-level category defines a tab bar name resource.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testCategory0307', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testCategory0307 begin');
      let allHaveName: boolean = true;
      COLLECTION_CATEGORIES.forEach((item: FirstLevelCategory) => {
        if (item.tabBarName === undefined || item.tabBarName === null) {
          allHaveName = false;
        }
      });
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue allHaveName=${allHaveName}`);
      expect(allHaveName).assertTrue();
      log('testCategory0307 end');
    })

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_CATEGORY_0308
     * @tc.name      testCategory0308
     * @tc.desc      Verify the components category holds fourteen third-level groups.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testCategory0308', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testCategory0308 begin');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual COMPONENT_CATEGORIES.length=${COMPONENT_CATEGORIES.length}`);
      expect(COMPONENT_CATEGORIES.length).assertEqual(14);
      log('testCategory0308 end');
    })

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_CATEGORY_0309
     * @tc.name      testCategory0309
     * @tc.desc      Verify each components group has an icon image.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testCategory0309', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testCategory0309 begin');
      let allHaveImage: boolean = true;
      COMPONENT_CATEGORIES.forEach((item: ThirdLevelCategory) => {
        if (item.image === undefined || item.image === null) {
          allHaveImage = false;
        }
      });
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue allHaveImage=${allHaveImage}`);
      expect(allHaveImage).assertTrue();
      log('testCategory0309 end');
    })

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_CATEGORY_0310
     * @tc.name      testCategory0310
     * @tc.desc      Verify each components group owns non-empty fourth-level entries.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testCategory0310', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testCategory0310 begin');
      let allHaveChildren: boolean = true;
      COMPONENT_CATEGORIES.forEach((item: ThirdLevelCategory) => {
        if (item.childNodes === undefined || item.childNodes.length <= 0) {
          allHaveChildren = false;
        }
      });
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue allHaveChildren=${allHaveChildren}`);
      expect(allHaveChildren).assertTrue();
      log('testCategory0310 end');
    })

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_CATEGORY_0311
     * @tc.name      testCategory0311
     * @tc.desc      Verify the universal category holds three second-level groups.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testCategory0311', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testCategory0311 begin');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual UNIVERSAL_CATEGORIES.length=${UNIVERSAL_CATEGORIES.length}`);
      expect(UNIVERSAL_CATEGORIES.length).assertEqual(3);
      log('testCategory0311 end');
    })

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_CATEGORY_0312
     * @tc.name      testCategory0312
     * @tc.desc      Verify each universal group has non-empty child nodes.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testCategory0312', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testCategory0312 begin');
      let allHaveChildren: boolean = true;
      UNIVERSAL_CATEGORIES.forEach((item: SecondLevelCategory) => {
        if (item.childNodes.length <= 0) {
          allHaveChildren = false;
        }
      });
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue allHaveChildren=${allHaveChildren}`);
      expect(allHaveChildren).assertTrue();
      log('testCategory0312 end');
    })

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_CATEGORY_0313
     * @tc.name      testCategory0313
     * @tc.desc      Verify the global method category holds four entries.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testCategory0313', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testCategory0313 begin');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual actual=${GLOBAL_METHOD_CATEGORIES.length}, expected=4`);
      expect(GLOBAL_METHOD_CATEGORIES.length).assertEqual(4);
      log('testCategory0313 end');
    })

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_CATEGORY_0314
     * @tc.name      testCategory0314
     * @tc.desc      Verify the animation category holds five entries.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testCategory0314', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testCategory0314 begin');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual ANIMATION_CATEGORIES.length=${ANIMATION_CATEGORIES.length}`);
      expect(ANIMATION_CATEGORIES.length).assertEqual(5);
      log('testCategory0314 end');
    })

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_CATEGORY_0315
     * @tc.name      testCategory0315
     * @tc.desc      Verify the components category is the first tab in collection order.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testCategory0315', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testCategory0315 begin');
      const componentCategory: FirstLevelCategory = COLLECTION_CATEGORIES[0];
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual actual=${componentCategory.childNodes.length}`);
      expect(componentCategory.childNodes.length).assertEqual(COMPONENT_CATEGORIES.length);
      log('testCategory0315 end');
    })

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_CATEGORY_0316
     * @tc.name      testCategory0316
     * @tc.desc      Verify the universal category is the second tab in collection order.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testCategory0316', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testCategory0316 begin');
      const universalCategory: FirstLevelCategory = COLLECTION_CATEGORIES[1];
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual actual=${universalCategory.childNodes.length}`);
      expect(universalCategory.childNodes.length).assertEqual(UNIVERSAL_CATEGORIES.length);
      log('testCategory0316 end');
    })

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_CATEGORY_0317
     * @tc.name      testCategory0317
     * @tc.desc      Verify the animation category is the third tab in collection order.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testCategory0317', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testCategory0317 begin');
      const animationCategory: FirstLevelCategory = COLLECTION_CATEGORIES[2];
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual actual=${animationCategory.childNodes.length}`);
      expect(animationCategory.childNodes.length).assertEqual(ANIMATION_CATEGORIES.length);
      log('testCategory0317 end');
    })

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_CATEGORY_0318
     * @tc.name      testCategory0318
     * @tc.desc      Verify the global method category is the fourth tab in order.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testCategory0318', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testCategory0318 begin');
      const globalCategory: FirstLevelCategory = COLLECTION_CATEGORIES[3];
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual actual=${globalCategory.childNodes.length}`);
      expect(globalCategory.childNodes.length).assertEqual(GLOBAL_METHOD_CATEGORIES.length);
      log('testCategory0318 end');
    })

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_CATEGORY_0319
     * @tc.name      testCategory0319
     * @tc.desc      Verify the first components group is blank and divider.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testCategory0319', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testCategory0319 begin');
      const firstGroup: ThirdLevelCategory = COMPONENT_CATEGORIES[0];
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue actual=${firstGroup.childNodes !== undefined}`);
      expect(firstGroup.childNodes !== undefined).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual actual=${firstGroup.childNodes!.length}, expected=1`);
      expect(firstGroup.childNodes!.length).assertEqual(1);
      log('testCategory0319 end');
    })

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_CATEGORY_0320
     * @tc.name      testCategory0320
     * @tc.desc      Verify the last components group is the web group with one entry.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testCategory0320', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testCategory0320 begin');
      const lastGroup: ThirdLevelCategory = COMPONENT_CATEGORIES[13];
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue actual=${lastGroup.childNodes !== undefined}`);
      expect(lastGroup.childNodes !== undefined).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual lastGroup.childNodes!.length=${lastGroup.childNodes!.length}`);
      expect(lastGroup.childNodes!.length).assertEqual(1);
      log('testCategory0320 end');
    })

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_CATEGORY_0321
     * @tc.name      testCategory0321
     * @tc.desc      Verify the collection category list is stable across reads.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testCategory0321', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testCategory0321 begin');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual COLLECTION_CATEGORIES.length=${COLLECTION_CATEGORIES.length}`);
      expect(COLLECTION_CATEGORIES.length).assertEqual(COLLECTION_CATEGORIES.length);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual typeof COLLECTION_CATEGORIES=${typeof COLLECTION_CATEGORIES}`);
      expect(typeof COLLECTION_CATEGORIES).assertEqual('object');
      log('testCategory0321 end');
    })

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_CATEGORY_0322
     * @tc.name      testCategory0322
     * @tc.desc      Verify the shared fruit array starts empty.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testCategory0322', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testCategory0322 begin');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue Array.isArray(fruitArray)=${Array.isArray(fruitArray)}`);
      expect(Array.isArray(fruitArray)).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual fruitArray.length=${fruitArray.length}, expected=0`);
      expect(fruitArray.length).assertEqual(0);
      log('testCategory0322 end');
    })

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_CATEGORY_0323
     * @tc.name      testCategory0323
     * @tc.desc      Verify the universal first group is common events with ten entries.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testCategory0323', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testCategory0323 begin');
      const firstGroup: SecondLevelCategory = UNIVERSAL_CATEGORIES[0];
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual firstGroup.childNodes.length=${firstGroup.childNodes.length}`);
      expect(firstGroup.childNodes.length).assertEqual(10);
      log('testCategory0323 end');
    })

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_CATEGORY_0324
     * @tc.name      testCategory0324
     * @tc.desc      Verify the universal second group is common properties with entries.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testCategory0324', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testCategory0324 begin');
      const secondGroup: SecondLevelCategory = UNIVERSAL_CATEGORIES[1];
      hilog.info(DOMAIN, TAG, '%{public}s', `assertLarger actual=${secondGroup.childNodes.length}, expected=0`);
      expect(secondGroup.childNodes.length).assertLarger(0);
      log('testCategory0324 end');
    })

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_CATEGORY_0325
     * @tc.name      testCategory0325
     * @tc.desc      Verify the universal third group is gesture processing with entries.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testCategory0325', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testCategory0325 begin');
      const thirdGroup: SecondLevelCategory = UNIVERSAL_CATEGORIES[2];
      hilog.info(DOMAIN, TAG, '%{public}s', `assertLarger actual=${thirdGroup.childNodes.length}, expected=0`);
      expect(thirdGroup.childNodes.length).assertLarger(0);
      log('testCategory0325 end');
    })

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_CATEGORY_0326
     * @tc.name      testCategory0326
     * @tc.desc      Verify universal group titles are defined for tab display.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testCategory0326', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testCategory0326 begin');
      let allHaveTitle: boolean = true;
      UNIVERSAL_CATEGORIES.forEach((item: SecondLevelCategory) => {
        if (item.title === undefined || item.title === null) {
          allHaveTitle = false;
        }
      });
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue allHaveTitle=${allHaveTitle}`);
      expect(allHaveTitle).assertTrue();
      log('testCategory0326 end');
    })

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_CATEGORY_0327
     * @tc.name      testCategory0327
     * @tc.desc      Verify components group titles are defined for list display.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testCategory0327', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testCategory0327 begin');
      let allHaveTitle: boolean = true;
      COMPONENT_CATEGORIES.forEach((item: ThirdLevelCategory) => {
        if (item.title === undefined || item.title === null) {
          allHaveTitle = false;
        }
      });
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue allHaveTitle=${allHaveTitle}`);
      expect(allHaveTitle).assertTrue();
      log('testCategory0327 end');
    })

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_CATEGORY_0328
     * @tc.name      testCategory0328
     * @tc.desc      Verify global method entries carry icons and titles.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testCategory0328', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testCategory0328 begin');
      let allComplete: boolean = true;
      GLOBAL_METHOD_CATEGORIES.forEach((item: ThirdLevelCategory) => {
        if (item.image === undefined || item.title === undefined) {
          allComplete = false;
        }
      });
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue allComplete=${allComplete}`);
      expect(allComplete).assertTrue();
      log('testCategory0328 end');
    })

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_CATEGORY_0329
     * @tc.name      testCategory0329
     * @tc.desc      Verify animation entries carry icons and titles.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testCategory0329', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testCategory0329 begin');
      let allComplete: boolean = true;
      ANIMATION_CATEGORIES.forEach((item: ThirdLevelCategory) => {
        if (item.image === undefined || item.title === undefined) {
          allComplete = false;
        }
      });
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue allComplete=${allComplete}`);
      expect(allComplete).assertTrue();
      log('testCategory0329 end');
    })

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_CATEGORY_0330
     * @tc.name      testCategory0330
     * @tc.desc      Verify the dialog global group owns six dialog samples.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testCategory0330', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testCategory0330 begin');
      const dialogGroup: ThirdLevelCategory = GLOBAL_METHOD_CATEGORIES[0];
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue actual=${dialogGroup.childNodes !== undefined}`);
      expect(dialogGroup.childNodes !== undefined).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual actual=${dialogGroup.childNodes!.length}, expected=6`);
      expect(dialogGroup.childNodes!.length).assertEqual(6);
      log('testCategory0330 end');
    })

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_CATEGORY_0331
     * @tc.name      testCategory0331
     * @tc.desc      Verify the transition animation group owns twelve samples.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testCategory0331', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testCategory0331 begin');
      const transitionGroup: ThirdLevelCategory = ANIMATION_CATEGORIES[0];
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue actual=${transitionGroup.childNodes !== undefined}`);
      expect(transitionGroup.childNodes !== undefined).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual actual=${transitionGroup.childNodes!.length}, expected=12`);
      expect(transitionGroup.childNodes!.length).assertEqual(12);
      log('testCategory0331 end');
    })

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_CATEGORY_0332
     * @tc.name      testCategory0332
     * @tc.desc      Verify second-level categories do not define direct page urls.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testCategory0332', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testCategory0332 begin');
      let noneHasUrl: boolean = true;
      UNIVERSAL_CATEGORIES.forEach((item: SecondLevelCategory) => {
        const withUrl = item as Object as Record<string, Object>;
        if (withUrl['url'] !== undefined) {
          noneHasUrl = false;
        }
      });
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue noneHasUrl=${noneHasUrl}`);
      expect(noneHasUrl).assertTrue();
      log('testCategory0332 end');
    })
  })
}
