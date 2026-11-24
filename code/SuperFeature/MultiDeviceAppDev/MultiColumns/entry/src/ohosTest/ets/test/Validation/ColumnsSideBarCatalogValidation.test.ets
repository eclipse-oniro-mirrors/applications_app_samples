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

import { describe, it, expect, beforeEach } from '@ohos/hypium';
import hilog from '@ohos.hilog';
import {
  ColumnsSideBarModel,
  ColumnsBreakpoint,
  COLUMNS_MAIL_COUNTS,
  COLUMNS_MAIL_TOTAL,
  COLUMNS_PHOTO_COUNTS,
  COLUMNS_PHOTO_TOTAL,
  COLUMNS_ACCOUNTS,
  COLUMNS_NAV_BAR_WIDTH,
  COLUMNS_BREAKPOINTS
} from '../Shared/ColumnsSideBarModel';

const DATASET = 'ColumnsSideBarCatalogValidation';
const DOMAIN: number = 0xF801;
const TAG: string = '[ColumnsSideBarCatalog]';

export default function columnsSideBarCatalogValidationSuite() {
  describe('ColumnsSideBarCatalogValidation', () => {
    let m: ColumnsSideBarModel = new ColumnsSideBarModel();

    beforeEach(() => {
      m = new ColumnsSideBarModel();
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_1911
     * @tc.name    ColumnsSideBarCatalogValidation1
     * @tc.desc    mail sidebar ships four folders
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it(DATASET + 'mail1', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      expect(m.mailKinds()).assertEqual(4);
      expect(m.mailKinds()).assertEqual(COLUMNS_MAIL_COUNTS.length);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_1912
     * @tc.name    ColumnsSideBarCatalogValidation2
     * @tc.desc    received, unread and sent counters match the sidebar data
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it(DATASET + 'mail2', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      expect(m.mailCountOf(0)).assertEqual(3);
      expect(m.mailCountOf(1)).assertEqual(5);
      expect(m.mailCountOf(2)).assertEqual(9);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_1913
     * @tc.name    ColumnsSideBarCatalogValidation3
     * @tc.desc    all folders entry carries no counter
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it(DATASET + 'mail3', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      expect(m.mailCountOf(3)).assertEqual(0);
      expect(m.mailCountOf(3)).assertEqual(COLUMNS_MAIL_COUNTS[3]);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_1914
     * @tc.name    ColumnsSideBarCatalogValidation4
     * @tc.desc    mail counters sum to seventeen messages
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it(DATASET + 'mail4', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      expect(m.totalMailNum()).assertEqual(17);
      expect(m.totalMailNum()).assertEqual(COLUMNS_MAIL_TOTAL);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_1915
     * @tc.name    ColumnsSideBarCatalogValidation5
     * @tc.desc    three folders report pending messages
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it(DATASET + 'mail5', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      expect(m.nonEmptyMailKinds()).assertEqual(3);
      expect(m.nonEmptyMailKinds() < m.mailKinds()).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_1916
     * @tc.name    ColumnsSideBarCatalogValidation6
     * @tc.desc    sent folder is the largest counter
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it(DATASET + 'mail6', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      expect(m.largestMailIndex()).assertEqual(2);
      expect(m.mailCountOf(m.largestMailIndex())).assertEqual(9);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_1917
     * @tc.name    ColumnsSideBarCatalogValidation7
     * @tc.desc    all folders entry is the smallest counter
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it(DATASET + 'mail7', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      expect(m.smallestMailIndex()).assertEqual(3);
      expect(m.mailCountOf(m.smallestMailIndex())).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_1918
     * @tc.name    ColumnsSideBarCatalogValidation8
     * @tc.desc    mail counter lookup past the tail reports minus one
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it(DATASET + 'mail8', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      expect(m.mailCountOf(4)).assertEqual(-1);
      expect(m.mailCountOf(-1)).assertEqual(-1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_1919
     * @tc.name    ColumnsSideBarCatalogValidation9
     * @tc.desc    mail folder names follow the data order
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it(DATASET + 'mail9', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      expect(m.mailNameOf(0)).assertEqual('mail0');
      expect(m.mailNameOf(3)).assertEqual('mail3');
      expect(m.mailNameOf(4)).assertEqual('');
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_1920
     * @tc.name    ColumnsSideBarCatalogValidation10
     * @tc.desc    average mail counter stays at four and a quarter
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it(DATASET + 'mail10', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      expect(Math.abs(m.averageMailCount() * 4 - m.totalMailNum()) < 1e-9).assertTrue();
      expect(m.averageMailCount() > 4).assertTrue();
      expect(m.averageMailCount() < 5).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_1921
     * @tc.name    ColumnsSideBarCatalogValidation11
     * @tc.desc    sidebar lists two mail accounts
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it(DATASET + 'account1', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      expect(COLUMNS_ACCOUNTS.length).assertEqual(2);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_1922
     * @tc.name    ColumnsSideBarCatalogValidation12
     * @tc.desc    both accounts carry a complete address
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it(DATASET + 'account2', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      expect(COLUMNS_ACCOUNTS[0]).assertEqual('jiaozi@xxx.com');
      expect(COLUMNS_ACCOUNTS[1]).assertEqual('jiaozi@163.com');
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_1923
     * @tc.name    ColumnsSideBarCatalogValidation13
     * @tc.desc    every account contains the at sign
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it(DATASET + 'account3', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      let withAt: number = 0;
      for (let i = 0; i < COLUMNS_ACCOUNTS.length; i++) {
        if (COLUMNS_ACCOUNTS[i].indexOf('@') > 0) {
          withAt++;
        }
      }
      expect(withAt).assertEqual(2);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_1924
     * @tc.name    ColumnsSideBarCatalogValidation14
     * @tc.desc    account entries are unique
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it(DATASET + 'account4', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const unique: Set<string> = new Set<string>();
      for (let i = 0; i < COLUMNS_ACCOUNTS.length; i++) {
        unique.add(COLUMNS_ACCOUNTS[i]);
      }
      expect(unique.size).assertEqual(COLUMNS_ACCOUNTS.length);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_1925
     * @tc.name    ColumnsSideBarCatalogValidation15
     * @tc.desc    photo sidebar ships nine groups
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it(DATASET + 'photo1', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      expect(m.photoKinds()).assertEqual(9);
      expect(m.photoKinds()).assertEqual(COLUMNS_PHOTO_COUNTS.length);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_1926
     * @tc.name    ColumnsSideBarCatalogValidation16
     * @tc.desc    picture album dominates the photo counters
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it(DATASET + 'photo2', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      expect(m.photoCountOf(0)).assertEqual(1234);
      expect(m.photoCountOf(0)).assertEqual(COLUMNS_PHOTO_COUNTS[0]);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_1927
     * @tc.name    ColumnsSideBarCatalogValidation17
     * @tc.desc    video and collect groups stay small
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it(DATASET + 'photo3', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      expect(m.photoCountOf(1)).assertEqual(12);
      expect(m.photoCountOf(2)).assertEqual(7);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_1928
     * @tc.name    ColumnsSideBarCatalogValidation18
     * @tc.desc    new album and avatar groups differ in size
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it(DATASET + 'photo4', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      expect(m.photoCountOf(3)).assertEqual(11);
      expect(m.photoCountOf(4)).assertEqual(223);
      expect(m.photoCountOf(4) > m.photoCountOf(3)).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_1929
     * @tc.name    ColumnsSideBarCatalogValidation19
     * @tc.desc    tail groups keep the last three counters
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it(DATASET + 'photo5', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      expect(m.photoCountOf(6)).assertEqual(234);
      expect(m.photoCountOf(7)).assertEqual(22);
      expect(m.photoCountOf(8)).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_1930
     * @tc.name    ColumnsSideBarCatalogValidation20
     * @tc.desc    photo counters sum to 1869 items
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it(DATASET + 'photo6', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      expect(m.totalPhotoCount()).assertEqual(1869);
      expect(m.totalPhotoCount()).assertEqual(COLUMNS_PHOTO_TOTAL);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_1931
     * @tc.name    ColumnsSideBarCatalogValidation21
     * @tc.desc    largest photo group is the album
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it(DATASET + 'photo7', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      expect(m.largestPhotoIndex()).assertEqual(0);
      expect(m.photoCountOf(m.largestPhotoIndex())).assertEqual(1234);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_1932
     * @tc.name    ColumnsSideBarCatalogValidation22
     * @tc.desc    smallest photo group is the single hidden item
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it(DATASET + 'photo8', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      expect(m.smallestPhotoIndex()).assertEqual(8);
      expect(m.photoCountOf(m.smallestPhotoIndex())).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_1933
     * @tc.name    ColumnsSideBarCatalogValidation23
     * @tc.desc    four groups exceed one hundred items
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it(DATASET + 'photo9', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      expect(m.photoCountAbove(100)).assertEqual(4);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_1934
     * @tc.name    ColumnsSideBarCatalogValidation24
     * @tc.desc    three groups exceed two hundred items
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it(DATASET + 'photo10', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      expect(m.photoCountAbove(200)).assertEqual(3);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_1935
     * @tc.name    ColumnsSideBarCatalogValidation25
     * @tc.desc    only the album exceeds one thousand items
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it(DATASET + 'photo11', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      expect(m.photoCountAbove(1000)).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_1936
     * @tc.name    ColumnsSideBarCatalogValidation26
     * @tc.desc    every photo counter is positive
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it(DATASET + 'photo12', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      expect(m.photoCountAbove(0)).assertEqual(m.photoKinds());
      expect(m.isCountValid(1)).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_1937
     * @tc.name    ColumnsSideBarCatalogValidation27
     * @tc.desc    photo counter lookup past the tail reports minus one
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it(DATASET + 'photo13', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      expect(m.photoCountOf(9)).assertEqual(-1);
      expect(m.photoCountOf(-1)).assertEqual(-1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_1938
     * @tc.name    ColumnsSideBarCatalogValidation28
     * @tc.desc    photo group names follow the catalog order
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it(DATASET + 'photo14', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      expect(m.photoNameOf(0)).assertEqual('photo0');
      expect(m.photoNameOf(8)).assertEqual('photo8');
      expect(m.photoNameOf(9)).assertEqual('');
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_1939
     * @tc.name    ColumnsSideBarCatalogValidation29
     * @tc.desc    average photo group stays between 207 and 208
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it(DATASET + 'photo15', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      expect(Math.floor(m.averagePhotoCount())).assertEqual(207);
      expect(Math.ceil(m.averagePhotoCount())).assertEqual(208);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_1940
     * @tc.name    ColumnsSideBarCatalogValidation30
     * @tc.desc    photo counters are all distinct
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it(DATASET + 'photo16', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      expect(m.hasUniqueCounts()).assertTrue();
      expect(m.photoKinds()).assertEqual(9);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_1941
     * @tc.name    ColumnsSideBarCatalogValidation31
     * @tc.desc    zero is rejected as a photo counter
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it(DATASET + 'photo17', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      expect(m.isCountValid(0)).assertFalse();
      expect(m.isCountValid(-3)).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_1942
     * @tc.name    ColumnsSideBarCatalogValidation32
     * @tc.desc    empty prefix is zero
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it(DATASET + 'prefix1', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      expect(m.prefixPhotoCount(0)).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_1943
     * @tc.name    ColumnsSideBarCatalogValidation33
     * @tc.desc    single prefix equals the album
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it(DATASET + 'prefix2', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      expect(m.prefixPhotoCount(1)).assertEqual(1234);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_1944
     * @tc.name    ColumnsSideBarCatalogValidation34
     * @tc.desc    two groups prefix adds the video counter
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it(DATASET + 'prefix3', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      expect(m.prefixPhotoCount(2)).assertEqual(1246);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_1945
     * @tc.name    ColumnsSideBarCatalogValidation35
     * @tc.desc    four group prefix reaches 1264
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it(DATASET + 'prefix4', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      expect(m.prefixPhotoCount(4)).assertEqual(1264);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_1946
     * @tc.name    ColumnsSideBarCatalogValidation36
     * @tc.desc    five group prefix reaches 1487
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it(DATASET + 'prefix5', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      expect(m.prefixPhotoCount(5)).assertEqual(1487);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_1947
     * @tc.name    ColumnsSideBarCatalogValidation37
     * @tc.desc    full prefix equals the photo total
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it(DATASET + 'prefix6', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      expect(m.prefixPhotoCount(9)).assertEqual(m.totalPhotoCount());
      expect(m.prefixPhotoCount(9)).assertEqual(1869);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_1948
     * @tc.name    ColumnsSideBarCatalogValidation38
     * @tc.desc    prefix beyond the catalog is clamped
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it(DATASET + 'prefix7', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      expect(m.prefixPhotoCount(10)).assertEqual(1869);
      expect(m.prefixPhotoCount(99)).assertEqual(1869);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_1949
     * @tc.name    ColumnsSideBarCatalogValidation39
     * @tc.desc    prefix delta reproduces each group counter
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it(DATASET + 'prefix8', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      let mismatches: number = 0;
      for (let i = 0; i < m.photoKinds(); i++) {
        if (m.prefixPhotoCount(i + 1) - m.prefixPhotoCount(i) !== m.photoCountOf(i)) {
          mismatches++;
        }
      }
      expect(mismatches).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_1950
     * @tc.name    ColumnsSideBarCatalogValidation40
     * @tc.desc    descending order starts with the album
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it(DATASET + 'order1', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const order: number[] = m.orderPhotoDesc();
      expect(order[0]).assertEqual(0);
      expect(m.photoCountOf(order[0])).assertEqual(1234);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_1951
     * @tc.name    ColumnsSideBarCatalogValidation41
     * @tc.desc    descending order ranks the address group second
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it(DATASET + 'order2', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const order: number[] = m.orderPhotoDesc();
      expect(order[1]).assertEqual(6);
      expect(m.photoCountOf(order[1])).assertEqual(234);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_1952
     * @tc.name    ColumnsSideBarCatalogValidation42
     * @tc.desc    descending order ranks the avatar group third
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it(DATASET + 'order3', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const order: number[] = m.orderPhotoDesc();
      expect(order[2]).assertEqual(4);
      expect(m.photoCountOf(order[2])).assertEqual(223);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_1953
     * @tc.name    ColumnsSideBarCatalogValidation43
     * @tc.desc    descending order ends with the hidden item
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it(DATASET + 'order4', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const order: number[] = m.orderPhotoDesc();
      expect(order[order.length - 1]).assertEqual(8);
      expect(m.photoCountOf(order[order.length - 1])).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_1954
     * @tc.name    ColumnsSideBarCatalogValidation44
     * @tc.desc    descending order is monotonically non increasing
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it(DATASET + 'order5', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const order: number[] = m.orderPhotoDesc();
      let monotonic: boolean = true;
      for (let i = 1; i < order.length; i++) {
        if (m.photoCountOf(order[i - 1]) < m.photoCountOf(order[i])) {
          monotonic = false;
        }
      }
      expect(monotonic).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_1955
     * @tc.name    ColumnsSideBarCatalogValidation45
     * @tc.desc    ascending order starts with the hidden item
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it(DATASET + 'order6', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const order: number[] = m.orderPhotoAsc();
      expect(order[0]).assertEqual(8);
      expect(m.photoCountOf(order[0])).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_1956
     * @tc.name    ColumnsSideBarCatalogValidation46
     * @tc.desc    ascending order ends with the album
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it(DATASET + 'order7', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const order: number[] = m.orderPhotoAsc();
      expect(order[order.length - 1]).assertEqual(0);
      expect(m.photoCountOf(order[order.length - 1])).assertEqual(1234);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_1957
     * @tc.name    ColumnsSideBarCatalogValidation47
     * @tc.desc    both orders are permutations of the same nine groups
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it(DATASET + 'order8', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const desc: number[] = m.orderPhotoDesc();
      const asc: number[] = m.orderPhotoAsc();
      const seen: Set<number> = new Set<number>();
      for (let i = 0; i < desc.length; i++) {
        seen.add(desc[i]);
      }
      for (let i = 0; i < asc.length; i++) {
        seen.add(asc[i]);
      }
      expect(seen.size).assertEqual(9);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_1958
     * @tc.name    ColumnsSideBarCatalogValidation48
     * @tc.desc    sorting does not mutate the underlying counters
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it(DATASET + 'order9', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      m.orderPhotoDesc();
      m.orderPhotoAsc();
      expect(m.photoCountOf(0)).assertEqual(1234);
      expect(m.photoCountOf(8)).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_1959
     * @tc.name    ColumnsSideBarCatalogValidation49
     * @tc.desc    sm resolves a 321 vp navigation bar
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it(DATASET + 'bp1', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      expect(ColumnsSideBarModel.navBarWidthOf('sm')).assertEqual(321);
      expect(ColumnsSideBarModel.navBarWidthOf('sm')).assertEqual(COLUMNS_NAV_BAR_WIDTH[0]);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_1960
     * @tc.name    ColumnsSideBarCatalogValidation50
     * @tc.desc    md keeps the 321 vp navigation bar
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it(DATASET + 'bp2', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      expect(ColumnsSideBarModel.navBarWidthOf('md')).assertEqual(321);
      expect(ColumnsSideBarModel.navBarWidthOf('md')).assertEqual(COLUMNS_NAV_BAR_WIDTH[1]);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_1961
     * @tc.name    ColumnsSideBarCatalogValidation51
     * @tc.desc    lg widens the navigation bar to 390 vp
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it(DATASET + 'bp3', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      expect(ColumnsSideBarModel.navBarWidthOf('lg')).assertEqual(390);
      expect(ColumnsSideBarModel.navBarWidthOf('lg') > ColumnsSideBarModel.navBarWidthOf('md')).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_1962
     * @tc.name    ColumnsSideBarCatalogValidation52
     * @tc.desc    unknown breakpoint reports minus one
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it(DATASET + 'bp4', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      expect(ColumnsSideBarModel.navBarWidthOf('')).assertEqual(-1);
      expect(ColumnsSideBarModel.navBarWidthOf('xl')).assertEqual(-1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_1963
     * @tc.name    ColumnsSideBarCatalogValidation53
     * @tc.desc    sm and md share one navigation bar width
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it(DATASET + 'bp5', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      expect(ColumnsSideBarModel.navBarWidthOf('sm')).assertEqual(ColumnsSideBarModel.navBarWidthOf('md'));
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_1964
     * @tc.name    ColumnsSideBarCatalogValidation54
     * @tc.desc    width table trace matches the declared three values
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it(DATASET + 'bp6', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      let trace: string = '';
      for (let i = 0; i < COLUMNS_BREAKPOINTS.length; i++) {
        trace += String(ColumnsSideBarModel.navBarWidthOf(COLUMNS_BREAKPOINTS[i])) + ',';
      }
      expect(trace).assertEqual('321,321,390,');
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_1965
     * @tc.name    ColumnsSideBarCatalogValidation55
     * @tc.desc    side bar is shown only on the large breakpoint
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it(DATASET + 'bp7', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      expect(ColumnsSideBarModel.shouldShowSideBar('lg')).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_1966
     * @tc.name    ColumnsSideBarCatalogValidation56
     * @tc.desc    compact and medium breakpoints hide the side bar
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it(DATASET + 'bp8', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      expect(ColumnsSideBarModel.shouldShowSideBar('sm')).assertFalse();
      expect(ColumnsSideBarModel.shouldShowSideBar('md')).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_1967
     * @tc.name    ColumnsSideBarCatalogValidation57
     * @tc.desc    unknown breakpoint hides the side bar
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it(DATASET + 'bp9', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      expect(ColumnsSideBarModel.shouldShowSideBar('')).assertFalse();
      expect(ColumnsSideBarModel.shouldShowSideBar('xl')).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_1968
     * @tc.name    ColumnsSideBarCatalogValidation58
     * @tc.desc    visibility trace exposes a single visible breakpoint
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it(DATASET + 'bp10', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      let visible: number = 0;
      for (let i = 0; i < COLUMNS_BREAKPOINTS.length; i++) {
        if (ColumnsSideBarModel.shouldShowSideBar(COLUMNS_BREAKPOINTS[i])) {
          visible++;
        }
      }
      expect(visible).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_1969
     * @tc.name    ColumnsSideBarCatalogValidation59
     * @tc.desc    generic payload resolves per breakpoint
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it(DATASET + 'bp11', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const bp: ColumnsBreakpoint<string> = new ColumnsBreakpoint<string>('a', 'b', 'c');
      expect(bp.getValue('sm')).assertEqual('a');
      expect(bp.getValue('md')).assertEqual('b');
      expect(bp.getValue('lg')).assertEqual('c');
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_1970
     * @tc.name    ColumnsSideBarCatalogValidation60
     * @tc.desc    generic lookup rejects unknown breakpoints
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it(DATASET + 'bp12', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const bp: ColumnsBreakpoint<number> = new ColumnsBreakpoint<number>(1, 2, 3);
      expect(bp.getValue('xl') === undefined).assertTrue();
      expect(bp.getValue('') === undefined).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_1971
     * @tc.name    ColumnsSideBarCatalogValidation61
     * @tc.desc    generic lookup is case sensitive
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it(DATASET + 'bp13', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const bp: ColumnsBreakpoint<number> = new ColumnsBreakpoint<number>(1, 2, 3);
      expect(bp.getValue('SM') === undefined).assertTrue();
      expect(bp.getValue('Lg') === undefined).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_1972
     * @tc.name    ColumnsSideBarCatalogValidation62
     * @tc.desc    boolean payloads resolve per breakpoint
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it(DATASET + 'bp14', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const bp: ColumnsBreakpoint<boolean> = new ColumnsBreakpoint<boolean>(true, false, true);
      expect(bp.getValue('sm')).assertTrue();
      expect(bp.getValue('md')).assertFalse();
      expect(bp.getValue('lg')).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_1973
     * @tc.name    ColumnsSideBarCatalogValidation63
     * @tc.desc    falsy payloads are preserved
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it(DATASET + 'bp15', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const bp: ColumnsBreakpoint<number> = new ColumnsBreakpoint<number>(0, 0, 0);
      expect(bp.getValue('sm')).assertEqual(0);
      expect(bp.getValue('lg')).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_1974
     * @tc.name    ColumnsSideBarCatalogValidation64
     * @tc.desc    nested generic resolves the inner table
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it(DATASET + 'bp16', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const inner: ColumnsBreakpoint<number> = new ColumnsBreakpoint<number>(321, 321, 390);
      const outer: ColumnsBreakpoint<ColumnsBreakpoint<number>> = new ColumnsBreakpoint<ColumnsBreakpoint<number>>(
        inner, inner, inner);
      const resolved: ColumnsBreakpoint<number> | undefined = outer.getValue('lg');
      expect(resolved === undefined ? -1 : resolved.getValue('lg')).assertEqual(390);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_1975
     * @tc.name    ColumnsSideBarCatalogValidation65
     * @tc.desc    mail and photo catalogs are sized independently
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it(DATASET + 'combined1', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      expect(m.mailKinds() + m.photoKinds()).assertEqual(13);
      expect(m.photoKinds() > m.mailKinds()).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_1976
     * @tc.name    ColumnsSideBarCatalogValidation66
     * @tc.desc    one album outnumbers the whole mail catalog
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it(DATASET + 'combined2', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      expect(m.photoCountOf(0) > m.totalMailNum()).assertTrue();
      expect(m.photoCountOf(0) - m.totalMailNum()).assertEqual(1217);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_1977
     * @tc.name    ColumnsSideBarCatalogValidation67
     * @tc.desc    combined counters reach 1886 items
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it(DATASET + 'combined3', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      expect(m.totalMailNum() + m.totalPhotoCount()).assertEqual(1886);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_1978
     * @tc.name    ColumnsSideBarCatalogValidation68
     * @tc.desc    empty folder contributes nothing to the mail total
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it(DATASET + 'combined4', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      expect(m.mailCountOf(3)).assertEqual(0);
      expect(m.totalMailNum()).assertEqual(m.mailCountOf(0) + m.mailCountOf(1) + m.mailCountOf(2));
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_1979
     * @tc.name    ColumnsSideBarCatalogValidation69
     * @tc.desc    mail span between extremes is nine messages
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it(DATASET + 'combined5', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      expect(m.mailCountOf(m.largestMailIndex()) - m.mailCountOf(m.smallestMailIndex())).assertEqual(9);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_1980
     * @tc.name    ColumnsSideBarCatalogValidation70
     * @tc.desc    photo span between extremes is 1233 items
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it(DATASET + 'combined6', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      expect(m.photoCountOf(m.largestPhotoIndex()) - m.photoCountOf(m.smallestPhotoIndex())).assertEqual(1233);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_1981
     * @tc.name    ColumnsSideBarCatalogValidation71
     * @tc.desc    groups above one hundred items are the four large folders
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it(DATASET + 'combined7', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      expect(m.photoCountAbove(100)).assertEqual(4);
      expect(m.photoCountAbove(1234)).assertEqual(0);
      expect(m.photoCountAbove(1233)).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_1982
     * @tc.name    ColumnsSideBarCatalogValidation72
     * @tc.desc    catalog rebuild is deterministic
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it(DATASET + 'combined8', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const other: ColumnsSideBarModel = new ColumnsSideBarModel();
      expect(other.totalPhotoCount()).assertEqual(m.totalPhotoCount());
      expect(other.mailCountOf(2)).assertEqual(m.mailCountOf(2));
      expect(other.orderPhotoDesc()[0]).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    })
  })
}
