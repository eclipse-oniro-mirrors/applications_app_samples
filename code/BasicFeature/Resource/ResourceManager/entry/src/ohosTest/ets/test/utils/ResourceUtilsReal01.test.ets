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
import { resourceManager } from '@kit.LocalizationKit';
import { ResourceUtils } from '../../../../main/ets/utils/ResourceUtils';

const LOG_DOMAIN: number = 0xF811;
const LOG_TAG: string = '[Sample_ResourceManager]';

/**
 * Hand written anchor suite for ResourceUtils. It pins the documented rules that
 * the generated volume buckets only enumerate, so a rule change cannot silently
 * pass on both sides.
 */
export default function resourceUtilsReal01Test() {
  describe('ResourceUtilsReal01Test', () => {
    /**
     * @tc.name   testResourceUtils0001
     * @tc.number SUB_RESMGR_UTILS_REAL_0001
     * @tc.desc   density 0 / negative / fractional fall back to DEFAULT_DENSITY
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('testResourceUtils0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtils0001 begin');
      expect(ResourceUtils.DEFAULT_DENSITY).assertEqual(320);
      expect(ResourceUtils.normalizeDensity(0)).assertEqual(320);
      expect(ResourceUtils.normalizeDensity(-1)).assertEqual(320);
      expect(ResourceUtils.normalizeDensity(160.5)).assertEqual(320);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtils0001 end');
    });

    /**
     * @tc.name   testResourceUtils0002
     * @tc.number SUB_RESMGR_UTILS_REAL_0002
     * @tc.desc   density mirrors the highest bucket not above the request
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('testResourceUtils0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtils0002 begin');
      expect(ResourceUtils.normalizeDensity(121)).assertEqual(120);
      expect(ResourceUtils.normalizeDensity(200)).assertEqual(160);
      expect(ResourceUtils.normalizeDensity(639)).assertEqual(480);
      expect(ResourceUtils.normalizeDensity(641)).assertEqual(640);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtils0002 end');
    });

    /**
     * @tc.name   testResourceUtils0003
     * @tc.number SUB_RESMGR_UTILS_REAL_0003
     * @tc.desc   State: normalizeDensity is idempotent on every shipped bucket
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('testResourceUtils0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtils0003 begin');
      expect(ResourceUtils.DENSITY_BUCKETS.length).assertEqual(6);
      for (let index: number = 0; index < ResourceUtils.DENSITY_BUCKETS.length; index++) {
        const bucket: number = ResourceUtils.DENSITY_BUCKETS[index];
        expect(ResourceUtils.normalizeDensity(bucket)).assertEqual(bucket);
        expect(ResourceUtils.isDensitySupported(bucket)).assertTrue();
        hilog.info(LOG_DOMAIN, LOG_TAG, 'bucket=%{public}d scale=%{public}f',
          bucket, ResourceUtils.densityToScale(bucket));
      }
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtils0003 end');
    });

    /**
     * @tc.name   testResourceUtils0004
     * @tc.number SUB_RESMGR_UTILS_REAL_0004
     * @tc.desc   Scale: 160dpi is the baseline, 320dpi doubles, 120dpi shrinks to 0.75
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('testResourceUtils0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtils0004 begin');
      expect(ResourceUtils.densityToScale(160)).assertEqual(1);
      expect(ResourceUtils.densityToScale(320)).assertEqual(2);
      expect(ResourceUtils.densityToScale(640)).assertEqual(4);
      expect(ResourceUtils.densityToScale(120)).assertEqual(0.75);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtils0004 end');
    });

    /**
     * @tc.name   testResourceUtils0005
     * @tc.number SUB_RESMGR_UTILS_REAL_0005
     * @tc.desc   Showcase: app_icon size 6790 B renders as 6.6 KB, base64 9078 chars as 8.8 KB
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('testResourceUtils0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtils0005 begin');
      const mediaSize: string = ResourceUtils.formatByteSize(6790);
      const base64Size: string = ResourceUtils.formatByteSize(9078);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'mediaSize=%{public}s base64Size=%{public}s', mediaSize, base64Size);
      expect(mediaSize).assertEqual('6.6 KB');
      expect(base64Size).assertEqual('8.8 KB');
      expect(mediaSize.endsWith('KB')).assertTrue();
      expect(base64Size.indexOf('.')).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtils0005 end');
    });

    /**
     * @tc.name   testResourceUtils0006
     * @tc.number SUB_RESMGR_UTILS_REAL_0006
     * @tc.desc   Boundary: 1023 / 1024 / 1048575 / 1048576 sit on the unit edges
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('testResourceUtils0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtils0006 begin');
      expect(ResourceUtils.formatByteSize(1023)).assertEqual('1023 B');
      expect(ResourceUtils.formatByteSize(1024)).assertEqual('1.0 KB');
      expect(ResourceUtils.formatByteSize(1048575)).assertEqual('1023.9 KB');
      expect(ResourceUtils.formatByteSize(1048576)).assertEqual('1.0 MB');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtils0006 end');
    });

    /**
     * @tc.name   testResourceUtils0007
     * @tc.number SUB_RESMGR_UTILS_REAL_0007
     * @tc.desc   Negative: zero / negative / fractional byte counts are rejected
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('testResourceUtils0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtils0007 begin');
      expect(ResourceUtils.formatByteSize(0)).assertEqual('0 B');
      expect(ResourceUtils.formatByteSize(-1)).assertEqual('0 B');
      expect(ResourceUtils.formatByteSize(1024.5)).assertEqual('0 B');
      expect(ResourceUtils.expectedBase64Length(0)).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtils0007 end');
    });

    /**
     * @tc.name   testResourceUtils0008
     * @tc.number SUB_RESMGR_UTILS_REAL_0008
     * @tc.desc   Showcase: base64 length round trip for the 1/2/3 byte remainder classes
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('testResourceUtils0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtils0008 begin');
      expect(ResourceUtils.expectedBase64Length(1)).assertEqual(4);
      expect(ResourceUtils.expectedBase64Length(2)).assertEqual(4);
      expect(ResourceUtils.expectedBase64Length(3)).assertEqual(4);
      expect(ResourceUtils.expectedBase64Length(4)).assertEqual(8);
      expect(ResourceUtils.decodedByteLength('TQ==')).assertEqual(1);
      expect(ResourceUtils.decodedByteLength('TWE=')).assertEqual(2);
      expect(ResourceUtils.decodedByteLength('TWFu')).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtils0008 end');
    });

    /**
     * @tc.name   testResourceUtils0009
     * @tc.number SUB_RESMGR_UTILS_REAL_0009
     * @tc.desc   Negative: malformed base64 reports -1 instead of a silent zero
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('testResourceUtils0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtils0009 begin');
      expect(ResourceUtils.decodedByteLength('')).assertEqual(-1);
      expect(ResourceUtils.decodedByteLength('abc')).assertEqual(-1);
      expect(ResourceUtils.decodedByteLength('abcde')).assertEqual(-1);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtils0009 end');
    });

    /**
     * @tc.name   testResourceUtils0010
     * @tc.number SUB_RESMGR_UTILS_REAL_0010
     * @tc.desc   Plural: the three shipped quantities map onto zero / one / other
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('testResourceUtils0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtils0010 begin');
      expect(ResourceUtils.pluralBranchOf(0)).assertEqual('zero');
      expect(ResourceUtils.pluralBranchOf(1)).assertEqual('one');
      expect(ResourceUtils.pluralBranchOf(2)).assertEqual('other');
      expect(ResourceUtils.pluralBranchOf(1024)).assertEqual('other');
      expect(ResourceUtils.pluralBranchOf(-1)).assertEqual('invalid');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtils0010 end');
    });

    /**
     * @tc.name   testResourceUtils0011
     * @tc.number SUB_RESMGR_UTILS_REAL_0011
     * @tc.desc   blank placeholder word falls back, long word is cut at 16 chars
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('testResourceUtils0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtils0011 begin');
      expect(ResourceUtils.sanitizeWorld('')).assertEqual('world');
      expect(ResourceUtils.sanitizeWorld('   ')).assertEqual('world');
      expect(ResourceUtils.sanitizeWorld('  world  ')).assertEqual('world');
      expect(ResourceUtils.sanitizeWorld('abcdefghijklmnopqrstuvwxyz')).assertEqual('abcdefghijklmnop...');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtils0011 end');
    });

    /**
     * @tc.name   testResourceUtils0012
     * @tc.number SUB_RESMGR_UTILS_REAL_0012
     * @tc.desc   Showcase: resource triples compare by bundle / module / id
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('testResourceUtils0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtils0012 begin');
      const first: resourceManager.Resource = { bundleName: 'ohos.samples.resourcemanager', moduleName: 'entry',
        id: 100 };
      const same: resourceManager.Resource = { bundleName: 'ohos.samples.resourcemanager', moduleName: 'entry',
        id: 100 };
      const otherId: resourceManager.Resource = { bundleName: 'ohos.samples.resourcemanager', moduleName: 'entry',
        id: 101 };
      const otherModule: resourceManager.Resource = { bundleName: 'ohos.samples.resourcemanager',
        moduleName: 'entry_test', id: 100 };
      expect(ResourceUtils.resourceKey(first)).assertEqual('ohos.samples.resourcemanager:entry:100');
      expect(ResourceUtils.isSameResource(first, same)).assertTrue();
      expect(ResourceUtils.isSameResource(first, otherId)).assertFalse();
      expect(ResourceUtils.isSameResource(first, otherModule)).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtils0012 end');
    });

    /**
     * @tc.name   testResourceUtils0013
     * @tc.number SUB_RESMGR_UTILS_REAL_0013
     * @tc.desc   Negative: missing bundle or module fields are rendered as '-'
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('testResourceUtils0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtils0013 begin');
      const partial: resourceManager.Resource = { bundleName: '', moduleName: '', id: 7 };
      expect(ResourceUtils.resourceKey(partial)).assertEqual('-:-:7');
      expect(ResourceUtils.resourceKey(partial).split(':').length).assertEqual(3);
      expect(ResourceUtils.isValidPluralNum(0)).assertTrue();
      expect(ResourceUtils.isValidPluralNum(2.5)).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtils0013 end');
    });
  });
}
