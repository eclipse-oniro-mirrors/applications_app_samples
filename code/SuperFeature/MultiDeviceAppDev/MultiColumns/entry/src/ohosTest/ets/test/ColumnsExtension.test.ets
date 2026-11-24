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

import { describe, it, expect } from '@ohos/hypium';
import { BreakpointType } from '../../../main/ets/common/BreakpointSystem';
import { MailType, OperateTabs, photoType } from '../../../main/ets/model/dataType';
import {
  COLUMNS_MAIL_KINDS,
  COLUMNS_NAVBAR_RATIO,
  COLUMNS_PHOTO_KINDS,
  ColumnsMailType,
  ColumnsModel,
  ColumnsPhotoType
} from './Shared/ColumnsModel';
import {
  averageOf,
  DELAY_LAUNCH,
  DELAY_NAV,
  DELAY_RESIZE,
  DELAY_TOUCH,
  rangeOf,
  resolveBreakpoint,
  safeDivide,
  STABLE_ROUNDS,
  STRESS_ROUNDS,
  TIMEOUT_NAVIGATION,
  TIMEOUT_RENDER,
  TOLERANCE_COUNT,
  TOLERANCE_PX,
  WIDTH_LG,
  WIDTH_MD,
  WIDTH_SM,
  WIDTH_XS
} from './Shared/SharedDriver';

const DATASET = 'ColumnsExtensionTest_';

export default function columnsExtensionSuite() {
  describe('ColumnsFeatureExtension', () => {
    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_1388
     * @tc.name    ColumnsExtension1388
     * @tc.desc    Photo sidebar exposes four photo categories with stable names
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it(DATASET + 'getPhotos_001', 0, () => {
      const m: ColumnsModel = new ColumnsModel();
      const photos: ColumnsPhotoType[] = m.getPhotos();
      expect(photos.length).assertEqual(4);
      const names: string[] = [];
      for (let i = 0; i < photos.length; i++) {
        names.push(photos[i].name);
      }
      expect(names.indexOf('album') >= 0).assertTrue();
      expect(names.indexOf('camera') >= 0).assertTrue();
      expect(names.indexOf('video') >= 0).assertTrue();
      expect(names.indexOf('favorite') >= 0).assertTrue();
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_1389
     * @tc.name    ColumnsExtension1389
     * @tc.desc    getPhotoKinds equals both the literal count and the array length
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it(DATASET + 'getPhotoKinds_001', 0, () => {
      const m: ColumnsModel = new ColumnsModel();
      expect(m.getPhotoKinds()).assertEqual(COLUMNS_PHOTO_KINDS);
      expect(m.getPhotoKinds()).assertEqual(m.getPhotos().length);
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_1390
     * @tc.name    ColumnsExtension1390
     * @tc.desc    getMailKinds equals the literal mail kind count
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it(DATASET + 'getMailKinds_001', 0, () => {
      const m: ColumnsModel = new ColumnsModel();
      expect(m.getMailKinds()).assertEqual(COLUMNS_MAIL_KINDS);
      expect(m.getMailKinds()).assertEqual(m.getMails().length);
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_1391
     * @tc.name    ColumnsExtension1391
     * @tc.desc    Total photo count matches the album data set
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it(DATASET + 'getTotalPhotoCount_001', 0, () => {
      const m: ColumnsModel = new ColumnsModel();
      expect(m.getTotalPhotoCount()).assertEqual(91);
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_1392
     * @tc.name    ColumnsExtension1392
     * @tc.desc    Total mail number equals the manual sum of every mail bucket
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it(DATASET + 'getTotalMailNum_001', 0, () => {
      const m: ColumnsModel = new ColumnsModel();
      const mails: ColumnsMailType[] = m.getMails();
      let sum: number = 0;
      for (let i = 0; i < mails.length; i++) {
        sum += mails[i].num;
      }
      expect(m.getTotalMailNum()).assertEqual(sum);
      expect(m.getTotalMailNum()).assertEqual(23);
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_1393
     * @tc.name    ColumnsExtension1393
     * @tc.desc    Repeated getMails calls expose the same underlying array reference
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it(DATASET + 'getMails_001', 0, () => {
      const m: ColumnsModel = new ColumnsModel();
      expect(m.getMails() === m.getMails()).assertTrue();
      expect(m.getMails().length).assertEqual(m.getMailKinds());
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_1394
     * @tc.name    ColumnsExtension1394
     * @tc.desc    Repeated getPhotos calls expose the same underlying array reference
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it(DATASET + 'getPhotos_002', 0, () => {
      const m: ColumnsModel = new ColumnsModel();
      expect(m.getPhotos() === m.getPhotos()).assertTrue();
      expect(m.getPhotos().length).assertEqual(4);
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_1395
     * @tc.name    ColumnsExtension1395
     * @tc.desc    Default mail buckets all carry non-negative unread counters
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it(DATASET + 'hasValidMailNums_001', 0, () => {
      const m: ColumnsModel = new ColumnsModel();
      expect(m.hasValidMailNums()).assertTrue();
      const mails: ColumnsMailType[] = m.getMails();
      for (let i = 0; i < mails.length; i++) {
        expect(mails[i].num >= 0).assertTrue();
      }
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_1396
     * @tc.name    ColumnsExtension1396
     * @tc.desc    Default photo categories all carry positive counters
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it(DATASET + 'hasPositivePhotoCounts_001', 0, () => {
      const m: ColumnsModel = new ColumnsModel();
      expect(m.hasPositivePhotoCounts()).assertTrue();
      const photos: ColumnsPhotoType[] = m.getPhotos();
      for (let i = 0; i < photos.length; i++) {
        expect(photos[i].count > 0).assertTrue();
      }
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_1397
     * @tc.name    ColumnsExtension1397
     * @tc.desc    Sidebar ratio constant stays inside the open interval zero to one
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it(DATASET + 'isRatioValid_001', 0, () => {
      const m: ColumnsModel = new ColumnsModel();
      expect(m.isRatioValid()).assertTrue();
      expect(COLUMNS_NAVBAR_RATIO > 0).assertTrue();
      expect(COLUMNS_NAVBAR_RATIO < 1).assertTrue();
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_1398
     * @tc.name    ColumnsExtension1398
     * @tc.desc    Navbar and content widths add up to the window width on common breakpoints
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it(DATASET + 'widthInvariant_001', 0, () => {
      const m: ColumnsModel = new ColumnsModel();
      const widths: number[] = [360, 600, 840, 1280];
      for (let i = 0; i < widths.length; i++) {
        expect(m.navbarWidth(widths[i]) + m.contentWidth(widths[i])).assertEqual(widths[i]);
      }
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_1399
     * @tc.name    ColumnsExtension1399
     * @tc.desc    Zero width yields zero navbar and zero content width
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it(DATASET + 'widthInvariant_002', 0, () => {
      const m: ColumnsModel = new ColumnsModel();
      expect(m.navbarWidth(0)).assertEqual(0);
      expect(m.contentWidth(0)).assertEqual(0);
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_1400
     * @tc.name    ColumnsExtension1400
     * @tc.desc    Navbar occupies exactly forty percent of a thousand vp window
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it(DATASET + 'navbarWidth_001', 0, () => {
      const m: ColumnsModel = new ColumnsModel();
      expect(m.navbarWidth(1000)).assertEqual(400);
      expect(m.contentWidth(1000)).assertEqual(600);
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_1401
     * @tc.name    ColumnsExtension1401
     * @tc.desc    Fractional widths keep the additive width invariant
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'widthInvariant_003', 0, () => {
      const m: ColumnsModel = new ColumnsModel();
      const width: number = 600.4;
      expect(m.isSplitMode(width)).assertTrue();
      expect(Math.abs(m.navbarWidth(width) + m.contentWidth(width) - width) < 0.0001).assertTrue();
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_1402
     * @tc.name    ColumnsExtension1402
     * @tc.desc    Width just below the split threshold keeps single pane mode
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it(DATASET + 'isSplitMode_001', 0, () => {
      const m: ColumnsModel = new ColumnsModel();
      expect(m.isSplitMode(599.999)).assertFalse();
      expect(m.isSplitMode(600.001)).assertTrue();
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_1403
     * @tc.name    ColumnsExtension1403
     * @tc.desc    Negative and huge widths are classified without clamping
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'isSplitMode_002', 0, () => {
      const m: ColumnsModel = new ColumnsModel();
      expect(m.isSplitMode(-1)).assertFalse();
      expect(m.isSplitMode(1000000)).assertTrue();
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_1404
     * @tc.name    ColumnsExtension1404
     * @tc.desc    Leading whitespace is not trimmed when looking a mail bucket up
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'getMailByType_001', 0, () => {
      const m: ColumnsModel = new ColumnsModel();
      expect(m.getMailByType(' inbox') === undefined).assertTrue();
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_1405
     * @tc.name    ColumnsExtension1405
     * @tc.desc    Trailing whitespace is not trimmed when looking a mail bucket up
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'getMailByType_002', 0, () => {
      const m: ColumnsModel = new ColumnsModel();
      expect(m.getMailByType('inbox ') === undefined).assertTrue();
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_1406
     * @tc.name    ColumnsExtension1406
     * @tc.desc    Prefix lookups do not match a longer mail bucket name
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'getMailByType_003', 0, () => {
      const m: ColumnsModel = new ColumnsModel();
      expect(m.getMailByType('inboxx') === undefined).assertTrue();
      expect(m.getMailByType('sen') === undefined).assertTrue();
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_1407
     * @tc.name    ColumnsExtension1407
     * @tc.desc    Draft bucket keeps its own unread count when looked up by exact type
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it(DATASET + 'getMailByType_004', 0, () => {
      const m: ColumnsModel = new ColumnsModel();
      const draft: ColumnsMailType | undefined = m.getMailByType('draft');
      expect(draft !== undefined).assertTrue();
      expect((draft as ColumnsMailType).num).assertEqual(3);
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_1408
     * @tc.name    ColumnsExtension1408
     * @tc.desc    Lookup result is the same object that the mail list exposes
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it(DATASET + 'getMailByType_005', 0, () => {
      const m: ColumnsModel = new ColumnsModel();
      const mails: ColumnsMailType[] = m.getMails();
      const hit: ColumnsMailType | undefined = m.getMailByType('sent');
      expect((hit as ColumnsMailType) === mails[1]).assertTrue();
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_1409
     * @tc.name    ColumnsExtension1409
     * @tc.desc    Boolean breakpoint configuration gates toolbar visibility per size
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it(DATASET + 'BreakpointType_001', 0, () => {
      const type: BreakpointType<boolean> = new BreakpointType<boolean>(false, true, true);
      expect(type.GetValue('sm')).assertFalse();
      expect(type.GetValue('md')).assertTrue();
      expect(type.GetValue('lg')).assertTrue();
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_1410
     * @tc.name    ColumnsExtension1410
     * @tc.desc    Object values are returned by reference without copying
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'BreakpointType_002', 0, () => {
      const sm: number[] = [1, 2];
      const md: number[] = [1, 2];
      const type: BreakpointType<number[]> = new BreakpointType<number[]>(sm, md, [5]);
      expect(type.GetValue('sm') === sm).assertTrue();
      expect(type.GetValue('md') === md).assertTrue();
      expect(type.GetValue('sm') === type.GetValue('md')).assertFalse();
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_1411
     * @tc.name    ColumnsExtension1411
     * @tc.desc    Breakpoint keys are matched exactly, including whitespace and case
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'BreakpointType_003', 0, () => {
      const type: BreakpointType<number> = new BreakpointType<number>(1, 2, 3);
      expect(type.GetValue(' sm') === undefined).assertTrue();
      expect(type.GetValue('sm ') === undefined).assertTrue();
      expect(type.GetValue('SM') === undefined).assertTrue();
      expect(type.GetValue('small') === undefined).assertTrue();
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_1412
     * @tc.name    ColumnsExtension1412
     * @tc.desc    Constructor stores arguments in small, medium, large order
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it(DATASET + 'BreakpointType_004', 0, () => {
      const type: BreakpointType<string> = new BreakpointType<string>('s', 'm', 'l');
      expect(type.sm).assertEqual('s');
      expect(type.md).assertEqual('m');
      expect(type.lg).assertEqual('l');
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_1413
     * @tc.name    ColumnsExtension1413
     * @tc.desc    Photo constructor keeps a negative counter instead of sanitizing it
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'photoType_001', 0, () => {
      const src: Resource = $r('app.string.EntryAbility_label');
      const photo: photoType = new photoType(src, -1, src);
      expect(photo.count).assertEqual(-1);
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_1414
     * @tc.name    ColumnsExtension1414
     * @tc.desc    Mail constructor keeps a zero unread counter
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it(DATASET + 'MailType_001', 0, () => {
      const src: Resource = $r('app.string.EntryAbility_label');
      const mail: MailType = new MailType(src, 0, src);
      expect(mail.num).assertEqual(0);
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_1415
     * @tc.name    ColumnsExtension1415
     * @tc.desc    Mail constructor keeps a negative unread counter
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'MailType_002', 0, () => {
      const src: Resource = $r('app.string.EntryAbility_label');
      const mail: MailType = new MailType(src, -5, src);
      expect(mail.num).assertEqual(-5);
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_1416
     * @tc.name    ColumnsExtension1416
     * @tc.desc    Two mail instances keep independent counters
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it(DATASET + 'MailType_003', 0, () => {
      const src: Resource = $r('app.string.EntryAbility_label');
      const first: MailType = new MailType(src, 1, src);
      const second: MailType = new MailType(src, 2, src);
      expect(first.num).assertEqual(1);
      expect(second.num).assertEqual(2);
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_1417
     * @tc.name    ColumnsExtension1417
     * @tc.desc    Tab entry keeps distinct icon and label resources
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it(DATASET + 'OperateTabs_001', 0, () => {
      const icon: Resource = $r('app.string.EntryAbility_label');
      const label: Resource = $r('app.string.module_desc');
      const tab: OperateTabs = new OperateTabs(icon, label);
      expect(tab.src.id).assertEqual(icon.id);
      expect(tab.name.id).assertEqual(label.id);
      expect(tab.src.id === tab.name.id).assertFalse();
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_1418
     * @tc.name    ColumnsExtension1418
     * @tc.desc    Photo entry without an explicit icon leaves the optional field undefined
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it(DATASET + 'photoType_002', 0, () => {
      const src: Resource = $r('app.string.EntryAbility_label');
      const photo: photoType = new photoType(src, 3, undefined);
      expect(photo.src === undefined).assertTrue();
      expect(photo.count).assertEqual(3);
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_1419
     * @tc.name    ColumnsExtension1419
     * @tc.desc    Breakpoint resolver maps negative width to unknown
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'resolveBreakpoint_001', 0, () => {
      expect(resolveBreakpoint(-1)).assertEqual('unknown');
      expect(resolveBreakpoint(-1000)).assertEqual('unknown');
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_1420
     * @tc.name    ColumnsExtension1420
     * @tc.desc    Breakpoint resolver covers the xs to sm transition
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it(DATASET + 'resolveBreakpoint_002', 0, () => {
      expect(resolveBreakpoint(0)).assertEqual('xs');
      expect(resolveBreakpoint(319)).assertEqual('xs');
      expect(resolveBreakpoint(320)).assertEqual('sm');
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_1421
     * @tc.name    ColumnsExtension1421
     * @tc.desc    Breakpoint resolver covers the sm to md transition
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it(DATASET + 'resolveBreakpoint_003', 0, () => {
      expect(resolveBreakpoint(599)).assertEqual('sm');
      expect(resolveBreakpoint(600)).assertEqual('md');
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_1422
     * @tc.name    ColumnsExtension1422
     * @tc.desc    Breakpoint resolver covers the md to lg transition and above
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it(DATASET + 'resolveBreakpoint_004', 0, () => {
      expect(resolveBreakpoint(839)).assertEqual('md');
      expect(resolveBreakpoint(840)).assertEqual('lg');
      expect(resolveBreakpoint(9999)).assertEqual('lg');
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_1423
     * @tc.name    ColumnsExtension1423
     * @tc.desc    Sample range handles empty, single and mixed samples
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'rangeOf_001', 0, () => {
      expect(rangeOf([])).assertEqual(0);
      expect(rangeOf([5])).assertEqual(0);
      expect(rangeOf([3, 1, 4, 1, 5])).assertEqual(4);
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_1424
     * @tc.name    ColumnsExtension1424
     * @tc.desc    Sample average handles empty and uneven sample sets
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'averageOf_001', 0, () => {
      expect(averageOf([])).assertEqual(0);
      expect(averageOf([1, 2])).assertEqual(1.5);
      expect(averageOf([2, 4, 6])).assertEqual(4);
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_1425
     * @tc.name    ColumnsExtension1425
     * @tc.desc    Safe division guards a zero divisor and keeps the sign
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'safeDivide_001', 0, () => {
      expect(safeDivide(10, 0)).assertEqual(0);
      expect(safeDivide(0, 5)).assertEqual(0);
      expect(safeDivide(-6, 3)).assertEqual(-2);
      expect(safeDivide(1, 4)).assertEqual(0.25);
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_1426
     * @tc.name    ColumnsExtension1426
     * @tc.desc    Shared window width probes increase strictly from xs to lg
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'widthProbes_001', 0, () => {
      expect(WIDTH_XS < WIDTH_SM).assertTrue();
      expect(WIDTH_SM < WIDTH_MD).assertTrue();
      expect(WIDTH_MD < WIDTH_LG).assertTrue();
      expect(WIDTH_MD >= 600).assertTrue();
      expect(WIDTH_LG >= 840).assertTrue();
    })
    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_1427
     * @tc.name    ColumnsExtension1427
     * @tc.desc    Render timeout is positive and shorter than the navigation timeout
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'driverTimeout_001', 0, () => {
      expect(TIMEOUT_RENDER > 0).assertTrue();
      expect(TIMEOUT_NAVIGATION > TIMEOUT_RENDER).assertTrue();
    })
    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_1428
     * @tc.name    ColumnsExtension1428
     * @tc.desc    Every driver delay is positive and launch delay is the largest
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'driverDelay_001', 0, () => {
      expect(DELAY_RESIZE > 0).assertTrue();
      expect(DELAY_NAV > 0).assertTrue();
      expect(DELAY_TOUCH > 0).assertTrue();
      expect(DELAY_LAUNCH >= DELAY_RESIZE).assertTrue();
      expect(DELAY_LAUNCH >= DELAY_NAV).assertTrue();
      expect(DELAY_LAUNCH >= DELAY_TOUCH).assertTrue();
    })
    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_1429
     * @tc.name    ColumnsExtension1429
     * @tc.desc    Driver tolerance constants keep their published values
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'driverTolerance_001', 0, () => {
      expect(TOLERANCE_COUNT).assertEqual(3);
      expect(TOLERANCE_PX).assertEqual(8);
    })
    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_1430
     * @tc.name    ColumnsExtension1430
     * @tc.desc    Stress rounds exceed stable rounds and both stay above one
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'driverRounds_001', 0, () => {
      expect(STABLE_ROUNDS >= 2).assertTrue();
      expect(STRESS_ROUNDS > STABLE_ROUNDS).assertTrue();
    })
    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_1431
     * @tc.name    ColumnsExtension1431
     * @tc.desc    Render timeout covers one resize delay plus one touch delay
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'driverBudget_001', 0, () => {
      expect(TIMEOUT_RENDER >= DELAY_RESIZE + DELAY_TOUCH).assertTrue();
    })
    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_1432
     * @tc.name    ColumnsExtension1432
     * @tc.desc    Appending a mail bucket updates total and kind count
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'mailAppend_001', 0, () => {
      const model: ColumnsModel = new ColumnsModel();
      const before: number = model.getTotalMailNum();
      const mails: ColumnsMailType[] = model.getMails();
      mails.push({ type: 'spam', num: 4 });
      expect(model.getMailKinds()).assertEqual(COLUMNS_MAIL_KINDS + 1);
      expect(model.getTotalMailNum()).assertEqual(before + 4);
    })
    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_1433
     * @tc.name    ColumnsExtension1433
     * @tc.desc    Mutating an exposed mail counter updates the total immediately
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'mailMutation_001', 0, () => {
      const model: ColumnsModel = new ColumnsModel();
      const before: number = model.getTotalMailNum();
      const mails: ColumnsMailType[] = model.getMails();
      mails[0].num = mails[0].num + 10;
      expect(model.getTotalMailNum()).assertEqual(before + 10);
    })
    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_1434
     * @tc.name    ColumnsExtension1434
     * @tc.desc    Appending a photo category updates total and kind count
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'photoAppend_001', 0, () => {
      const model: ColumnsModel = new ColumnsModel();
      const before: number = model.getTotalPhotoCount();
      const photos: ColumnsPhotoType[] = model.getPhotos();
      photos.push({ name: 'screenshot', count: 5 });
      expect(model.getPhotoKinds()).assertEqual(COLUMNS_PHOTO_KINDS + 1);
      expect(model.getTotalPhotoCount()).assertEqual(before + 5);
    })
    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_1435
     * @tc.name    ColumnsExtension1435
     * @tc.desc    Negative counter added through the exposed list fails validation
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'negativeMail_001', 0, () => {
      const model: ColumnsModel = new ColumnsModel();
      const mails: ColumnsMailType[] = model.getMails();
      mails.push({ type: 'broken', num: -1 });
      expect(model.hasValidMailNums()).assertFalse();
    })
    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_1436
     * @tc.name    ColumnsExtension1436
     * @tc.desc    Zero counter added through the exposed list fails validation
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'zeroPhoto_001', 0, () => {
      const model: ColumnsModel = new ColumnsModel();
      const photos: ColumnsPhotoType[] = model.getPhotos();
      photos.push({ name: 'empty', count: 0 });
      expect(model.hasPositivePhotoCounts()).assertFalse();
    })
    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_1437
     * @tc.name    ColumnsExtension1437
     * @tc.desc    Lookup finds a bucket appended through the exposed list
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'appendedLookup_001', 0, () => {
      const model: ColumnsModel = new ColumnsModel();
      const mails: ColumnsMailType[] = model.getMails();
      mails.push({ type: 'spam', num: 9 });
      const found: ColumnsMailType | undefined = model.getMailByType('spam');
      expect(found !== undefined).assertTrue();
      expect((found as ColumnsMailType).num).assertEqual(9);
    })
    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_1438
     * @tc.name    ColumnsExtension1438
     * @tc.desc    Two models do not share seeded arrays
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'instanceIsolation_001', 0, () => {
      const first: ColumnsModel = new ColumnsModel();
      const second: ColumnsModel = new ColumnsModel();
      first.getMails().push({ type: 'spam', num: 1 });
      expect(second.getMailKinds()).assertEqual(COLUMNS_MAIL_KINDS);
      expect(second.getTotalMailNum()).assertEqual(23);
    })
    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_1439
     * @tc.name    ColumnsExtension1439
     * @tc.desc    Navbar width scales linearly with the window width
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'linearWidth_001', 0, () => {
      const model: ColumnsModel = new ColumnsModel();
      expect(model.navbarWidth(2000)).assertEqual(model.navbarWidth(1000) * 2);
      expect(model.navbarWidth(500)).assertEqual(200);
    })
    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_1440
     * @tc.name    ColumnsExtension1440
     * @tc.desc    Content width plus navbar width equals a negative window width
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'contentNegative_001', 0, () => {
      const model: ColumnsModel = new ColumnsModel();
      const width: number = -1000;
      expect(model.navbarWidth(width) + model.contentWidth(width)).assertEqual(width);
      expect(model.contentWidth(width) < 0).assertTrue();
    })
    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_1441
     * @tc.name    ColumnsExtension1441
     * @tc.desc    Split mode handles fractional widths on both sides of the boundary
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'splitFraction_001', 0, () => {
      const model: ColumnsModel = new ColumnsModel();
      expect(model.isSplitMode(599.5)).assertFalse();
      expect(model.isSplitMode(600.5)).assertTrue();
    })
    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_1442
     * @tc.name    ColumnsExtension1442
     * @tc.desc    Operate tabs keeps the exact resource instances passed in
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'operateTabsIdentity_001', 0, () => {
      const icon: Resource = $r('app.string.EntryAbility_label');
      const label: Resource = $r('app.string.module_desc');
      const tab: OperateTabs = new OperateTabs(icon, label);
      expect(tab.src === icon).assertTrue();
      expect(tab.name === label).assertTrue();
    })
    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_1443
     * @tc.name    ColumnsExtension1443
     * @tc.desc    Mail entry keeps a large unread counter and distinct resource ids
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'mailTypeLarge_001', 0, () => {
      const typeRes: Resource = $r('app.string.EntryAbility_label');
      const srcRes: Resource = $r('app.string.module_desc');
      const mail: MailType = new MailType(typeRes, 1000000, srcRes);
      expect(mail.num).assertEqual(1000000);
      expect(mail.type.id === mail.src.id).assertFalse();
    })
    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_1444
     * @tc.name    ColumnsExtension1444
     * @tc.desc    Photo entry with zero counter and no icon keeps both fields
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'photoZeroSrc_001', 0, () => {
      const nameRes: Resource = $r('app.string.module_desc');
      const photo: photoType = new photoType(nameRes, 0);
      expect(photo.count).assertEqual(0);
      expect(photo.src === undefined).assertTrue();
    })
    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_1445
     * @tc.name    ColumnsExtension1445
     * @tc.desc    Photo entry keeps a fractional counter without rounding
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'photoFraction_001', 0, () => {
      const nameRes: Resource = $r('app.string.EntryAbility_label');
      const photo: photoType = new photoType(nameRes, 2.5);
      expect(photo.count).assertEqual(2.5);
      expect(Math.floor(photo.count)).assertEqual(2);
    })
    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_1446
     * @tc.name    ColumnsExtension1446
     * @tc.desc    Breakpoint lookup returns the exact array instance for every size
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'breakpointArray_001', 0, () => {
      const small: number[] = [1];
      const medium: number[] = [2];
      const large: number[] = [3];
      const type: BreakpointType<number[]> = new BreakpointType<number[]>(small, medium, large);
      expect(type.GetValue('sm') === small).assertTrue();
      expect(type.GetValue('md') === medium).assertTrue();
      expect(type.GetValue('lg') === large).assertTrue();
    })
    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_1447
     * @tc.name    ColumnsExtension1447
     * @tc.desc    Uppercase breakpoint keys fall through to undefined
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'breakpointCase_001', 0, () => {
      const type: BreakpointType<string> = new BreakpointType<string>('a', 'b', 'c');
      expect(type.GetValue('SM') === undefined).assertTrue();
      expect(type.GetValue('MD') === undefined).assertTrue();
    })
    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_1448
     * @tc.name    ColumnsExtension1448
     * @tc.desc    Breakpoint lookup returns falsy and negative numeric payloads unchanged
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'breakpointFalsy_001', 0, () => {
      const type: BreakpointType<number> = new BreakpointType<number>(0, -1, 2.5);
      expect(type.GetValue('sm')).assertEqual(0);
      expect(type.GetValue('md')).assertEqual(-1);
      expect(type.GetValue('lg')).assertEqual(2.5);
    })
    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_1449
     * @tc.name    ColumnsExtension1449
     * @tc.desc    Breakpoint values are returned unchanged for string payloads
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'breakpointStrings_001', 0, () => {
      const type: BreakpointType<string> = new BreakpointType<string>('small', 'medium', 'large');
      expect(type.GetValue('md')).assertEqual('medium');
      expect(type.GetValue('lg')).assertEqual('large');
    })
    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_1450
     * @tc.name    ColumnsExtension1450
     * @tc.desc    Breakpoint resolver treats a huge finite width as large
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'resolveHuge_001', 0, () => {
      expect(resolveBreakpoint(1000000000000)).assertEqual('lg');
    })
    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_1451
     * @tc.name    ColumnsExtension1451
     * @tc.desc    Negative zero width is classified as extra small
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'resolveNegativeZero_001', 0, () => {
      expect(resolveBreakpoint(-0)).assertEqual('xs');
    })
    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_1452
     * @tc.name    ColumnsExtension1452
     * @tc.desc    Sample range spans negative and positive samples
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'rangeNegative_001', 0, () => {
      expect(rangeOf([-5, 3, -1])).assertEqual(8);
      expect(rangeOf([-2, -7])).assertEqual(5);
    })
    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_1453
     * @tc.name    ColumnsExtension1453
     * @tc.desc    Sample average keeps a fractional result
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'averageFraction_001', 0, () => {
      expect(averageOf([1, 2, 4])).assertEqual(7 / 3);
      expect(averageOf([-2, 2])).assertEqual(0);
    })
    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_1454
     * @tc.name    ColumnsExtension1454
     * @tc.desc    Safe division keeps the sign with a negative divisor
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'divideNegativeDivisor_001', 0, () => {
      expect(safeDivide(6, -3)).assertEqual(-2);
      expect(safeDivide(-6, -3)).assertEqual(2);
    })
    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_1455
     * @tc.name    ColumnsExtension1455
     * @tc.desc    Safe division returns the quotient for a large numerator
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'divideLargeNumerator_001', 0, () => {
      expect(safeDivide(1000000000, 4)).assertEqual(250000000);
    })
    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_1456
     * @tc.name    ColumnsExtension1456
     * @tc.desc    Breakpoint resolver treats not a number width as large
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'resolveNotANumber_001', 0, () => {
      expect(resolveBreakpoint(Number.NaN)).assertEqual('lg');
    })
    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_1457
     * @tc.name    ColumnsExtension1457
     * @tc.desc    Breakpoint resolver separates positive from negative infinity
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'resolveInfinity_001', 0, () => {
      expect(resolveBreakpoint(Number.POSITIVE_INFINITY)).assertEqual('lg');
      expect(resolveBreakpoint(Number.NEGATIVE_INFINITY)).assertEqual('unknown');
    })
    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_1458
     * @tc.name    ColumnsExtension1458
     * @tc.desc    Sample range of identical values collapses to zero
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'rangeDuplicate_001', 0, () => {
      expect(rangeOf([0, 0])).assertEqual(0);
      expect(rangeOf([7, 7, 7])).assertEqual(0);
    })
    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_1459
     * @tc.name    ColumnsExtension1459
     * @tc.desc    Sample range keeps a fractional spread
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'rangeFraction_001', 0, () => {
      expect(rangeOf([0.25, 0.75, 0.5])).assertEqual(0.5);
      expect(rangeOf([-0.5, 0.5])).assertEqual(1);
    })
    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_1460
     * @tc.name    ColumnsExtension1460
     * @tc.desc    Sample average of equal values reproduces that value
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'averageDuplicate_001', 0, () => {
      expect(averageOf([9])).assertEqual(9);
      expect(averageOf([5, 5, 5])).assertEqual(5);
    })
    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_1461
     * @tc.name    ColumnsExtension1461
     * @tc.desc    Sample average of small fractions stays within tolerance
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'averageTolerance_001', 0, () => {
      const mean: number = averageOf([0.1, 0.2, 0.3]);
      expect(Math.abs(mean - 0.2) < 1e-9).assertTrue();
    })
    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_1462
     * @tc.name    ColumnsExtension1462
     * @tc.desc    Safe division treats negative zero as a zero divisor
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'divideNegativeZero_001', 0, () => {
      expect(safeDivide(-0, 5)).assertEqual(0);
      expect(safeDivide(5, -0)).assertEqual(0);
    })
    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_1463
     * @tc.name    ColumnsExtension1463
     * @tc.desc    Safe division of one third survives a round trip within tolerance
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'divideRoundTrip_001', 0, () => {
      const third: number = safeDivide(1, 3);
      expect(Math.abs(third * 3 - 1) < 1e-9).assertTrue();
    })
    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_1464
     * @tc.name    ColumnsExtension1464
     * @tc.desc    Breakpoint lookup returns an empty string payload distinctly from undefined
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'breakpointEmptyString_001', 0, () => {
      const labels: BreakpointType<string> = new BreakpointType<string>('', 'wide', '');
      expect(labels.GetValue('sm')).assertEqual('');
      expect(labels.GetValue('lg')).assertEqual('');
      expect(labels.GetValue('md')).assertEqual('wide');
    })
    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_1465
     * @tc.name    ColumnsExtension1465
     * @tc.desc    Removing a mail bucket lowers kind count and total
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'mailSplice_001', 0, () => {
      const model: ColumnsModel = new ColumnsModel();
      model.getMails().splice(0, 1);
      expect(model.getMailKinds()).assertEqual(2);
      expect(model.getTotalMailNum()).assertEqual(11);
    })
    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_1466
     * @tc.name    ColumnsExtension1466
     * @tc.desc    Clearing every mail bucket leaves a valid empty list
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'mailClear_001', 0, () => {
      const model: ColumnsModel = new ColumnsModel();
      const mails: ColumnsMailType[] = model.getMails();
      mails.splice(0, mails.length);
      expect(model.getMailKinds()).assertEqual(0);
      expect(model.getTotalMailNum()).assertEqual(0);
      expect(model.hasValidMailNums()).assertTrue();
    })
    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_1467
     * @tc.name    ColumnsExtension1467
     * @tc.desc    Clearing every photo category leaves an empty valid list
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'photoClear_001', 0, () => {
      const model: ColumnsModel = new ColumnsModel();
      const photos: ColumnsPhotoType[] = model.getPhotos();
      photos.splice(0, photos.length);
      expect(model.getPhotoKinds()).assertEqual(0);
      expect(model.getTotalPhotoCount()).assertEqual(0);
      expect(model.hasPositivePhotoCounts()).assertTrue();
    })
    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_1468
     * @tc.name    ColumnsExtension1468
     * @tc.desc    Fractional photo counter is summed without rounding
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'photoFractionTotal_001', 0, () => {
      const model: ColumnsModel = new ColumnsModel();
      model.getPhotos()[0].count = 0.5;
      expect(model.getTotalPhotoCount()).assertEqual(43.5);
    })
    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_1469
     * @tc.name    ColumnsExtension1469
     * @tc.desc    Zeroing a photo counter invalidates the list
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'photoZeroValidation_001', 0, () => {
      const model: ColumnsModel = new ColumnsModel();
      model.getPhotos()[1].count = 0;
      expect(model.hasPositivePhotoCounts()).assertFalse();
      expect(model.getTotalPhotoCount()).assertEqual(70);
    })
    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_1470
     * @tc.name    ColumnsExtension1470
     * @tc.desc    Zero unread counter stays valid while lowering the total
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'mailZeroValidation_001', 0, () => {
      const model: ColumnsModel = new ColumnsModel();
      model.getMails()[0].num = 0;
      expect(model.hasValidMailNums()).assertTrue();
      expect(model.getTotalMailNum()).assertEqual(11);
    })
    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_1471
     * @tc.name    ColumnsExtension1471
     * @tc.desc    Rewriting a bucket type moves lookup to the new name only
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'mailTypeRewrite_001', 0, () => {
      const model: ColumnsModel = new ColumnsModel();
      model.getMails()[0].type = 'spam';
      expect(model.getMailByType('inbox') === undefined).assertTrue();
      expect(model.getMailByType('spam') === model.getMails()[0]).assertTrue();
    })
    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_1472
     * @tc.name    ColumnsExtension1472
     * @tc.desc    Appending a zero counter raises kinds without changing the total
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'mailZeroAppend_001', 0, () => {
      const model: ColumnsModel = new ColumnsModel();
      model.getMails().push({ type: 'later', num: 0 });
      expect(model.getMailKinds()).assertEqual(COLUMNS_MAIL_KINDS + 1);
      expect(model.getTotalMailNum()).assertEqual(23);
      expect(model.hasValidMailNums()).assertTrue();
    })
    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_1473
     * @tc.name    ColumnsExtension1473
     * @tc.desc    Appending a fractional photo counter updates the total exactly
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'photoFractionAppend_001', 0, () => {
      const model: ColumnsModel = new ColumnsModel();
      model.getPhotos().push({ name: 'panorama', count: 0.25 });
      expect(model.getPhotoKinds()).assertEqual(COLUMNS_PHOTO_KINDS + 1);
      expect(model.getTotalPhotoCount()).assertEqual(91.25);
    })
    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_1474
     * @tc.name    ColumnsExtension1474
     * @tc.desc    Popping the last photo category lowers kinds and total
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'photoPop_001', 0, () => {
      const model: ColumnsModel = new ColumnsModel();
      model.getPhotos().pop();
      expect(model.getPhotoKinds()).assertEqual(3);
      expect(model.getTotalPhotoCount()).assertEqual(76);
    })
    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_1475
     * @tc.name    ColumnsExtension1475
     * @tc.desc    Navbar width keeps one vp and half vp as exact fractions
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'navbarFractionalUnit_001', 0, () => {
      const model: ColumnsModel = new ColumnsModel();
      expect(model.navbarWidth(1)).assertEqual(0.4);
      expect(model.navbarWidth(0.5)).assertEqual(0.2);
    })
    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_1476
     * @tc.name    ColumnsExtension1476
     * @tc.desc    Mail lookup is case sensitive at the text level
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'mailLookupCase_001', 0, () => {
      const model: ColumnsModel = new ColumnsModel();
      expect(model.getMailByType('Draft') === undefined).assertTrue();
      expect(model.getMailByType('Inbox') === undefined).assertTrue();
    })
    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_1477
     * @tc.name    ColumnsExtension1477
     * @tc.desc    Two appended buckets raise the kind count by exactly two
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'kindsMultipleAppend_001', 0, () => {
      const model: ColumnsModel = new ColumnsModel();
      model.getMails().push({ type: 'one', num: 1 });
      model.getMails().push({ type: 'two', num: 2 });
      expect(model.getMailKinds()).assertEqual(COLUMNS_MAIL_KINDS + 2);
      expect(model.getTotalMailNum()).assertEqual(26);
    })
    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_1478
     * @tc.name    ColumnsExtension1478
     * @tc.desc    Zeroing every unread counter empties the total
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'mailAllZero_001', 0, () => {
      const model: ColumnsModel = new ColumnsModel();
      const mails: ColumnsMailType[] = model.getMails();
      for (let i = 0; i < mails.length; i++) {
        mails[i].num = 0;
      }
      expect(model.getTotalMailNum()).assertEqual(0);
      expect(model.hasValidMailNums()).assertTrue();
    })
    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_1479
     * @tc.name    ColumnsExtension1479
     * @tc.desc    Zeroing every photo counter empties the total and fails validation
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'photoAllZero_001', 0, () => {
      const model: ColumnsModel = new ColumnsModel();
      const photos: ColumnsPhotoType[] = model.getPhotos();
      for (let i = 0; i < photos.length; i++) {
        photos[i].count = 0;
      }
      expect(model.getTotalPhotoCount()).assertEqual(0);
      expect(model.hasPositivePhotoCounts()).assertFalse();
    })
    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_1480
     * @tc.name    ColumnsExtension1480
     * @tc.desc    Mail lookup rejects an empty bucket name
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'mailLookupWhitespace_001', 0, () => {
      const model: ColumnsModel = new ColumnsModel();
      expect(model.getMailByType('') === undefined).assertTrue();
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_1481
     * @tc.name    ColumnsExtension1481
     * @tc.desc    An all false boolean breakpoint triple rejects an unknown key
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'breakpointAllFalse_001', 0, () => {
      const type: BreakpointType<boolean> = new BreakpointType<boolean>(false, false, false);
      expect(type.GetValue('sm')).assertFalse();
      expect(type.GetValue('lg')).assertFalse();
      expect(type.GetValue('xl') === undefined).assertTrue();
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_1482
     * @tc.name    ColumnsExtension1482
     * @tc.desc    Navbar width of an infinite window stays infinite
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'navbarInfiniteWidth_001', 0, () => {
      const model: ColumnsModel = new ColumnsModel();
      expect(model.navbarWidth(Number.POSITIVE_INFINITY)).assertEqual(Number.POSITIVE_INFINITY);
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_1483
     * @tc.name    ColumnsExtension1483
     * @tc.desc    Split mode accepts positive infinity and rejects negative infinity
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'splitInfiniteWidth_001', 0, () => {
      const model: ColumnsModel = new ColumnsModel();
      expect(model.isSplitMode(Number.POSITIVE_INFINITY)).assertTrue();
      expect(model.isSplitMode(Number.NEGATIVE_INFINITY)).assertFalse();
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_1484
     * @tc.name    ColumnsExtension1484
     * @tc.desc    A huge appended unread counter is summed exactly
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'mailHugeTotal_001', 0, () => {
      const model: ColumnsModel = new ColumnsModel();
      model.getMails().push({ type: 'huge', num: 999999999 });
      expect(model.getTotalMailNum()).assertEqual(1000000022);
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_1485
     * @tc.name    ColumnsExtension1485
     * @tc.desc    A fractional photo counter is added without rounding
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'photoFractionPush_001', 0, () => {
      const model: ColumnsModel = new ColumnsModel();
      model.getPhotos().push({ name: 'extra', count: 0.25 });
      expect(model.getTotalPhotoCount()).assertEqual(91.25);
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_1486
     * @tc.name    ColumnsExtension1486
     * @tc.desc    A fractional negative counter fails mail validation
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'mailNegativeFraction_001', 0, () => {
      const model: ColumnsModel = new ColumnsModel();
      model.getMails().push({ type: 'broken', num: -0.5 });
      expect(model.hasValidMailNums()).assertFalse();
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_1487
     * @tc.name    ColumnsExtension1487
     * @tc.desc    A negative photo counter fails the positive check
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'photoNegativeCount_001', 0, () => {
      const model: ColumnsModel = new ColumnsModel();
      model.getPhotos()[0].count = -1;
      expect(model.hasPositivePhotoCounts()).assertFalse();
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_1488
     * @tc.name    ColumnsExtension1488
     * @tc.desc    Popping two photo categories lowers kinds and total
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'popTwoPhotos_001', 0, () => {
      const model: ColumnsModel = new ColumnsModel();
      model.getPhotos().pop();
      model.getPhotos().pop();
      expect(model.getPhotoKinds()).assertEqual(2);
      expect(model.getTotalPhotoCount()).assertEqual(69);
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_1489
     * @tc.name    ColumnsExtension1489
     * @tc.desc    Popping every mail bucket yields zero kinds and total
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'popAllMails_001', 0, () => {
      const model: ColumnsModel = new ColumnsModel();
      while (model.getMailKinds() > 0) {
        model.getMails().pop();
      }
      expect(model.getMailKinds()).assertEqual(0);
      expect(model.getTotalMailNum()).assertEqual(0);
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_1490
     * @tc.name    ColumnsExtension1490
     * @tc.desc    Inbox bucket exposes the seeded type and counter
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'inboxExact_001', 0, () => {
      const model: ColumnsModel = new ColumnsModel();
      const inbox: ColumnsMailType | undefined = model.getMailByType('inbox');
      expect(inbox !== undefined).assertTrue();
      expect((inbox as ColumnsMailType).num).assertEqual(12);
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_1491
     * @tc.name    ColumnsExtension1491
     * @tc.desc    Sidebar ratio validity accepts the published constant
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'ratioValid_001', 0, () => {
      const model: ColumnsModel = new ColumnsModel();
      expect(model.isRatioValid()).assertTrue();
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_1492
     * @tc.name    ColumnsExtension1492
     * @tc.desc    Mail and photo kind constants add up to seven
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'kindsArithmetic_001', 0, () => {
      expect(COLUMNS_MAIL_KINDS + COLUMNS_PHOTO_KINDS).assertEqual(7);
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_1493
     * @tc.name    ColumnsExtension1493
     * @tc.desc    Setting every unread counter to one yields a total of three
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'allMailOnes_001', 0, () => {
      const model: ColumnsModel = new ColumnsModel();
      model.getMails().forEach((item: ColumnsMailType) => {
        item.num = 1;
      });
      expect(model.getTotalMailNum()).assertEqual(3);
      expect(model.hasValidMailNums()).assertTrue();
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_1494
     * @tc.name    ColumnsExtension1494
     * @tc.desc    Appending a duplicate bucket type keeps the first match
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'duplicateMailType_001', 0, () => {
      const model: ColumnsModel = new ColumnsModel();
      model.getMails().push({ type: 'inbox', num: 1 });
      expect(model.getMailKinds()).assertEqual(4);
      expect((model.getMailByType('inbox') as ColumnsMailType).num).assertEqual(12);
      expect(model.getTotalMailNum()).assertEqual(24);
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_1495
     * @tc.name    ColumnsExtension1495
     * @tc.desc    Breakpoint lookup returns empty strings for every size
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'breakpointEmptyTriple_001', 0, () => {
      const type: BreakpointType<string> = new BreakpointType<string>('', '', '');
      expect(type.GetValue('sm')).assertEqual('');
      expect(type.GetValue('md')).assertEqual('');
      expect(type.GetValue('lg')).assertEqual('');
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_1496
     * @tc.name    ColumnsExtension1496
     * @tc.desc    Sample average of a large pair stays exact
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'averageOfLarge_001', 0, () => {
      expect(averageOf([1000000, 2000000])).assertEqual(1500000);
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_1497
     * @tc.name    ColumnsExtension1497
     * @tc.desc    Sample range of extreme finite values stays exact
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'rangeOfHuge_001', 0, () => {
      expect(rangeOf([-1000000, 1000000])).assertEqual(2000000);
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_1498
     * @tc.name    ColumnsExtension1498
     * @tc.desc    Content width of a one vp window keeps the exact complement
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'contentWidthUnit_001', 0, () => {
      const model: ColumnsModel = new ColumnsModel();
      expect(model.contentWidth(1)).assertEqual(0.6);
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_1499
     * @tc.name    ColumnsExtension1499
     * @tc.desc    Zeroing one photo category lowers the total by its own count
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'photoSingleZero_001', 0, () => {
      const model: ColumnsModel = new ColumnsModel();
      model.getPhotos()[0].count = 0;
      expect(model.getTotalPhotoCount()).assertEqual(43);
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_1500
     * @tc.name    ColumnsExtension1500
     * @tc.desc    Zeroing the inbox counter lowers the total by twelve
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'mailInboxZero_001', 0, () => {
      const model: ColumnsModel = new ColumnsModel();
      model.getMails()[0].num = 0;
      expect(model.getTotalMailNum()).assertEqual(11);
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_1501
     * @tc.name    ColumnsExtension1501
     * @tc.desc    Large window widths keep the exact navbar and content split
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'contentWidthLarge_001', 0, () => {
      const model: ColumnsModel = new ColumnsModel();
      expect(model.navbarWidth(1000000)).assertEqual(400000);
      expect(model.contentWidth(1000000)).assertEqual(600000);
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_1502
     * @tc.name    ColumnsExtension1502
     * @tc.desc    Navbar and content widths keep the ratio split at window 5
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5w005', 0, () => {
      const model: ColumnsModel = new ColumnsModel();
      expect(model.navbarWidth(5)).assertEqual(2);
      expect(model.contentWidth(5)).assertEqual(3);
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_1503
     * @tc.name    ColumnsExtension1503
     * @tc.desc    Navbar and content widths keep the ratio split at window 10
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5w010', 0, () => {
      const model: ColumnsModel = new ColumnsModel();
      expect(model.navbarWidth(10)).assertEqual(4);
      expect(model.contentWidth(10)).assertEqual(6);
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_1504
     * @tc.name    ColumnsExtension1504
     * @tc.desc    Navbar and content widths keep the ratio split at window 15
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5w015', 0, () => {
      const model: ColumnsModel = new ColumnsModel();
      expect(model.navbarWidth(15)).assertEqual(6);
      expect(model.contentWidth(15)).assertEqual(9);
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_1505
     * @tc.name    ColumnsExtension1505
     * @tc.desc    Navbar and content widths keep the ratio split at window 20
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5w020', 0, () => {
      const model: ColumnsModel = new ColumnsModel();
      expect(model.navbarWidth(20)).assertEqual(8);
      expect(model.contentWidth(20)).assertEqual(12);
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_1506
     * @tc.name    ColumnsExtension1506
     * @tc.desc    Navbar and content widths keep the ratio split at window 25
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5w025', 0, () => {
      const model: ColumnsModel = new ColumnsModel();
      expect(model.navbarWidth(25)).assertEqual(10);
      expect(model.contentWidth(25)).assertEqual(15);
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_1507
     * @tc.name    ColumnsExtension1507
     * @tc.desc    Navbar and content widths keep the ratio split at window 30
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5w030', 0, () => {
      const model: ColumnsModel = new ColumnsModel();
      expect(model.navbarWidth(30)).assertEqual(12);
      expect(model.contentWidth(30)).assertEqual(18);
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_1508
     * @tc.name    ColumnsExtension1508
     * @tc.desc    Navbar and content widths keep the ratio split at window 35
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5w035', 0, () => {
      const model: ColumnsModel = new ColumnsModel();
      expect(model.navbarWidth(35)).assertEqual(14);
      expect(model.contentWidth(35)).assertEqual(21);
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_1509
     * @tc.name    ColumnsExtension1509
     * @tc.desc    Navbar and content widths keep the ratio split at window 40
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5w040', 0, () => {
      const model: ColumnsModel = new ColumnsModel();
      expect(model.navbarWidth(40)).assertEqual(16);
      expect(model.contentWidth(40)).assertEqual(24);
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_1510
     * @tc.name    ColumnsExtension1510
     * @tc.desc    Navbar and content widths keep the ratio split at window 45
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5w045', 0, () => {
      const model: ColumnsModel = new ColumnsModel();
      expect(model.navbarWidth(45)).assertEqual(18);
      expect(model.contentWidth(45)).assertEqual(27);
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_1511
     * @tc.name    ColumnsExtension1511
     * @tc.desc    Navbar and content widths keep the ratio split at window 50
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5w050', 0, () => {
      const model: ColumnsModel = new ColumnsModel();
      expect(model.navbarWidth(50)).assertEqual(20);
      expect(model.contentWidth(50)).assertEqual(30);
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_1512
     * @tc.name    ColumnsExtension1512
     * @tc.desc    Navbar and content widths keep the ratio split at window 55
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5w055', 0, () => {
      const model: ColumnsModel = new ColumnsModel();
      expect(model.navbarWidth(55)).assertEqual(22);
      expect(model.contentWidth(55)).assertEqual(33);
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_1513
     * @tc.name    ColumnsExtension1513
     * @tc.desc    Navbar and content widths keep the ratio split at window 60
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5w060', 0, () => {
      const model: ColumnsModel = new ColumnsModel();
      expect(model.navbarWidth(60)).assertEqual(24);
      expect(model.contentWidth(60)).assertEqual(36);
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_1514
     * @tc.name    ColumnsExtension1514
     * @tc.desc    Navbar and content widths keep the ratio split at window 65
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5w065', 0, () => {
      const model: ColumnsModel = new ColumnsModel();
      expect(model.navbarWidth(65)).assertEqual(26);
      expect(model.contentWidth(65)).assertEqual(39);
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_1515
     * @tc.name    ColumnsExtension1515
     * @tc.desc    Navbar and content widths keep the ratio split at window 70
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5w070', 0, () => {
      const model: ColumnsModel = new ColumnsModel();
      expect(model.navbarWidth(70)).assertEqual(28);
      expect(model.contentWidth(70)).assertEqual(42);
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_1516
     * @tc.name    ColumnsExtension1516
     * @tc.desc    Navbar and content widths keep the ratio split at window 75
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5w075', 0, () => {
      const model: ColumnsModel = new ColumnsModel();
      expect(model.navbarWidth(75)).assertEqual(30);
      expect(model.contentWidth(75)).assertEqual(45);
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_1517
     * @tc.name    ColumnsExtension1517
     * @tc.desc    Navbar and content widths keep the ratio split at window 80
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5w080', 0, () => {
      const model: ColumnsModel = new ColumnsModel();
      expect(model.navbarWidth(80)).assertEqual(32);
      expect(model.contentWidth(80)).assertEqual(48);
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_1518
     * @tc.name    ColumnsExtension1518
     * @tc.desc    Navbar and content widths keep the ratio split at window 85
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5w085', 0, () => {
      const model: ColumnsModel = new ColumnsModel();
      expect(model.navbarWidth(85)).assertEqual(34);
      expect(model.contentWidth(85)).assertEqual(51);
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_1519
     * @tc.name    ColumnsExtension1519
     * @tc.desc    Navbar and content widths keep the ratio split at window 90
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5w090', 0, () => {
      const model: ColumnsModel = new ColumnsModel();
      expect(model.navbarWidth(90)).assertEqual(36);
      expect(model.contentWidth(90)).assertEqual(54);
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_1520
     * @tc.name    ColumnsExtension1520
     * @tc.desc    Navbar and content widths keep the ratio split at window 95
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5w095', 0, () => {
      const model: ColumnsModel = new ColumnsModel();
      expect(model.navbarWidth(95)).assertEqual(38);
      expect(model.contentWidth(95)).assertEqual(57);
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_1521
     * @tc.name    ColumnsExtension1521
     * @tc.desc    Navbar and content widths keep the ratio split at window 100
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5w100', 0, () => {
      const model: ColumnsModel = new ColumnsModel();
      expect(model.navbarWidth(100)).assertEqual(40);
      expect(model.contentWidth(100)).assertEqual(60);
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_1522
     * @tc.name    ColumnsExtension1522
     * @tc.desc    Navbar and content widths keep the ratio split at window 105
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5w105', 0, () => {
      const model: ColumnsModel = new ColumnsModel();
      expect(model.navbarWidth(105)).assertEqual(42);
      expect(model.contentWidth(105)).assertEqual(63);
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_1523
     * @tc.name    ColumnsExtension1523
     * @tc.desc    Navbar and content widths keep the ratio split at window 110
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5w110', 0, () => {
      const model: ColumnsModel = new ColumnsModel();
      expect(model.navbarWidth(110)).assertEqual(44);
      expect(model.contentWidth(110)).assertEqual(66);
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_1524
     * @tc.name    ColumnsExtension1524
     * @tc.desc    Navbar and content widths keep the ratio split at window 115
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5w115', 0, () => {
      const model: ColumnsModel = new ColumnsModel();
      expect(model.navbarWidth(115)).assertEqual(46);
      expect(model.contentWidth(115)).assertEqual(69);
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_1525
     * @tc.name    ColumnsExtension1525
     * @tc.desc    Navbar and content widths keep the ratio split at window 120
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5w120', 0, () => {
      const model: ColumnsModel = new ColumnsModel();
      expect(model.navbarWidth(120)).assertEqual(48);
      expect(model.contentWidth(120)).assertEqual(72);
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_1526
     * @tc.name    ColumnsExtension1526
     * @tc.desc    Navbar and content widths keep the ratio split at window 125
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5w125', 0, () => {
      const model: ColumnsModel = new ColumnsModel();
      expect(model.navbarWidth(125)).assertEqual(50);
      expect(model.contentWidth(125)).assertEqual(75);
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_1527
     * @tc.name    ColumnsExtension1527
     * @tc.desc    Navbar and content widths keep the ratio split at window 130
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5w130', 0, () => {
      const model: ColumnsModel = new ColumnsModel();
      expect(model.navbarWidth(130)).assertEqual(52);
      expect(model.contentWidth(130)).assertEqual(78);
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_1528
     * @tc.name    ColumnsExtension1528
     * @tc.desc    Navbar and content widths keep the ratio split at window 135
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5w135', 0, () => {
      const model: ColumnsModel = new ColumnsModel();
      expect(model.navbarWidth(135)).assertEqual(54);
      expect(model.contentWidth(135)).assertEqual(81);
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_1529
     * @tc.name    ColumnsExtension1529
     * @tc.desc    Navbar and content widths keep the ratio split at window 140
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5w140', 0, () => {
      const model: ColumnsModel = new ColumnsModel();
      expect(model.navbarWidth(140)).assertEqual(56);
      expect(model.contentWidth(140)).assertEqual(84);
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_1530
     * @tc.name    ColumnsExtension1530
     * @tc.desc    Navbar and content widths keep the ratio split at window 145
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5w145', 0, () => {
      const model: ColumnsModel = new ColumnsModel();
      expect(model.navbarWidth(145)).assertEqual(58);
      expect(model.contentWidth(145)).assertEqual(87);
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_1531
     * @tc.name    ColumnsExtension1531
     * @tc.desc    Navbar and content widths keep the ratio split at window 150
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5w150', 0, () => {
      const model: ColumnsModel = new ColumnsModel();
      expect(model.navbarWidth(150)).assertEqual(60);
      expect(model.contentWidth(150)).assertEqual(90);
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_1532
     * @tc.name    ColumnsExtension1532
     * @tc.desc    Navbar and content widths keep the ratio split at window 155
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5w155', 0, () => {
      const model: ColumnsModel = new ColumnsModel();
      expect(model.navbarWidth(155)).assertEqual(62);
      expect(model.contentWidth(155)).assertEqual(93);
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_1533
     * @tc.name    ColumnsExtension1533
     * @tc.desc    Navbar and content widths keep the ratio split at window 160
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5w160', 0, () => {
      const model: ColumnsModel = new ColumnsModel();
      expect(model.navbarWidth(160)).assertEqual(64);
      expect(model.contentWidth(160)).assertEqual(96);
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_1534
     * @tc.name    ColumnsExtension1534
     * @tc.desc    Navbar and content widths keep the ratio split at window 165
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5w165', 0, () => {
      const model: ColumnsModel = new ColumnsModel();
      expect(model.navbarWidth(165)).assertEqual(66);
      expect(model.contentWidth(165)).assertEqual(99);
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_1535
     * @tc.name    ColumnsExtension1535
     * @tc.desc    Navbar and content widths keep the ratio split at window 170
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5w170', 0, () => {
      const model: ColumnsModel = new ColumnsModel();
      expect(model.navbarWidth(170)).assertEqual(68);
      expect(model.contentWidth(170)).assertEqual(102);
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_1536
     * @tc.name    ColumnsExtension1536
     * @tc.desc    Navbar and content widths keep the ratio split at window 175
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5w175', 0, () => {
      const model: ColumnsModel = new ColumnsModel();
      expect(model.navbarWidth(175)).assertEqual(70);
      expect(model.contentWidth(175)).assertEqual(105);
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_1537
     * @tc.name    ColumnsExtension1537
     * @tc.desc    Navbar and content widths keep the ratio split at window 180
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5w180', 0, () => {
      const model: ColumnsModel = new ColumnsModel();
      expect(model.navbarWidth(180)).assertEqual(72);
      expect(model.contentWidth(180)).assertEqual(108);
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_1538
     * @tc.name    ColumnsExtension1538
     * @tc.desc    Navbar and content widths keep the ratio split at window 185
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5w185', 0, () => {
      const model: ColumnsModel = new ColumnsModel();
      expect(model.navbarWidth(185)).assertEqual(74);
      expect(model.contentWidth(185)).assertEqual(111);
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_1539
     * @tc.name    ColumnsExtension1539
     * @tc.desc    Navbar and content widths keep the ratio split at window 190
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5w190', 0, () => {
      const model: ColumnsModel = new ColumnsModel();
      expect(model.navbarWidth(190)).assertEqual(76);
      expect(model.contentWidth(190)).assertEqual(114);
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_1540
     * @tc.name    ColumnsExtension1540
     * @tc.desc    Navbar and content widths keep the ratio split at window 195
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5w195', 0, () => {
      const model: ColumnsModel = new ColumnsModel();
      expect(model.navbarWidth(195)).assertEqual(78);
      expect(model.contentWidth(195)).assertEqual(117);
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_1541
     * @tc.name    ColumnsExtension1541
     * @tc.desc    Navbar and content widths keep the ratio split at window 200
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5w200', 0, () => {
      const model: ColumnsModel = new ColumnsModel();
      expect(model.navbarWidth(200)).assertEqual(80);
      expect(model.contentWidth(200)).assertEqual(120);
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_1542
     * @tc.name    ColumnsExtension1542
     * @tc.desc    Navbar and content widths keep the ratio split at window 205
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5w205', 0, () => {
      const model: ColumnsModel = new ColumnsModel();
      expect(model.navbarWidth(205)).assertEqual(82);
      expect(model.contentWidth(205)).assertEqual(123);
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_1543
     * @tc.name    ColumnsExtension1543
     * @tc.desc    Navbar and content widths keep the ratio split at window 210
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5w210', 0, () => {
      const model: ColumnsModel = new ColumnsModel();
      expect(model.navbarWidth(210)).assertEqual(84);
      expect(model.contentWidth(210)).assertEqual(126);
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_1544
     * @tc.name    ColumnsExtension1544
     * @tc.desc    Navbar and content widths keep the ratio split at window 215
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5w215', 0, () => {
      const model: ColumnsModel = new ColumnsModel();
      expect(model.navbarWidth(215)).assertEqual(86);
      expect(model.contentWidth(215)).assertEqual(129);
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_1545
     * @tc.name    ColumnsExtension1545
     * @tc.desc    Navbar and content widths keep the ratio split at window 220
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5w220', 0, () => {
      const model: ColumnsModel = new ColumnsModel();
      expect(model.navbarWidth(220)).assertEqual(88);
      expect(model.contentWidth(220)).assertEqual(132);
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_1546
     * @tc.name    ColumnsExtension1546
     * @tc.desc    Navbar and content widths keep the ratio split at window 225
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5w225', 0, () => {
      const model: ColumnsModel = new ColumnsModel();
      expect(model.navbarWidth(225)).assertEqual(90);
      expect(model.contentWidth(225)).assertEqual(135);
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_1547
     * @tc.name    ColumnsExtension1547
     * @tc.desc    Navbar and content widths keep the ratio split at window 230
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5w230', 0, () => {
      const model: ColumnsModel = new ColumnsModel();
      expect(model.navbarWidth(230)).assertEqual(92);
      expect(model.contentWidth(230)).assertEqual(138);
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_1548
     * @tc.name    ColumnsExtension1548
     * @tc.desc    Navbar and content widths keep the ratio split at window 235
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5w235', 0, () => {
      const model: ColumnsModel = new ColumnsModel();
      expect(model.navbarWidth(235)).assertEqual(94);
      expect(model.contentWidth(235)).assertEqual(141);
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_1549
     * @tc.name    ColumnsExtension1549
     * @tc.desc    Navbar and content widths keep the ratio split at window 240
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5w240', 0, () => {
      const model: ColumnsModel = new ColumnsModel();
      expect(model.navbarWidth(240)).assertEqual(96);
      expect(model.contentWidth(240)).assertEqual(144);
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_1550
     * @tc.name    ColumnsExtension1550
     * @tc.desc    Navbar and content widths keep the ratio split at window 245
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5w245', 0, () => {
      const model: ColumnsModel = new ColumnsModel();
      expect(model.navbarWidth(245)).assertEqual(98);
      expect(model.contentWidth(245)).assertEqual(147);
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_1551
     * @tc.name    ColumnsExtension1551
     * @tc.desc    Navbar and content widths keep the ratio split at window 250
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5w250', 0, () => {
      const model: ColumnsModel = new ColumnsModel();
      expect(model.navbarWidth(250)).assertEqual(100);
      expect(model.contentWidth(250)).assertEqual(150);
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_1552
     * @tc.name    ColumnsExtension1552
     * @tc.desc    Navbar and content widths keep the ratio split at window 255
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5w255', 0, () => {
      const model: ColumnsModel = new ColumnsModel();
      expect(model.navbarWidth(255)).assertEqual(102);
      expect(model.contentWidth(255)).assertEqual(153);
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_1553
     * @tc.name    ColumnsExtension1553
     * @tc.desc    Navbar and content widths keep the ratio split at window 260
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5w260', 0, () => {
      const model: ColumnsModel = new ColumnsModel();
      expect(model.navbarWidth(260)).assertEqual(104);
      expect(model.contentWidth(260)).assertEqual(156);
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_1554
     * @tc.name    ColumnsExtension1554
     * @tc.desc    Navbar and content widths keep the ratio split at window 265
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5w265', 0, () => {
      const model: ColumnsModel = new ColumnsModel();
      expect(model.navbarWidth(265)).assertEqual(106);
      expect(model.contentWidth(265)).assertEqual(159);
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_1555
     * @tc.name    ColumnsExtension1555
     * @tc.desc    Navbar and content widths keep the ratio split at window 270
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5w270', 0, () => {
      const model: ColumnsModel = new ColumnsModel();
      expect(model.navbarWidth(270)).assertEqual(108);
      expect(model.contentWidth(270)).assertEqual(162);
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_1556
     * @tc.name    ColumnsExtension1556
     * @tc.desc    Navbar and content widths keep the ratio split at window 275
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5w275', 0, () => {
      const model: ColumnsModel = new ColumnsModel();
      expect(model.navbarWidth(275)).assertEqual(110);
      expect(model.contentWidth(275)).assertEqual(165);
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_1557
     * @tc.name    ColumnsExtension1557
     * @tc.desc    Navbar and content widths keep the ratio split at window 280
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5w280', 0, () => {
      const model: ColumnsModel = new ColumnsModel();
      expect(model.navbarWidth(280)).assertEqual(112);
      expect(model.contentWidth(280)).assertEqual(168);
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_1558
     * @tc.name    ColumnsExtension1558
     * @tc.desc    Navbar and content widths keep the ratio split at window 285
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5w285', 0, () => {
      const model: ColumnsModel = new ColumnsModel();
      expect(model.navbarWidth(285)).assertEqual(114);
      expect(model.contentWidth(285)).assertEqual(171);
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_1559
     * @tc.name    ColumnsExtension1559
     * @tc.desc    Navbar and content widths keep the ratio split at window 290
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5w290', 0, () => {
      const model: ColumnsModel = new ColumnsModel();
      expect(model.navbarWidth(290)).assertEqual(116);
      expect(model.contentWidth(290)).assertEqual(174);
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_1560
     * @tc.name    ColumnsExtension1560
     * @tc.desc    Navbar and content widths keep the ratio split at window 295
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5w295', 0, () => {
      const model: ColumnsModel = new ColumnsModel();
      expect(model.navbarWidth(295)).assertEqual(118);
      expect(model.contentWidth(295)).assertEqual(177);
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_1561
     * @tc.name    ColumnsExtension1561
     * @tc.desc    Navbar and content widths keep the ratio split at window 300
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5w300', 0, () => {
      const model: ColumnsModel = new ColumnsModel();
      expect(model.navbarWidth(300)).assertEqual(120);
      expect(model.contentWidth(300)).assertEqual(180);
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_1562
     * @tc.name    ColumnsExtension1562
     * @tc.desc    Navbar and content widths keep the ratio split at window 305
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5w305', 0, () => {
      const model: ColumnsModel = new ColumnsModel();
      expect(model.navbarWidth(305)).assertEqual(122);
      expect(model.contentWidth(305)).assertEqual(183);
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_1563
     * @tc.name    ColumnsExtension1563
     * @tc.desc    Navbar and content widths keep the ratio split at window 310
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5w310', 0, () => {
      const model: ColumnsModel = new ColumnsModel();
      expect(model.navbarWidth(310)).assertEqual(124);
      expect(model.contentWidth(310)).assertEqual(186);
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_1564
     * @tc.name    ColumnsExtension1564
     * @tc.desc    Navbar and content widths keep the ratio split at window 315
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5w315', 0, () => {
      const model: ColumnsModel = new ColumnsModel();
      expect(model.navbarWidth(315)).assertEqual(126);
      expect(model.contentWidth(315)).assertEqual(189);
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_1565
     * @tc.name    ColumnsExtension1565
     * @tc.desc    Navbar and content widths keep the ratio split at window 320
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5w320', 0, () => {
      const model: ColumnsModel = new ColumnsModel();
      expect(model.navbarWidth(320)).assertEqual(128);
      expect(model.contentWidth(320)).assertEqual(192);
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_1566
     * @tc.name    ColumnsExtension1566
     * @tc.desc    Navbar and content widths keep the ratio split at window 325
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5w325', 0, () => {
      const model: ColumnsModel = new ColumnsModel();
      expect(model.navbarWidth(325)).assertEqual(130);
      expect(model.contentWidth(325)).assertEqual(195);
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_1567
     * @tc.name    ColumnsExtension1567
     * @tc.desc    Navbar and content widths keep the ratio split at window 330
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5w330', 0, () => {
      const model: ColumnsModel = new ColumnsModel();
      expect(model.navbarWidth(330)).assertEqual(132);
      expect(model.contentWidth(330)).assertEqual(198);
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_1568
     * @tc.name    ColumnsExtension1568
     * @tc.desc    Navbar and content widths keep the ratio split at window 335
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5w335', 0, () => {
      const model: ColumnsModel = new ColumnsModel();
      expect(model.navbarWidth(335)).assertEqual(134);
      expect(model.contentWidth(335)).assertEqual(201);
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_1569
     * @tc.name    ColumnsExtension1569
     * @tc.desc    Navbar and content widths keep the ratio split at window 340
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5w340', 0, () => {
      const model: ColumnsModel = new ColumnsModel();
      expect(model.navbarWidth(340)).assertEqual(136);
      expect(model.contentWidth(340)).assertEqual(204);
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_1570
     * @tc.name    ColumnsExtension1570
     * @tc.desc    Navbar and content widths keep the ratio split at window 345
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5w345', 0, () => {
      const model: ColumnsModel = new ColumnsModel();
      expect(model.navbarWidth(345)).assertEqual(138);
      expect(model.contentWidth(345)).assertEqual(207);
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_1571
     * @tc.name    ColumnsExtension1571
     * @tc.desc    Navbar and content widths keep the ratio split at window 350
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5w350', 0, () => {
      const model: ColumnsModel = new ColumnsModel();
      expect(model.navbarWidth(350)).assertEqual(140);
      expect(model.contentWidth(350)).assertEqual(210);
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_1572
     * @tc.name    ColumnsExtension1572
     * @tc.desc    Navbar and content widths keep the ratio split at window 355
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5w355', 0, () => {
      const model: ColumnsModel = new ColumnsModel();
      expect(model.navbarWidth(355)).assertEqual(142);
      expect(model.contentWidth(355)).assertEqual(213);
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_1573
     * @tc.name    ColumnsExtension1573
     * @tc.desc    Navbar and content widths keep the ratio split at window 360
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5w360', 0, () => {
      const model: ColumnsModel = new ColumnsModel();
      expect(model.navbarWidth(360)).assertEqual(144);
      expect(model.contentWidth(360)).assertEqual(216);
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_1574
     * @tc.name    ColumnsExtension1574
     * @tc.desc    Navbar and content widths keep the ratio split at window 365
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5w365', 0, () => {
      const model: ColumnsModel = new ColumnsModel();
      expect(model.navbarWidth(365)).assertEqual(146);
      expect(model.contentWidth(365)).assertEqual(219);
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_1575
     * @tc.name    ColumnsExtension1575
     * @tc.desc    Navbar and content widths keep the ratio split at window 370
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5w370', 0, () => {
      const model: ColumnsModel = new ColumnsModel();
      expect(model.navbarWidth(370)).assertEqual(148);
      expect(model.contentWidth(370)).assertEqual(222);
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_1576
     * @tc.name    ColumnsExtension1576
     * @tc.desc    Navbar and content widths keep the ratio split at window 375
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5w375', 0, () => {
      const model: ColumnsModel = new ColumnsModel();
      expect(model.navbarWidth(375)).assertEqual(150);
      expect(model.contentWidth(375)).assertEqual(225);
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_1577
     * @tc.name    ColumnsExtension1577
     * @tc.desc    Navbar and content widths keep the ratio split at window 380
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5w380', 0, () => {
      const model: ColumnsModel = new ColumnsModel();
      expect(model.navbarWidth(380)).assertEqual(152);
      expect(model.contentWidth(380)).assertEqual(228);
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_1578
     * @tc.name    ColumnsExtension1578
     * @tc.desc    Navbar and content widths keep the ratio split at window 385
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5w385', 0, () => {
      const model: ColumnsModel = new ColumnsModel();
      expect(model.navbarWidth(385)).assertEqual(154);
      expect(model.contentWidth(385)).assertEqual(231);
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_1579
     * @tc.name    ColumnsExtension1579
     * @tc.desc    Navbar and content widths keep the ratio split at window 390
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5w390', 0, () => {
      const model: ColumnsModel = new ColumnsModel();
      expect(model.navbarWidth(390)).assertEqual(156);
      expect(model.contentWidth(390)).assertEqual(234);
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_1580
     * @tc.name    ColumnsExtension1580
     * @tc.desc    Navbar and content widths keep the ratio split at window 395
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5w395', 0, () => {
      const model: ColumnsModel = new ColumnsModel();
      expect(model.navbarWidth(395)).assertEqual(158);
      expect(model.contentWidth(395)).assertEqual(237);
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_1581
     * @tc.name    ColumnsExtension1581
     * @tc.desc    Navbar and content widths keep the ratio split at window 400
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5w400', 0, () => {
      const model: ColumnsModel = new ColumnsModel();
      expect(model.navbarWidth(400)).assertEqual(160);
      expect(model.contentWidth(400)).assertEqual(240);
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_1582
     * @tc.name    ColumnsExtension1582
     * @tc.desc    Navbar and content widths keep the ratio split at window 405
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5w405', 0, () => {
      const model: ColumnsModel = new ColumnsModel();
      expect(model.navbarWidth(405)).assertEqual(162);
      expect(model.contentWidth(405)).assertEqual(243);
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_1583
     * @tc.name    ColumnsExtension1583
     * @tc.desc    Navbar and content widths keep the ratio split at window 410
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5w410', 0, () => {
      const model: ColumnsModel = new ColumnsModel();
      expect(model.navbarWidth(410)).assertEqual(164);
      expect(model.contentWidth(410)).assertEqual(246);
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_1584
     * @tc.name    ColumnsExtension1584
     * @tc.desc    Navbar and content widths keep the ratio split at window 415
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5w415', 0, () => {
      const model: ColumnsModel = new ColumnsModel();
      expect(model.navbarWidth(415)).assertEqual(166);
      expect(model.contentWidth(415)).assertEqual(249);
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_1585
     * @tc.name    ColumnsExtension1585
     * @tc.desc    Navbar and content widths keep the ratio split at window 420
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5w420', 0, () => {
      const model: ColumnsModel = new ColumnsModel();
      expect(model.navbarWidth(420)).assertEqual(168);
      expect(model.contentWidth(420)).assertEqual(252);
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_1586
     * @tc.name    ColumnsExtension1586
     * @tc.desc    Navbar and content widths keep the ratio split at window 425
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5w425', 0, () => {
      const model: ColumnsModel = new ColumnsModel();
      expect(model.navbarWidth(425)).assertEqual(170);
      expect(model.contentWidth(425)).assertEqual(255);
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_1587
     * @tc.name    ColumnsExtension1587
     * @tc.desc    Navbar and content widths keep the ratio split at window 430
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5w430', 0, () => {
      const model: ColumnsModel = new ColumnsModel();
      expect(model.navbarWidth(430)).assertEqual(172);
      expect(model.contentWidth(430)).assertEqual(258);
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_1588
     * @tc.name    ColumnsExtension1588
     * @tc.desc    Navbar and content widths keep the ratio split at window 435
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5w435', 0, () => {
      const model: ColumnsModel = new ColumnsModel();
      expect(model.navbarWidth(435)).assertEqual(174);
      expect(model.contentWidth(435)).assertEqual(261);
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_1589
     * @tc.name    ColumnsExtension1589
     * @tc.desc    Navbar and content widths keep the ratio split at window 440
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5w440', 0, () => {
      const model: ColumnsModel = new ColumnsModel();
      expect(model.navbarWidth(440)).assertEqual(176);
      expect(model.contentWidth(440)).assertEqual(264);
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_1590
     * @tc.name    ColumnsExtension1590
     * @tc.desc    Navbar and content widths keep the ratio split at window 445
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5w445', 0, () => {
      const model: ColumnsModel = new ColumnsModel();
      expect(model.navbarWidth(445)).assertEqual(178);
      expect(model.contentWidth(445)).assertEqual(267);
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_1591
     * @tc.name    ColumnsExtension1591
     * @tc.desc    Navbar and content widths keep the ratio split at window 450
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5w450', 0, () => {
      const model: ColumnsModel = new ColumnsModel();
      expect(model.navbarWidth(450)).assertEqual(180);
      expect(model.contentWidth(450)).assertEqual(270);
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_1592
     * @tc.name    ColumnsExtension1592
     * @tc.desc    Navbar and content widths keep the ratio split at window 455
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5w455', 0, () => {
      const model: ColumnsModel = new ColumnsModel();
      expect(model.navbarWidth(455)).assertEqual(182);
      expect(model.contentWidth(455)).assertEqual(273);
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_1593
     * @tc.name    ColumnsExtension1593
     * @tc.desc    Navbar and content widths keep the ratio split at window 460
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5w460', 0, () => {
      const model: ColumnsModel = new ColumnsModel();
      expect(model.navbarWidth(460)).assertEqual(184);
      expect(model.contentWidth(460)).assertEqual(276);
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_1594
     * @tc.name    ColumnsExtension1594
     * @tc.desc    Navbar and content widths keep the ratio split at window 465
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5w465', 0, () => {
      const model: ColumnsModel = new ColumnsModel();
      expect(model.navbarWidth(465)).assertEqual(186);
      expect(model.contentWidth(465)).assertEqual(279);
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_1595
     * @tc.name    ColumnsExtension1595
     * @tc.desc    Navbar and content widths keep the ratio split at window 470
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5w470', 0, () => {
      const model: ColumnsModel = new ColumnsModel();
      expect(model.navbarWidth(470)).assertEqual(188);
      expect(model.contentWidth(470)).assertEqual(282);
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_1596
     * @tc.name    ColumnsExtension1596
     * @tc.desc    Navbar and content widths keep the ratio split at window 475
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5w475', 0, () => {
      const model: ColumnsModel = new ColumnsModel();
      expect(model.navbarWidth(475)).assertEqual(190);
      expect(model.contentWidth(475)).assertEqual(285);
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_1597
     * @tc.name    ColumnsExtension1597
     * @tc.desc    Navbar and content widths keep the ratio split at window 480
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5w480', 0, () => {
      const model: ColumnsModel = new ColumnsModel();
      expect(model.navbarWidth(480)).assertEqual(192);
      expect(model.contentWidth(480)).assertEqual(288);
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_1598
     * @tc.name    ColumnsExtension1598
     * @tc.desc    Navbar and content widths keep the ratio split at window 485
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5w485', 0, () => {
      const model: ColumnsModel = new ColumnsModel();
      expect(model.navbarWidth(485)).assertEqual(194);
      expect(model.contentWidth(485)).assertEqual(291);
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_1599
     * @tc.name    ColumnsExtension1599
     * @tc.desc    Navbar and content widths keep the ratio split at window 490
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5w490', 0, () => {
      const model: ColumnsModel = new ColumnsModel();
      expect(model.navbarWidth(490)).assertEqual(196);
      expect(model.contentWidth(490)).assertEqual(294);
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_1600
     * @tc.name    ColumnsExtension1600
     * @tc.desc    Navbar and content widths keep the ratio split at window 495
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5w495', 0, () => {
      const model: ColumnsModel = new ColumnsModel();
      expect(model.navbarWidth(495)).assertEqual(198);
      expect(model.contentWidth(495)).assertEqual(297);
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_1601
     * @tc.name    ColumnsExtension1601
     * @tc.desc    Navbar and content widths keep the ratio split at window 500
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5w500', 0, () => {
      const model: ColumnsModel = new ColumnsModel();
      expect(model.navbarWidth(500)).assertEqual(200);
      expect(model.contentWidth(500)).assertEqual(300);
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_1602
     * @tc.name    ColumnsExtension1602
     * @tc.desc    Navbar and content widths keep the ratio split at window 505
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5w505', 0, () => {
      const model: ColumnsModel = new ColumnsModel();
      expect(model.navbarWidth(505)).assertEqual(202);
      expect(model.contentWidth(505)).assertEqual(303);
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_1603
     * @tc.name    ColumnsExtension1603
     * @tc.desc    Navbar and content widths keep the ratio split at window 510
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5w510', 0, () => {
      const model: ColumnsModel = new ColumnsModel();
      expect(model.navbarWidth(510)).assertEqual(204);
      expect(model.contentWidth(510)).assertEqual(306);
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_1604
     * @tc.name    ColumnsExtension1604
     * @tc.desc    Navbar and content widths keep the ratio split at window 515
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5w515', 0, () => {
      const model: ColumnsModel = new ColumnsModel();
      expect(model.navbarWidth(515)).assertEqual(206);
      expect(model.contentWidth(515)).assertEqual(309);
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_1605
     * @tc.name    ColumnsExtension1605
     * @tc.desc    Navbar and content widths keep the ratio split at window 520
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5w520', 0, () => {
      const model: ColumnsModel = new ColumnsModel();
      expect(model.navbarWidth(520)).assertEqual(208);
      expect(model.contentWidth(520)).assertEqual(312);
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_1606
     * @tc.name    ColumnsExtension1606
     * @tc.desc    Navbar and content widths keep the ratio split at window 525
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5w525', 0, () => {
      const model: ColumnsModel = new ColumnsModel();
      expect(model.navbarWidth(525)).assertEqual(210);
      expect(model.contentWidth(525)).assertEqual(315);
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_1607
     * @tc.name    ColumnsExtension1607
     * @tc.desc    Navbar and content widths keep the ratio split at window 530
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5w530', 0, () => {
      const model: ColumnsModel = new ColumnsModel();
      expect(model.navbarWidth(530)).assertEqual(212);
      expect(model.contentWidth(530)).assertEqual(318);
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_1608
     * @tc.name    ColumnsExtension1608
     * @tc.desc    Navbar and content widths keep the ratio split at window 535
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5w535', 0, () => {
      const model: ColumnsModel = new ColumnsModel();
      expect(model.navbarWidth(535)).assertEqual(214);
      expect(model.contentWidth(535)).assertEqual(321);
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_1609
     * @tc.name    ColumnsExtension1609
     * @tc.desc    Navbar and content widths keep the ratio split at window 540
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5w540', 0, () => {
      const model: ColumnsModel = new ColumnsModel();
      expect(model.navbarWidth(540)).assertEqual(216);
      expect(model.contentWidth(540)).assertEqual(324);
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_1610
     * @tc.name    ColumnsExtension1610
     * @tc.desc    Navbar and content widths keep the ratio split at window 545
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5w545', 0, () => {
      const model: ColumnsModel = new ColumnsModel();
      expect(model.navbarWidth(545)).assertEqual(218);
      expect(model.contentWidth(545)).assertEqual(327);
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_1611
     * @tc.name    ColumnsExtension1611
     * @tc.desc    Navbar and content widths keep the ratio split at window 550
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5w550', 0, () => {
      const model: ColumnsModel = new ColumnsModel();
      expect(model.navbarWidth(550)).assertEqual(220);
      expect(model.contentWidth(550)).assertEqual(330);
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_1612
     * @tc.name    ColumnsExtension1612
     * @tc.desc    Navbar and content widths keep the ratio split at window 555
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5w555', 0, () => {
      const model: ColumnsModel = new ColumnsModel();
      expect(model.navbarWidth(555)).assertEqual(222);
      expect(model.contentWidth(555)).assertEqual(333);
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_1613
     * @tc.name    ColumnsExtension1613
     * @tc.desc    Navbar and content widths keep the ratio split at window 560
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5w560', 0, () => {
      const model: ColumnsModel = new ColumnsModel();
      expect(model.navbarWidth(560)).assertEqual(224);
      expect(model.contentWidth(560)).assertEqual(336);
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_1614
     * @tc.name    ColumnsExtension1614
     * @tc.desc    Navbar and content widths keep the ratio split at window 565
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5w565', 0, () => {
      const model: ColumnsModel = new ColumnsModel();
      expect(model.navbarWidth(565)).assertEqual(226);
      expect(model.contentWidth(565)).assertEqual(339);
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_1615
     * @tc.name    ColumnsExtension1615
     * @tc.desc    Navbar and content widths keep the ratio split at window 570
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5w570', 0, () => {
      const model: ColumnsModel = new ColumnsModel();
      expect(model.navbarWidth(570)).assertEqual(228);
      expect(model.contentWidth(570)).assertEqual(342);
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_1616
     * @tc.name    ColumnsExtension1616
     * @tc.desc    Navbar and content widths keep the ratio split at window 575
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5w575', 0, () => {
      const model: ColumnsModel = new ColumnsModel();
      expect(model.navbarWidth(575)).assertEqual(230);
      expect(model.contentWidth(575)).assertEqual(345);
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_1617
     * @tc.name    ColumnsExtension1617
     * @tc.desc    Navbar and content widths keep the ratio split at window 580
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5w580', 0, () => {
      const model: ColumnsModel = new ColumnsModel();
      expect(model.navbarWidth(580)).assertEqual(232);
      expect(model.contentWidth(580)).assertEqual(348);
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_1618
     * @tc.name    ColumnsExtension1618
     * @tc.desc    Navbar and content widths keep the ratio split at window 585
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5w585', 0, () => {
      const model: ColumnsModel = new ColumnsModel();
      expect(model.navbarWidth(585)).assertEqual(234);
      expect(model.contentWidth(585)).assertEqual(351);
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_1619
     * @tc.name    ColumnsExtension1619
     * @tc.desc    Navbar and content widths keep the ratio split at window 590
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5w590', 0, () => {
      const model: ColumnsModel = new ColumnsModel();
      expect(model.navbarWidth(590)).assertEqual(236);
      expect(model.contentWidth(590)).assertEqual(354);
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_1620
     * @tc.name    ColumnsExtension1620
     * @tc.desc    Navbar and content widths keep the ratio split at window 595
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5w595', 0, () => {
      const model: ColumnsModel = new ColumnsModel();
      expect(model.navbarWidth(595)).assertEqual(238);
      expect(model.contentWidth(595)).assertEqual(357);
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_1621
     * @tc.name    ColumnsExtension1621
     * @tc.desc    Navbar and content widths keep the ratio split at window 600
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5w600', 0, () => {
      const model: ColumnsModel = new ColumnsModel();
      expect(model.navbarWidth(600)).assertEqual(240);
      expect(model.contentWidth(600)).assertEqual(360);
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_1622
     * @tc.name    ColumnsExtension1622
     * @tc.desc    Split mode returns false at window width 0
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5s001', 0, () => {
      const model: ColumnsModel = new ColumnsModel();
      expect(model.isSplitMode(0)).assertFalse();
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_1623
     * @tc.name    ColumnsExtension1623
     * @tc.desc    Split mode returns false at window width 50
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5s002', 0, () => {
      const model: ColumnsModel = new ColumnsModel();
      expect(model.isSplitMode(50)).assertFalse();
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_1624
     * @tc.name    ColumnsExtension1624
     * @tc.desc    Split mode returns false at window width 100
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5s003', 0, () => {
      const model: ColumnsModel = new ColumnsModel();
      expect(model.isSplitMode(100)).assertFalse();
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_1625
     * @tc.name    ColumnsExtension1625
     * @tc.desc    Split mode returns false at window width 150
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5s004', 0, () => {
      const model: ColumnsModel = new ColumnsModel();
      expect(model.isSplitMode(150)).assertFalse();
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_1626
     * @tc.name    ColumnsExtension1626
     * @tc.desc    Split mode returns false at window width 200
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5s005', 0, () => {
      const model: ColumnsModel = new ColumnsModel();
      expect(model.isSplitMode(200)).assertFalse();
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_1627
     * @tc.name    ColumnsExtension1627
     * @tc.desc    Split mode returns false at window width 250
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5s006', 0, () => {
      const model: ColumnsModel = new ColumnsModel();
      expect(model.isSplitMode(250)).assertFalse();
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_1628
     * @tc.name    ColumnsExtension1628
     * @tc.desc    Split mode returns false at window width 300
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5s007', 0, () => {
      const model: ColumnsModel = new ColumnsModel();
      expect(model.isSplitMode(300)).assertFalse();
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_1629
     * @tc.name    ColumnsExtension1629
     * @tc.desc    Split mode returns false at window width 350
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5s008', 0, () => {
      const model: ColumnsModel = new ColumnsModel();
      expect(model.isSplitMode(350)).assertFalse();
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_1630
     * @tc.name    ColumnsExtension1630
     * @tc.desc    Split mode returns false at window width 400
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5s009', 0, () => {
      const model: ColumnsModel = new ColumnsModel();
      expect(model.isSplitMode(400)).assertFalse();
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_1631
     * @tc.name    ColumnsExtension1631
     * @tc.desc    Split mode returns false at window width 450
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5s010', 0, () => {
      const model: ColumnsModel = new ColumnsModel();
      expect(model.isSplitMode(450)).assertFalse();
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_1632
     * @tc.name    ColumnsExtension1632
     * @tc.desc    Split mode returns false at window width 500
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5s011', 0, () => {
      const model: ColumnsModel = new ColumnsModel();
      expect(model.isSplitMode(500)).assertFalse();
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_1633
     * @tc.name    ColumnsExtension1633
     * @tc.desc    Split mode returns false at window width 550
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5s012', 0, () => {
      const model: ColumnsModel = new ColumnsModel();
      expect(model.isSplitMode(550)).assertFalse();
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_1634
     * @tc.name    ColumnsExtension1634
     * @tc.desc    Split mode returns true at window width 600
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5s013', 0, () => {
      const model: ColumnsModel = new ColumnsModel();
      expect(model.isSplitMode(600)).assertTrue();
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_1635
     * @tc.name    ColumnsExtension1635
     * @tc.desc    Split mode returns true at window width 650
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5s014', 0, () => {
      const model: ColumnsModel = new ColumnsModel();
      expect(model.isSplitMode(650)).assertTrue();
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_1636
     * @tc.name    ColumnsExtension1636
     * @tc.desc    Split mode returns true at window width 700
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5s015', 0, () => {
      const model: ColumnsModel = new ColumnsModel();
      expect(model.isSplitMode(700)).assertTrue();
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_1637
     * @tc.name    ColumnsExtension1637
     * @tc.desc    Split mode returns true at window width 750
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5s016', 0, () => {
      const model: ColumnsModel = new ColumnsModel();
      expect(model.isSplitMode(750)).assertTrue();
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_1638
     * @tc.name    ColumnsExtension1638
     * @tc.desc    Split mode returns true at window width 800
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5s017', 0, () => {
      const model: ColumnsModel = new ColumnsModel();
      expect(model.isSplitMode(800)).assertTrue();
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_1639
     * @tc.name    ColumnsExtension1639
     * @tc.desc    Split mode returns true at window width 850
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5s018', 0, () => {
      const model: ColumnsModel = new ColumnsModel();
      expect(model.isSplitMode(850)).assertTrue();
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_1640
     * @tc.name    ColumnsExtension1640
     * @tc.desc    Split mode returns true at window width 900
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5s019', 0, () => {
      const model: ColumnsModel = new ColumnsModel();
      expect(model.isSplitMode(900)).assertTrue();
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_1641
     * @tc.name    ColumnsExtension1641
     * @tc.desc    Split mode returns true at window width 950
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5s020', 0, () => {
      const model: ColumnsModel = new ColumnsModel();
      expect(model.isSplitMode(950)).assertTrue();
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_1642
     * @tc.name    ColumnsExtension1642
     * @tc.desc    Split mode returns false at window width 599.5
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5s021', 0, () => {
      const model: ColumnsModel = new ColumnsModel();
      expect(model.isSplitMode(599.5)).assertFalse();
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_1643
     * @tc.name    ColumnsExtension1643
     * @tc.desc    Split mode returns false at window width 599.9
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5s022', 0, () => {
      const model: ColumnsModel = new ColumnsModel();
      expect(model.isSplitMode(599.9)).assertFalse();
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_1644
     * @tc.name    ColumnsExtension1644
     * @tc.desc    Split mode returns false at window width 599.99
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5s023', 0, () => {
      const model: ColumnsModel = new ColumnsModel();
      expect(model.isSplitMode(599.99)).assertFalse();
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_1645
     * @tc.name    ColumnsExtension1645
     * @tc.desc    Split mode returns false at window width 599.999
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5s024', 0, () => {
      const model: ColumnsModel = new ColumnsModel();
      expect(model.isSplitMode(599.999)).assertFalse();
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_1646
     * @tc.name    ColumnsExtension1646
     * @tc.desc    Split mode returns true at window width 600.001
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5s025', 0, () => {
      const model: ColumnsModel = new ColumnsModel();
      expect(model.isSplitMode(600.001)).assertTrue();
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_1647
     * @tc.name    ColumnsExtension1647
     * @tc.desc    Split mode returns true at window width 600.01
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5s026', 0, () => {
      const model: ColumnsModel = new ColumnsModel();
      expect(model.isSplitMode(600.01)).assertTrue();
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_1648
     * @tc.name    ColumnsExtension1648
     * @tc.desc    Split mode returns true at window width 600.1
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5s027', 0, () => {
      const model: ColumnsModel = new ColumnsModel();
      expect(model.isSplitMode(600.1)).assertTrue();
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_1649
     * @tc.name    ColumnsExtension1649
     * @tc.desc    Split mode returns true at window width 600.5
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5s028', 0, () => {
      const model: ColumnsModel = new ColumnsModel();
      expect(model.isSplitMode(600.5)).assertTrue();
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_1650
     * @tc.name    ColumnsExtension1650
     * @tc.desc    Split mode returns true at window width 601
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5s029', 0, () => {
      const model: ColumnsModel = new ColumnsModel();
      expect(model.isSplitMode(601)).assertTrue();
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_1651
     * @tc.name    ColumnsExtension1651
     * @tc.desc    Split mode returns true at window width 1199.5
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5s030', 0, () => {
      const model: ColumnsModel = new ColumnsModel();
      expect(model.isSplitMode(1199.5)).assertTrue();
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_1652
     * @tc.name    ColumnsExtension1652
     * @tc.desc    Split mode returns true at window width 1200.5
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5s031', 0, () => {
      const model: ColumnsModel = new ColumnsModel();
      expect(model.isSplitMode(1200.5)).assertTrue();
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_1653
     * @tc.name    ColumnsExtension1653
     * @tc.desc    Split mode returns false at window width 1
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5s032', 0, () => {
      const model: ColumnsModel = new ColumnsModel();
      expect(model.isSplitMode(1)).assertFalse();
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_1654
     * @tc.name    ColumnsExtension1654
     * @tc.desc    Split mode returns false at window width -1
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5s033', 0, () => {
      const model: ColumnsModel = new ColumnsModel();
      expect(model.isSplitMode(-1)).assertFalse();
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_1655
     * @tc.name    ColumnsExtension1655
     * @tc.desc    Split mode returns false at window width -600
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5s034', 0, () => {
      const model: ColumnsModel = new ColumnsModel();
      expect(model.isSplitMode(-600)).assertFalse();
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_1656
     * @tc.name    ColumnsExtension1656
     * @tc.desc    Sample average of 2 values keeps the exact mean 2
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5a001', 0, () => {
      expect(averageOf([1, 3])).assertEqual(2);
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_1657
     * @tc.name    ColumnsExtension1657
     * @tc.desc    Sample average of 2 values keeps the exact mean 3
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5a002', 0, () => {
      expect(averageOf([2, 4])).assertEqual(3);
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_1658
     * @tc.name    ColumnsExtension1658
     * @tc.desc    Sample average of 2 values keeps the exact mean 4
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5a003', 0, () => {
      expect(averageOf([3, 5])).assertEqual(4);
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_1659
     * @tc.name    ColumnsExtension1659
     * @tc.desc    Sample average of 2 values keeps the exact mean 5
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5a004', 0, () => {
      expect(averageOf([4, 6])).assertEqual(5);
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_1660
     * @tc.name    ColumnsExtension1660
     * @tc.desc    Sample average of 2 values keeps the exact mean 6
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5a005', 0, () => {
      expect(averageOf([5, 7])).assertEqual(6);
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_1661
     * @tc.name    ColumnsExtension1661
     * @tc.desc    Sample average of 2 values keeps the exact mean 7
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5a006', 0, () => {
      expect(averageOf([6, 8])).assertEqual(7);
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_1662
     * @tc.name    ColumnsExtension1662
     * @tc.desc    Sample average of 2 values keeps the exact mean 8
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5a007', 0, () => {
      expect(averageOf([7, 9])).assertEqual(8);
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_1663
     * @tc.name    ColumnsExtension1663
     * @tc.desc    Sample average of 2 values keeps the exact mean 9
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5a008', 0, () => {
      expect(averageOf([8, 10])).assertEqual(9);
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_1664
     * @tc.name    ColumnsExtension1664
     * @tc.desc    Sample average of 2 values keeps the exact mean 10
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5a009', 0, () => {
      expect(averageOf([9, 11])).assertEqual(10);
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_1665
     * @tc.name    ColumnsExtension1665
     * @tc.desc    Sample average of 2 values keeps the exact mean 11
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5a010', 0, () => {
      expect(averageOf([10, 12])).assertEqual(11);
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_1666
     * @tc.name    ColumnsExtension1666
     * @tc.desc    Sample average of 2 values keeps the exact mean 12
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5a011', 0, () => {
      expect(averageOf([11, 13])).assertEqual(12);
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_1667
     * @tc.name    ColumnsExtension1667
     * @tc.desc    Sample average of 2 values keeps the exact mean 13
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5a012', 0, () => {
      expect(averageOf([12, 14])).assertEqual(13);
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_1668
     * @tc.name    ColumnsExtension1668
     * @tc.desc    Sample average of 2 values keeps the exact mean 14
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5a013', 0, () => {
      expect(averageOf([13, 15])).assertEqual(14);
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_1669
     * @tc.name    ColumnsExtension1669
     * @tc.desc    Sample average of 2 values keeps the exact mean 15
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5a014', 0, () => {
      expect(averageOf([14, 16])).assertEqual(15);
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_1670
     * @tc.name    ColumnsExtension1670
     * @tc.desc    Sample average of 2 values keeps the exact mean 16
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5a015', 0, () => {
      expect(averageOf([15, 17])).assertEqual(16);
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_1671
     * @tc.name    ColumnsExtension1671
     * @tc.desc    Sample average of 2 values keeps the exact mean 17
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5a016', 0, () => {
      expect(averageOf([16, 18])).assertEqual(17);
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_1672
     * @tc.name    ColumnsExtension1672
     * @tc.desc    Sample average of 2 values keeps the exact mean 18
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5a017', 0, () => {
      expect(averageOf([17, 19])).assertEqual(18);
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_1673
     * @tc.name    ColumnsExtension1673
     * @tc.desc    Sample average of 2 values keeps the exact mean 19
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5a018', 0, () => {
      expect(averageOf([18, 20])).assertEqual(19);
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_1674
     * @tc.name    ColumnsExtension1674
     * @tc.desc    Sample average of 2 values keeps the exact mean 20
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5a019', 0, () => {
      expect(averageOf([19, 21])).assertEqual(20);
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_1675
     * @tc.name    ColumnsExtension1675
     * @tc.desc    Sample average of 2 values keeps the exact mean 21
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5a020', 0, () => {
      expect(averageOf([20, 22])).assertEqual(21);
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_1676
     * @tc.name    ColumnsExtension1676
     * @tc.desc    Sample average of 2 values keeps the exact mean 4
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5a022', 0, () => {
      expect(averageOf([2, 6])).assertEqual(4);
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_1677
     * @tc.name    ColumnsExtension1677
     * @tc.desc    Sample average of 2 values keeps the exact mean 6
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5a023', 0, () => {
      expect(averageOf([3, 9])).assertEqual(6);
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_1678
     * @tc.name    ColumnsExtension1678
     * @tc.desc    Sample average of 2 values keeps the exact mean 8
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5a024', 0, () => {
      expect(averageOf([4, 12])).assertEqual(8);
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_1679
     * @tc.name    ColumnsExtension1679
     * @tc.desc    Sample average of 2 values keeps the exact mean 10
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5a025', 0, () => {
      expect(averageOf([5, 15])).assertEqual(10);
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_1680
     * @tc.name    ColumnsExtension1680
     * @tc.desc    Sample average of 2 values keeps the exact mean 12
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5a026', 0, () => {
      expect(averageOf([6, 18])).assertEqual(12);
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_1681
     * @tc.name    ColumnsExtension1681
     * @tc.desc    Sample average of 2 values keeps the exact mean 14
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5a027', 0, () => {
      expect(averageOf([7, 21])).assertEqual(14);
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_1682
     * @tc.name    ColumnsExtension1682
     * @tc.desc    Sample average of 2 values keeps the exact mean 16
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5a028', 0, () => {
      expect(averageOf([8, 24])).assertEqual(16);
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_1683
     * @tc.name    ColumnsExtension1683
     * @tc.desc    Sample average of 2 values keeps the exact mean 18
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5a029', 0, () => {
      expect(averageOf([9, 27])).assertEqual(18);
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_1684
     * @tc.name    ColumnsExtension1684
     * @tc.desc    Sample average of 2 values keeps the exact mean 20
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5a030', 0, () => {
      expect(averageOf([10, 30])).assertEqual(20);
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_1685
     * @tc.name    ColumnsExtension1685
     * @tc.desc    Sample average of 2 values keeps the exact mean 22
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5a031', 0, () => {
      expect(averageOf([11, 33])).assertEqual(22);
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_1686
     * @tc.name    ColumnsExtension1686
     * @tc.desc    Sample average of 2 values keeps the exact mean 24
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5a032', 0, () => {
      expect(averageOf([12, 36])).assertEqual(24);
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_1687
     * @tc.name    ColumnsExtension1687
     * @tc.desc    Sample average of 2 values keeps the exact mean 26
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5a033', 0, () => {
      expect(averageOf([13, 39])).assertEqual(26);
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_1688
     * @tc.name    ColumnsExtension1688
     * @tc.desc    Sample average of 2 values keeps the exact mean 28
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5a034', 0, () => {
      expect(averageOf([14, 42])).assertEqual(28);
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_1689
     * @tc.name    ColumnsExtension1689
     * @tc.desc    Sample average of 2 values keeps the exact mean 30
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5a035', 0, () => {
      expect(averageOf([15, 45])).assertEqual(30);
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_1690
     * @tc.name    ColumnsExtension1690
     * @tc.desc    Sample average of 2 values keeps the exact mean 32
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5a036', 0, () => {
      expect(averageOf([16, 48])).assertEqual(32);
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_1691
     * @tc.name    ColumnsExtension1691
     * @tc.desc    Sample average of 2 values keeps the exact mean 34
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5a037', 0, () => {
      expect(averageOf([17, 51])).assertEqual(34);
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_1692
     * @tc.name    ColumnsExtension1692
     * @tc.desc    Sample average of 2 values keeps the exact mean 36
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5a038', 0, () => {
      expect(averageOf([18, 54])).assertEqual(36);
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_1693
     * @tc.name    ColumnsExtension1693
     * @tc.desc    Sample average of 2 values keeps the exact mean 38
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5a039', 0, () => {
      expect(averageOf([19, 57])).assertEqual(38);
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_1694
     * @tc.name    ColumnsExtension1694
     * @tc.desc    Sample average of 2 values keeps the exact mean 40
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5a040', 0, () => {
      expect(averageOf([20, 60])).assertEqual(40);
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_1695
     * @tc.name    ColumnsExtension1695
     * @tc.desc    Sample average of 2 values keeps the exact mean 0
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5a041', 0, () => {
      expect(averageOf([-1, 1])).assertEqual(0);
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_1696
     * @tc.name    ColumnsExtension1696
     * @tc.desc    Sample average of 2 values keeps the exact mean 0
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5a042', 0, () => {
      expect(averageOf([-2, 2])).assertEqual(0);
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_1697
     * @tc.name    ColumnsExtension1697
     * @tc.desc    Sample average of 2 values keeps the exact mean 0
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5a043', 0, () => {
      expect(averageOf([-3, 3])).assertEqual(0);
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_1698
     * @tc.name    ColumnsExtension1698
     * @tc.desc    Sample average of 2 values keeps the exact mean 0
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5a044', 0, () => {
      expect(averageOf([-4, 4])).assertEqual(0);
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_1699
     * @tc.name    ColumnsExtension1699
     * @tc.desc    Sample average of 2 values keeps the exact mean 0
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5a045', 0, () => {
      expect(averageOf([-5, 5])).assertEqual(0);
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_1700
     * @tc.name    ColumnsExtension1700
     * @tc.desc    Sample average of 2 values keeps the exact mean 0
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5a046', 0, () => {
      expect(averageOf([-6, 6])).assertEqual(0);
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_1701
     * @tc.name    ColumnsExtension1701
     * @tc.desc    Sample average of 2 values keeps the exact mean 0
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5a047', 0, () => {
      expect(averageOf([-7, 7])).assertEqual(0);
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_1702
     * @tc.name    ColumnsExtension1702
     * @tc.desc    Sample average of 2 values keeps the exact mean 0
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5a048', 0, () => {
      expect(averageOf([-8, 8])).assertEqual(0);
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_1703
     * @tc.name    ColumnsExtension1703
     * @tc.desc    Sample average of 2 values keeps the exact mean 0
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5a049', 0, () => {
      expect(averageOf([-9, 9])).assertEqual(0);
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_1704
     * @tc.name    ColumnsExtension1704
     * @tc.desc    Sample average of 2 values keeps the exact mean 0
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5a050', 0, () => {
      expect(averageOf([-10, 10])).assertEqual(0);
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_1705
     * @tc.name    ColumnsExtension1705
     * @tc.desc    Sample average of 2 values keeps the exact mean 1.5
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5a051', 0, () => {
      expect(averageOf([1, 2])).assertEqual(1.5);
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_1706
     * @tc.name    ColumnsExtension1706
     * @tc.desc    Sample average of 2 values keeps the exact mean 2.5
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5a052', 0, () => {
      expect(averageOf([2, 3])).assertEqual(2.5);
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_1707
     * @tc.name    ColumnsExtension1707
     * @tc.desc    Sample average of 2 values keeps the exact mean 3.5
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5a053', 0, () => {
      expect(averageOf([3, 4])).assertEqual(3.5);
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_1708
     * @tc.name    ColumnsExtension1708
     * @tc.desc    Sample average of 2 values keeps the exact mean 4.5
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5a054', 0, () => {
      expect(averageOf([4, 5])).assertEqual(4.5);
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_1709
     * @tc.name    ColumnsExtension1709
     * @tc.desc    Sample average of 2 values keeps the exact mean 5.5
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5a055', 0, () => {
      expect(averageOf([5, 6])).assertEqual(5.5);
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_1710
     * @tc.name    ColumnsExtension1710
     * @tc.desc    Sample average of 2 values keeps the exact mean 6.5
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5a056', 0, () => {
      expect(averageOf([6, 7])).assertEqual(6.5);
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_1711
     * @tc.name    ColumnsExtension1711
     * @tc.desc    Sample average of 2 values keeps the exact mean 7.5
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5a057', 0, () => {
      expect(averageOf([7, 8])).assertEqual(7.5);
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_1712
     * @tc.name    ColumnsExtension1712
     * @tc.desc    Sample average of 2 values keeps the exact mean 8.5
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5a058', 0, () => {
      expect(averageOf([8, 9])).assertEqual(8.5);
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_1713
     * @tc.name    ColumnsExtension1713
     * @tc.desc    Sample average of 2 values keeps the exact mean 9.5
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5a059', 0, () => {
      expect(averageOf([9, 10])).assertEqual(9.5);
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_1714
     * @tc.name    ColumnsExtension1714
     * @tc.desc    Sample average of 2 values keeps the exact mean 10.5
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5a060', 0, () => {
      expect(averageOf([10, 11])).assertEqual(10.5);
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_1715
     * @tc.name    ColumnsExtension1715
     * @tc.desc    Sample range of 3 values keeps the exact spread 1
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5r001', 0, () => {
      expect(rangeOf([1, 0, 0])).assertEqual(1);
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_1716
     * @tc.name    ColumnsExtension1716
     * @tc.desc    Sample range of 3 values keeps the exact spread 2
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5r002', 0, () => {
      expect(rangeOf([1, 1, -1])).assertEqual(2);
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_1717
     * @tc.name    ColumnsExtension1717
     * @tc.desc    Sample range of 3 values keeps the exact spread 4
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5r003', 0, () => {
      expect(rangeOf([1, 2, -2])).assertEqual(4);
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_1718
     * @tc.name    ColumnsExtension1718
     * @tc.desc    Sample range of 3 values keeps the exact spread 6
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5r004', 0, () => {
      expect(rangeOf([1, 3, -3])).assertEqual(6);
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_1719
     * @tc.name    ColumnsExtension1719
     * @tc.desc    Sample range of 3 values keeps the exact spread 8
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5r005', 0, () => {
      expect(rangeOf([1, 4, -4])).assertEqual(8);
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_1720
     * @tc.name    ColumnsExtension1720
     * @tc.desc    Sample range of 3 values keeps the exact spread 10
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5r006', 0, () => {
      expect(rangeOf([1, 5, -5])).assertEqual(10);
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_1721
     * @tc.name    ColumnsExtension1721
     * @tc.desc    Sample range of 3 values keeps the exact spread 2
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5r007', 0, () => {
      expect(rangeOf([2, 0, 0])).assertEqual(2);
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_1722
     * @tc.name    ColumnsExtension1722
     * @tc.desc    Sample range of 3 values keeps the exact spread 4
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5r008', 0, () => {
      expect(rangeOf([2, 1, -2])).assertEqual(4);
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_1723
     * @tc.name    ColumnsExtension1723
     * @tc.desc    Sample range of 3 values keeps the exact spread 6
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5r009', 0, () => {
      expect(rangeOf([2, 2, -4])).assertEqual(6);
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_1724
     * @tc.name    ColumnsExtension1724
     * @tc.desc    Sample range of 3 values keeps the exact spread 9
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5r010', 0, () => {
      expect(rangeOf([2, 3, -6])).assertEqual(9);
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_1725
     * @tc.name    ColumnsExtension1725
     * @tc.desc    Sample range of 3 values keeps the exact spread 12
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5r011', 0, () => {
      expect(rangeOf([2, 4, -8])).assertEqual(12);
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_1726
     * @tc.name    ColumnsExtension1726
     * @tc.desc    Sample range of 3 values keeps the exact spread 15
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5r012', 0, () => {
      expect(rangeOf([2, 5, -10])).assertEqual(15);
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_1727
     * @tc.name    ColumnsExtension1727
     * @tc.desc    Sample range of 3 values keeps the exact spread 3
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5r013', 0, () => {
      expect(rangeOf([3, 0, 0])).assertEqual(3);
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_1728
     * @tc.name    ColumnsExtension1728
     * @tc.desc    Sample range of 3 values keeps the exact spread 6
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5r014', 0, () => {
      expect(rangeOf([3, 1, -3])).assertEqual(6);
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_1729
     * @tc.name    ColumnsExtension1729
     * @tc.desc    Sample range of 3 values keeps the exact spread 9
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5r015', 0, () => {
      expect(rangeOf([3, 2, -6])).assertEqual(9);
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_1730
     * @tc.name    ColumnsExtension1730
     * @tc.desc    Sample range of 3 values keeps the exact spread 12
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5r016', 0, () => {
      expect(rangeOf([3, 3, -9])).assertEqual(12);
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_1731
     * @tc.name    ColumnsExtension1731
     * @tc.desc    Sample range of 3 values keeps the exact spread 16
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5r017', 0, () => {
      expect(rangeOf([3, 4, -12])).assertEqual(16);
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_1732
     * @tc.name    ColumnsExtension1732
     * @tc.desc    Sample range of 3 values keeps the exact spread 20
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5r018', 0, () => {
      expect(rangeOf([3, 5, -15])).assertEqual(20);
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_1733
     * @tc.name    ColumnsExtension1733
     * @tc.desc    Sample range of 3 values keeps the exact spread 4
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5r019', 0, () => {
      expect(rangeOf([4, 0, 0])).assertEqual(4);
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_1734
     * @tc.name    ColumnsExtension1734
     * @tc.desc    Sample range of 3 values keeps the exact spread 8
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5r020', 0, () => {
      expect(rangeOf([4, 1, -4])).assertEqual(8);
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_1735
     * @tc.name    ColumnsExtension1735
     * @tc.desc    Sample range of 3 values keeps the exact spread 12
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5r021', 0, () => {
      expect(rangeOf([4, 2, -8])).assertEqual(12);
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_1736
     * @tc.name    ColumnsExtension1736
     * @tc.desc    Sample range of 3 values keeps the exact spread 16
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5r022', 0, () => {
      expect(rangeOf([4, 3, -12])).assertEqual(16);
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_1737
     * @tc.name    ColumnsExtension1737
     * @tc.desc    Sample range of 3 values keeps the exact spread 20
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5r023', 0, () => {
      expect(rangeOf([4, 4, -16])).assertEqual(20);
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_1738
     * @tc.name    ColumnsExtension1738
     * @tc.desc    Sample range of 3 values keeps the exact spread 25
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5r024', 0, () => {
      expect(rangeOf([4, 5, -20])).assertEqual(25);
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_1739
     * @tc.name    ColumnsExtension1739
     * @tc.desc    Sample range of 3 values keeps the exact spread 5
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5r025', 0, () => {
      expect(rangeOf([5, 0, 0])).assertEqual(5);
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_1740
     * @tc.name    ColumnsExtension1740
     * @tc.desc    Sample range of 3 values keeps the exact spread 10
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5r026', 0, () => {
      expect(rangeOf([5, 1, -5])).assertEqual(10);
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_1741
     * @tc.name    ColumnsExtension1741
     * @tc.desc    Sample range of 3 values keeps the exact spread 15
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5r027', 0, () => {
      expect(rangeOf([5, 2, -10])).assertEqual(15);
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_1742
     * @tc.name    ColumnsExtension1742
     * @tc.desc    Sample range of 3 values keeps the exact spread 20
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5r028', 0, () => {
      expect(rangeOf([5, 3, -15])).assertEqual(20);
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_1743
     * @tc.name    ColumnsExtension1743
     * @tc.desc    Sample range of 3 values keeps the exact spread 25
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5r029', 0, () => {
      expect(rangeOf([5, 4, -20])).assertEqual(25);
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_1744
     * @tc.name    ColumnsExtension1744
     * @tc.desc    Sample range of 3 values keeps the exact spread 30
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5r030', 0, () => {
      expect(rangeOf([5, 5, -25])).assertEqual(30);
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_1745
     * @tc.name    ColumnsExtension1745
     * @tc.desc    Sample range of 3 values keeps the exact spread 6
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5r031', 0, () => {
      expect(rangeOf([6, 0, 0])).assertEqual(6);
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_1746
     * @tc.name    ColumnsExtension1746
     * @tc.desc    Sample range of 3 values keeps the exact spread 12
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5r032', 0, () => {
      expect(rangeOf([6, 1, -6])).assertEqual(12);
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_1747
     * @tc.name    ColumnsExtension1747
     * @tc.desc    Sample range of 3 values keeps the exact spread 18
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5r033', 0, () => {
      expect(rangeOf([6, 2, -12])).assertEqual(18);
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_1748
     * @tc.name    ColumnsExtension1748
     * @tc.desc    Sample range of 3 values keeps the exact spread 24
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5r034', 0, () => {
      expect(rangeOf([6, 3, -18])).assertEqual(24);
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_1749
     * @tc.name    ColumnsExtension1749
     * @tc.desc    Sample range of 3 values keeps the exact spread 30
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5r035', 0, () => {
      expect(rangeOf([6, 4, -24])).assertEqual(30);
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_1750
     * @tc.name    ColumnsExtension1750
     * @tc.desc    Sample range of 3 values keeps the exact spread 36
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5r036', 0, () => {
      expect(rangeOf([6, 5, -30])).assertEqual(36);
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_1751
     * @tc.name    ColumnsExtension1751
     * @tc.desc    Sample range of 3 values keeps the exact spread 7
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5r037', 0, () => {
      expect(rangeOf([7, 0, 0])).assertEqual(7);
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_1752
     * @tc.name    ColumnsExtension1752
     * @tc.desc    Sample range of 3 values keeps the exact spread 14
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5r038', 0, () => {
      expect(rangeOf([7, 1, -7])).assertEqual(14);
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_1753
     * @tc.name    ColumnsExtension1753
     * @tc.desc    Sample range of 3 values keeps the exact spread 21
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5r039', 0, () => {
      expect(rangeOf([7, 2, -14])).assertEqual(21);
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_1754
     * @tc.name    ColumnsExtension1754
     * @tc.desc    Sample range of 3 values keeps the exact spread 28
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5r040', 0, () => {
      expect(rangeOf([7, 3, -21])).assertEqual(28);
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_1755
     * @tc.name    ColumnsExtension1755
     * @tc.desc    Sample range of 3 values keeps the exact spread 35
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5r041', 0, () => {
      expect(rangeOf([7, 4, -28])).assertEqual(35);
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_1756
     * @tc.name    ColumnsExtension1756
     * @tc.desc    Sample range of 3 values keeps the exact spread 42
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5r042', 0, () => {
      expect(rangeOf([7, 5, -35])).assertEqual(42);
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_1757
     * @tc.name    ColumnsExtension1757
     * @tc.desc    Sample range of 3 values keeps the exact spread 8
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5r043', 0, () => {
      expect(rangeOf([8, 0, 0])).assertEqual(8);
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_1758
     * @tc.name    ColumnsExtension1758
     * @tc.desc    Sample range of 3 values keeps the exact spread 16
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5r044', 0, () => {
      expect(rangeOf([8, 1, -8])).assertEqual(16);
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_1759
     * @tc.name    ColumnsExtension1759
     * @tc.desc    Sample range of 3 values keeps the exact spread 24
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5r045', 0, () => {
      expect(rangeOf([8, 2, -16])).assertEqual(24);
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_1760
     * @tc.name    ColumnsExtension1760
     * @tc.desc    Sample range of 3 values keeps the exact spread 32
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5r046', 0, () => {
      expect(rangeOf([8, 3, -24])).assertEqual(32);
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_1761
     * @tc.name    ColumnsExtension1761
     * @tc.desc    Sample range of 3 values keeps the exact spread 40
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5r047', 0, () => {
      expect(rangeOf([8, 4, -32])).assertEqual(40);
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_1762
     * @tc.name    ColumnsExtension1762
     * @tc.desc    Sample range of 3 values keeps the exact spread 48
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5r048', 0, () => {
      expect(rangeOf([8, 5, -40])).assertEqual(48);
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_1763
     * @tc.name    ColumnsExtension1763
     * @tc.desc    Sample range of 3 values keeps the exact spread 9
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5r049', 0, () => {
      expect(rangeOf([9, 0, 0])).assertEqual(9);
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_1764
     * @tc.name    ColumnsExtension1764
     * @tc.desc    Sample range of 3 values keeps the exact spread 18
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5r050', 0, () => {
      expect(rangeOf([9, 1, -9])).assertEqual(18);
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_1765
     * @tc.name    ColumnsExtension1765
     * @tc.desc    Sample range of 3 values keeps the exact spread 27
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5r051', 0, () => {
      expect(rangeOf([9, 2, -18])).assertEqual(27);
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_1766
     * @tc.name    ColumnsExtension1766
     * @tc.desc    Sample range of 3 values keeps the exact spread 36
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5r052', 0, () => {
      expect(rangeOf([9, 3, -27])).assertEqual(36);
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_1767
     * @tc.name    ColumnsExtension1767
     * @tc.desc    Sample range of 3 values keeps the exact spread 45
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5r053', 0, () => {
      expect(rangeOf([9, 4, -36])).assertEqual(45);
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_1768
     * @tc.name    ColumnsExtension1768
     * @tc.desc    Sample range of 3 values keeps the exact spread 54
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5r054', 0, () => {
      expect(rangeOf([9, 5, -45])).assertEqual(54);
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_1769
     * @tc.name    ColumnsExtension1769
     * @tc.desc    Sample range of 3 values keeps the exact spread 10
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5r055', 0, () => {
      expect(rangeOf([10, 0, 0])).assertEqual(10);
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_1770
     * @tc.name    ColumnsExtension1770
     * @tc.desc    Sample range of 3 values keeps the exact spread 20
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5r056', 0, () => {
      expect(rangeOf([10, 1, -10])).assertEqual(20);
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_1771
     * @tc.name    ColumnsExtension1771
     * @tc.desc    Sample range of 3 values keeps the exact spread 30
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5r057', 0, () => {
      expect(rangeOf([10, 2, -20])).assertEqual(30);
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_1772
     * @tc.name    ColumnsExtension1772
     * @tc.desc    Sample range of 3 values keeps the exact spread 40
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5r058', 0, () => {
      expect(rangeOf([10, 3, -30])).assertEqual(40);
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_1773
     * @tc.name    ColumnsExtension1773
     * @tc.desc    Sample range of 3 values keeps the exact spread 50
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5r059', 0, () => {
      expect(rangeOf([10, 4, -40])).assertEqual(50);
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_1774
     * @tc.name    ColumnsExtension1774
     * @tc.desc    Sample range of 3 values keeps the exact spread 60
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5r060', 0, () => {
      expect(rangeOf([10, 5, -50])).assertEqual(60);
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_1775
     * @tc.name    ColumnsExtension1775
     * @tc.desc    Setting the inbox counter lowering it to zero changes the mail total
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5m1zero', 0, () => {
      const model: ColumnsModel = new ColumnsModel();
      model.getMails()[0].num = 0;
      expect(model.getTotalMailNum()).assertEqual(11);
      expect(model.getMailKinds()).assertEqual(3);
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_1776
     * @tc.name    ColumnsExtension1776
     * @tc.desc    Setting the inbox counter making it negative changes the mail total
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5m1neg', 0, () => {
      const model: ColumnsModel = new ColumnsModel();
      model.getMails()[0].num = -1;
      expect(model.getTotalMailNum()).assertEqual(10);
      expect(model.getMailKinds()).assertEqual(3);
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_1777
     * @tc.name    ColumnsExtension1777
     * @tc.desc    Setting the inbox counter making it fractional changes the mail total
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5m1half', 0, () => {
      const model: ColumnsModel = new ColumnsModel();
      model.getMails()[0].num = 0.5;
      expect(model.getTotalMailNum()).assertEqual(11.5);
      expect(model.getMailKinds()).assertEqual(3);
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_1778
     * @tc.name    ColumnsExtension1778
     * @tc.desc    Setting the inbox counter raising it to one million changes the mail total
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5m1big', 0, () => {
      const model: ColumnsModel = new ColumnsModel();
      model.getMails()[0].num = 1000000;
      expect(model.getTotalMailNum()).assertEqual(1000011);
      expect(model.getMailKinds()).assertEqual(3);
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_1779
     * @tc.name    ColumnsExtension1779
     * @tc.desc    Setting the sent counter lowering it to zero changes the mail total
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5m2zero', 0, () => {
      const model: ColumnsModel = new ColumnsModel();
      model.getMails()[1].num = 0;
      expect(model.getTotalMailNum()).assertEqual(15);
      expect(model.getMailKinds()).assertEqual(3);
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_1780
     * @tc.name    ColumnsExtension1780
     * @tc.desc    Setting the sent counter making it negative changes the mail total
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5m2neg', 0, () => {
      const model: ColumnsModel = new ColumnsModel();
      model.getMails()[1].num = -1;
      expect(model.getTotalMailNum()).assertEqual(14);
      expect(model.getMailKinds()).assertEqual(3);
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_1781
     * @tc.name    ColumnsExtension1781
     * @tc.desc    Setting the sent counter making it fractional changes the mail total
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5m2half', 0, () => {
      const model: ColumnsModel = new ColumnsModel();
      model.getMails()[1].num = 0.5;
      expect(model.getTotalMailNum()).assertEqual(15.5);
      expect(model.getMailKinds()).assertEqual(3);
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_1782
     * @tc.name    ColumnsExtension1782
     * @tc.desc    Setting the sent counter raising it to one million changes the mail total
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5m2big', 0, () => {
      const model: ColumnsModel = new ColumnsModel();
      model.getMails()[1].num = 1000000;
      expect(model.getTotalMailNum()).assertEqual(1000015);
      expect(model.getMailKinds()).assertEqual(3);
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_1783
     * @tc.name    ColumnsExtension1783
     * @tc.desc    Setting the draft counter lowering it to zero changes the mail total
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5m3zero', 0, () => {
      const model: ColumnsModel = new ColumnsModel();
      model.getMails()[2].num = 0;
      expect(model.getTotalMailNum()).assertEqual(20);
      expect(model.getMailKinds()).assertEqual(3);
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_1784
     * @tc.name    ColumnsExtension1784
     * @tc.desc    Setting the draft counter making it negative changes the mail total
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5m3neg', 0, () => {
      const model: ColumnsModel = new ColumnsModel();
      model.getMails()[2].num = -1;
      expect(model.getTotalMailNum()).assertEqual(19);
      expect(model.getMailKinds()).assertEqual(3);
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_1785
     * @tc.name    ColumnsExtension1785
     * @tc.desc    Setting the draft counter making it fractional changes the mail total
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5m3half', 0, () => {
      const model: ColumnsModel = new ColumnsModel();
      model.getMails()[2].num = 0.5;
      expect(model.getTotalMailNum()).assertEqual(20.5);
      expect(model.getMailKinds()).assertEqual(3);
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_1786
     * @tc.name    ColumnsExtension1786
     * @tc.desc    Setting the draft counter raising it to one million changes the mail total
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5m3big', 0, () => {
      const model: ColumnsModel = new ColumnsModel();
      model.getMails()[2].num = 1000000;
      expect(model.getTotalMailNum()).assertEqual(1.00002e+06);
      expect(model.getMailKinds()).assertEqual(3);
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_1787
     * @tc.name    ColumnsExtension1787
     * @tc.desc    Setting the album photo counter lowering it to zero changes the photo total
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5p1zero', 0, () => {
      const model: ColumnsModel = new ColumnsModel();
      model.getPhotos()[0].count = 0;
      expect(model.getTotalPhotoCount()).assertEqual(43);
      expect(model.getPhotoKinds()).assertEqual(4);
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_1788
     * @tc.name    ColumnsExtension1788
     * @tc.desc    Setting the album photo counter making it negative changes the photo total
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5p1neg', 0, () => {
      const model: ColumnsModel = new ColumnsModel();
      model.getPhotos()[0].count = -1;
      expect(model.getTotalPhotoCount()).assertEqual(42);
      expect(model.getPhotoKinds()).assertEqual(4);
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_1789
     * @tc.name    ColumnsExtension1789
     * @tc.desc    Setting the album photo counter making it fractional changes the photo total
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5p1half', 0, () => {
      const model: ColumnsModel = new ColumnsModel();
      model.getPhotos()[0].count = 0.5;
      expect(model.getTotalPhotoCount()).assertEqual(43.5);
      expect(model.getPhotoKinds()).assertEqual(4);
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_1790
     * @tc.name    ColumnsExtension1790
     * @tc.desc    Setting the album photo counter raising it to one million changes the photo total
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5p1big', 0, () => {
      const model: ColumnsModel = new ColumnsModel();
      model.getPhotos()[0].count = 1000000;
      expect(model.getTotalPhotoCount()).assertEqual(1000043);
      expect(model.getPhotoKinds()).assertEqual(4);
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_1791
     * @tc.name    ColumnsExtension1791
     * @tc.desc    Setting the camera photo counter lowering it to zero changes the photo total
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5p2zero', 0, () => {
      const model: ColumnsModel = new ColumnsModel();
      model.getPhotos()[1].count = 0;
      expect(model.getTotalPhotoCount()).assertEqual(70);
      expect(model.getPhotoKinds()).assertEqual(4);
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_1792
     * @tc.name    ColumnsExtension1792
     * @tc.desc    Setting the camera photo counter making it negative changes the photo total
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5p2neg', 0, () => {
      const model: ColumnsModel = new ColumnsModel();
      model.getPhotos()[1].count = -1;
      expect(model.getTotalPhotoCount()).assertEqual(69);
      expect(model.getPhotoKinds()).assertEqual(4);
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_1793
     * @tc.name    ColumnsExtension1793
     * @tc.desc    Setting the camera photo counter making it fractional changes the photo total
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5p2half', 0, () => {
      const model: ColumnsModel = new ColumnsModel();
      model.getPhotos()[1].count = 0.5;
      expect(model.getTotalPhotoCount()).assertEqual(70.5);
      expect(model.getPhotoKinds()).assertEqual(4);
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_1794
     * @tc.name    ColumnsExtension1794
     * @tc.desc    Setting the camera photo counter raising it to one million changes the photo total
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5p2big', 0, () => {
      const model: ColumnsModel = new ColumnsModel();
      model.getPhotos()[1].count = 1000000;
      expect(model.getTotalPhotoCount()).assertEqual(1.00007e+06);
      expect(model.getPhotoKinds()).assertEqual(4);
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_1795
     * @tc.name    ColumnsExtension1795
     * @tc.desc    Setting the video photo counter lowering it to zero changes the photo total
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5p3zero', 0, () => {
      const model: ColumnsModel = new ColumnsModel();
      model.getPhotos()[2].count = 0;
      expect(model.getTotalPhotoCount()).assertEqual(84);
      expect(model.getPhotoKinds()).assertEqual(4);
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_1796
     * @tc.name    ColumnsExtension1796
     * @tc.desc    Setting the video photo counter making it negative changes the photo total
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5p3neg', 0, () => {
      const model: ColumnsModel = new ColumnsModel();
      model.getPhotos()[2].count = -1;
      expect(model.getTotalPhotoCount()).assertEqual(83);
      expect(model.getPhotoKinds()).assertEqual(4);
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_1797
     * @tc.name    ColumnsExtension1797
     * @tc.desc    Setting the video photo counter making it fractional changes the photo total
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5p3half', 0, () => {
      const model: ColumnsModel = new ColumnsModel();
      model.getPhotos()[2].count = 0.5;
      expect(model.getTotalPhotoCount()).assertEqual(84.5);
      expect(model.getPhotoKinds()).assertEqual(4);
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_1798
     * @tc.name    ColumnsExtension1798
     * @tc.desc    Setting the video photo counter raising it to one million changes the photo total
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5p3big', 0, () => {
      const model: ColumnsModel = new ColumnsModel();
      model.getPhotos()[2].count = 1000000;
      expect(model.getTotalPhotoCount()).assertEqual(1000084);
      expect(model.getPhotoKinds()).assertEqual(4);
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_1799
     * @tc.name    ColumnsExtension1799
     * @tc.desc    Setting the favorite photo counter lowering it to zero changes the photo total
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5p4zero', 0, () => {
      const model: ColumnsModel = new ColumnsModel();
      model.getPhotos()[3].count = 0;
      expect(model.getTotalPhotoCount()).assertEqual(76);
      expect(model.getPhotoKinds()).assertEqual(4);
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_1800
     * @tc.name    ColumnsExtension1800
     * @tc.desc    Setting the favorite photo counter making it negative changes the photo total
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5p4neg', 0, () => {
      const model: ColumnsModel = new ColumnsModel();
      model.getPhotos()[3].count = -1;
      expect(model.getTotalPhotoCount()).assertEqual(75);
      expect(model.getPhotoKinds()).assertEqual(4);
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_1801
     * @tc.name    ColumnsExtension1801
     * @tc.desc    Setting the favorite photo counter making it fractional changes the photo total
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5p4half', 0, () => {
      const model: ColumnsModel = new ColumnsModel();
      model.getPhotos()[3].count = 0.5;
      expect(model.getTotalPhotoCount()).assertEqual(76.5);
      expect(model.getPhotoKinds()).assertEqual(4);
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_1802
     * @tc.name    ColumnsExtension1802
     * @tc.desc    Setting the favorite photo counter raising it to one million changes the photo total
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5p4big', 0, () => {
      const model: ColumnsModel = new ColumnsModel();
      model.getPhotos()[3].count = 1000000;
      expect(model.getTotalPhotoCount()).assertEqual(1000076);
      expect(model.getPhotoKinds()).assertEqual(4);
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_1803
     * @tc.name    ColumnsExtension1803
     * @tc.desc    Mail lookup resolves the inbox bucket by its exact type
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5lookup_inbox', 0, () => {
      const model: ColumnsModel = new ColumnsModel();
      expect((model.getMailByType('inbox') as ColumnsMailType).num > 0).assertTrue();
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_1804
     * @tc.name    ColumnsExtension1804
     * @tc.desc    Mail lookup resolves the sent bucket by its exact type
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5lookup_sent', 0, () => {
      const model: ColumnsModel = new ColumnsModel();
      expect((model.getMailByType('sent') as ColumnsMailType).num > 0).assertTrue();
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_1805
     * @tc.name    ColumnsExtension1805
     * @tc.desc    Mail lookup resolves the draft bucket by its exact type
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5lookup_draft', 0, () => {
      const model: ColumnsModel = new ColumnsModel();
      expect((model.getMailByType('draft') as ColumnsMailType).num > 0).assertTrue();
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_1806
     * @tc.name    ColumnsExtension1806
     * @tc.desc    Mail lookup reports undefined for an absent type variant
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5miss01', 0, () => {
      const model: ColumnsModel = new ColumnsModel();
      expect(model.getMailByType('inbox2') === undefined).assertTrue();
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_1807
     * @tc.name    ColumnsExtension1807
     * @tc.desc    Mail lookup reports undefined for an absent type variant
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5miss02', 0, () => {
      const model: ColumnsModel = new ColumnsModel();
      expect(model.getMailByType('SENT') === undefined).assertTrue();
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_1808
     * @tc.name    ColumnsExtension1808
     * @tc.desc    Mail lookup reports undefined for an absent type variant
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5miss03', 0, () => {
      const model: ColumnsModel = new ColumnsModel();
      expect(model.getMailByType('draft ') === undefined).assertTrue();
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_1809
     * @tc.name    ColumnsExtension1809
     * @tc.desc    Mail lookup reports undefined for an absent type variant
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5miss05', 0, () => {
      const model: ColumnsModel = new ColumnsModel();
      expect(model.getMailByType('archive') === undefined).assertTrue();
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_1810
     * @tc.name    ColumnsExtension1810
     * @tc.desc    Appending an unread bucket of 1 raises the mail total
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5pushMail01', 0, () => {
      const model: ColumnsModel = new ColumnsModel();
      model.getMails().push({ type: 'a', num: 1 });
      expect(model.getMailKinds()).assertEqual(4);
      expect(model.getTotalMailNum()).assertEqual(24);
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_1811
     * @tc.name    ColumnsExtension1811
     * @tc.desc    Appending an unread bucket of 2 raises the mail total
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5pushMail02', 0, () => {
      const model: ColumnsModel = new ColumnsModel();
      model.getMails().push({ type: 'b', num: 2 });
      expect(model.getMailKinds()).assertEqual(4);
      expect(model.getTotalMailNum()).assertEqual(25);
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_1812
     * @tc.name    ColumnsExtension1812
     * @tc.desc    Appending an unread bucket of 5 raises the mail total
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5pushMail03', 0, () => {
      const model: ColumnsModel = new ColumnsModel();
      model.getMails().push({ type: 'c', num: 5 });
      expect(model.getMailKinds()).assertEqual(4);
      expect(model.getTotalMailNum()).assertEqual(28);
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_1813
     * @tc.name    ColumnsExtension1813
     * @tc.desc    Appending an unread bucket of 10 raises the mail total
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5pushMail04', 0, () => {
      const model: ColumnsModel = new ColumnsModel();
      model.getMails().push({ type: 'd', num: 10 });
      expect(model.getMailKinds()).assertEqual(4);
      expect(model.getTotalMailNum()).assertEqual(33);
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_1814
     * @tc.name    ColumnsExtension1814
     * @tc.desc    Appending an unread bucket of 0 raises the mail total
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5pushMail05', 0, () => {
      const model: ColumnsModel = new ColumnsModel();
      model.getMails().push({ type: 'e', num: 0 });
      expect(model.getMailKinds()).assertEqual(4);
      expect(model.getTotalMailNum()).assertEqual(23);
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_1815
     * @tc.name    ColumnsExtension1815
     * @tc.desc    Appending an unread bucket of 100 raises the mail total
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5pushMail06', 0, () => {
      const model: ColumnsModel = new ColumnsModel();
      model.getMails().push({ type: 'f', num: 100 });
      expect(model.getMailKinds()).assertEqual(4);
      expect(model.getTotalMailNum()).assertEqual(123);
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_1816
     * @tc.name    ColumnsExtension1816
     * @tc.desc    Appending a photo category of 1 raises the photo total
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5pushPhoto01', 0, () => {
      const model: ColumnsModel = new ColumnsModel();
      model.getPhotos().push({ name: 'a', count: 1 });
      expect(model.getPhotoKinds()).assertEqual(5);
      expect(model.getTotalPhotoCount()).assertEqual(92);
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_1817
     * @tc.name    ColumnsExtension1817
     * @tc.desc    Appending a photo category of 2 raises the photo total
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5pushPhoto02', 0, () => {
      const model: ColumnsModel = new ColumnsModel();
      model.getPhotos().push({ name: 'b', count: 2 });
      expect(model.getPhotoKinds()).assertEqual(5);
      expect(model.getTotalPhotoCount()).assertEqual(93);
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_1818
     * @tc.name    ColumnsExtension1818
     * @tc.desc    Appending a photo category of 5 raises the photo total
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5pushPhoto03', 0, () => {
      const model: ColumnsModel = new ColumnsModel();
      model.getPhotos().push({ name: 'c', count: 5 });
      expect(model.getPhotoKinds()).assertEqual(5);
      expect(model.getTotalPhotoCount()).assertEqual(96);
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_1819
     * @tc.name    ColumnsExtension1819
     * @tc.desc    Appending a photo category of 10 raises the photo total
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5pushPhoto04', 0, () => {
      const model: ColumnsModel = new ColumnsModel();
      model.getPhotos().push({ name: 'd', count: 10 });
      expect(model.getPhotoKinds()).assertEqual(5);
      expect(model.getTotalPhotoCount()).assertEqual(101);
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_1820
     * @tc.name    ColumnsExtension1820
     * @tc.desc    Appending a photo category of 0 raises the photo total
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5pushPhoto05', 0, () => {
      const model: ColumnsModel = new ColumnsModel();
      model.getPhotos().push({ name: 'e', count: 0 });
      expect(model.getPhotoKinds()).assertEqual(5);
      expect(model.getTotalPhotoCount()).assertEqual(91);
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_1821
     * @tc.name    ColumnsExtension1821
     * @tc.desc    Appending a photo category of 100 raises the photo total
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5pushPhoto06', 0, () => {
      const model: ColumnsModel = new ColumnsModel();
      model.getPhotos().push({ name: 'f', count: 100 });
      expect(model.getPhotoKinds()).assertEqual(5);
      expect(model.getTotalPhotoCount()).assertEqual(191);
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_1822
     * @tc.name    ColumnsExtension1822
     * @tc.desc    Popping 1 entries lowers the mail total to 22
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5pop01', 0, () => {
      const model: ColumnsModel = new ColumnsModel();
      for (let i = 0; i < 1; i++) {
        model.getMails().pop();
      }
      expect(model.getMailKinds()).assertEqual(2);
      expect(model.getTotalMailNum()).assertEqual(20);
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_1823
     * @tc.name    ColumnsExtension1823
     * @tc.desc    Popping 2 entries lowers the mail total to 19
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5pop02', 0, () => {
      const model: ColumnsModel = new ColumnsModel();
      for (let i = 0; i < 2; i++) {
        model.getMails().pop();
      }
      expect(model.getMailKinds()).assertEqual(1);
      expect(model.getTotalMailNum()).assertEqual(12);
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_1824
     * @tc.name    ColumnsExtension1824
     * @tc.desc    Popping 3 entries lowers the mail total to 12
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5pop03', 0, () => {
      const model: ColumnsModel = new ColumnsModel();
      for (let i = 0; i < 3; i++) {
        model.getMails().pop();
      }
      expect(model.getMailKinds()).assertEqual(0);
      expect(model.getTotalMailNum()).assertEqual(0);
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_1825
     * @tc.name    ColumnsExtension1825
     * @tc.desc    Mail number validation returns true for zero
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5validMail_zero', 0, () => {
      const model: ColumnsModel = new ColumnsModel();
      model.getMails()[1].num = 0;
      expect(model.hasValidMailNums()).assertTrue();
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_1826
     * @tc.name    ColumnsExtension1826
     * @tc.desc    Mail number validation returns true for half
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5validMail_half', 0, () => {
      const model: ColumnsModel = new ColumnsModel();
      model.getMails()[1].num = 0.5;
      expect(model.hasValidMailNums()).assertTrue();
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_1827
     * @tc.name    ColumnsExtension1827
     * @tc.desc    Mail number validation returns false for neg
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5validMail_neg', 0, () => {
      const model: ColumnsModel = new ColumnsModel();
      model.getMails()[1].num = -1;
      expect(model.hasValidMailNums()).assertFalse();
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_1828
     * @tc.name    ColumnsExtension1828
     * @tc.desc    Mail number validation returns false for tinyNeg
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5validMail_tinyNeg', 0, () => {
      const model: ColumnsModel = new ColumnsModel();
      model.getMails()[1].num = -0.0001;
      expect(model.hasValidMailNums()).assertFalse();
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_1829
     * @tc.name    ColumnsExtension1829
     * @tc.desc    Positive photo check returns false for zero
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5validPhoto_zero', 0, () => {
      const model: ColumnsModel = new ColumnsModel();
      model.getPhotos()[2].count = 0;
      expect(model.hasPositivePhotoCounts()).assertFalse();
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_1830
     * @tc.name    ColumnsExtension1830
     * @tc.desc    Positive photo check returns false for neg
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5validPhoto_neg', 0, () => {
      const model: ColumnsModel = new ColumnsModel();
      model.getPhotos()[2].count = -1;
      expect(model.hasPositivePhotoCounts()).assertFalse();
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_1831
     * @tc.name    ColumnsExtension1831
     * @tc.desc    Positive photo check returns false for tinyNeg
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5validPhoto_tinyNeg', 0, () => {
      const model: ColumnsModel = new ColumnsModel();
      model.getPhotos()[2].count = -0.5;
      expect(model.hasPositivePhotoCounts()).assertFalse();
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_1832
     * @tc.name    ColumnsExtension1832
     * @tc.desc    Positive photo check returns true for half
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5validPhoto_half', 0, () => {
      const model: ColumnsModel = new ColumnsModel();
      model.getPhotos()[2].count = 0.5;
      expect(model.hasPositivePhotoCounts()).assertTrue();
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_1833
     * @tc.name    ColumnsExtension1833
     * @tc.desc    Positive photo check returns true for one
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5validPhoto_one', 0, () => {
      const model: ColumnsModel = new ColumnsModel();
      model.getPhotos()[2].count = 1;
      expect(model.hasPositivePhotoCounts()).assertTrue();
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_1834
     * @tc.name    ColumnsExtension1834
     * @tc.desc    Navbar ratio constant is 0.4
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5const_ratio', 0, () => {
      expect(COLUMNS_NAVBAR_RATIO).assertEqual(0.4);
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_1835
     * @tc.name    ColumnsExtension1835
     * @tc.desc    Navbar ratio validity holds
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5const_ratioValid', 0, () => {
      expect(new ColumnsModel().isRatioValid()).assertTrue();
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_1836
     * @tc.name    ColumnsExtension1836
     * @tc.desc    Mail kind constant is 3
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5const_mailKinds', 0, () => {
      expect(COLUMNS_MAIL_KINDS).assertEqual(3);
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_1837
     * @tc.name    ColumnsExtension1837
     * @tc.desc    Photo kind constant is 4
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5const_photoKinds', 0, () => {
      expect(COLUMNS_PHOTO_KINDS).assertEqual(4);
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_1838
     * @tc.name    ColumnsExtension1838
     * @tc.desc    Ten navbar ratios equal 4
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5const_ratioTimesTen', 0, () => {
      expect(COLUMNS_NAVBAR_RATIO * 10).assertEqual(4);
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_1839
     * @tc.name    ColumnsExtension1839
     * @tc.desc    Navbar and content widths keep the ratio split at window 605
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5ww0605', 0, () => {
      const model: ColumnsModel = new ColumnsModel();
      expect(model.navbarWidth(605)).assertEqual(242);
      expect(model.contentWidth(605)).assertEqual(363);
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_1840
     * @tc.name    ColumnsExtension1840
     * @tc.desc    Navbar and content widths keep the ratio split at window 610
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5ww0610', 0, () => {
      const model: ColumnsModel = new ColumnsModel();
      expect(model.navbarWidth(610)).assertEqual(244);
      expect(model.contentWidth(610)).assertEqual(366);
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_1841
     * @tc.name    ColumnsExtension1841
     * @tc.desc    Navbar and content widths keep the ratio split at window 615
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5ww0615', 0, () => {
      const model: ColumnsModel = new ColumnsModel();
      expect(model.navbarWidth(615)).assertEqual(246);
      expect(model.contentWidth(615)).assertEqual(369);
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_1842
     * @tc.name    ColumnsExtension1842
     * @tc.desc    Navbar and content widths keep the ratio split at window 620
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5ww0620', 0, () => {
      const model: ColumnsModel = new ColumnsModel();
      expect(model.navbarWidth(620)).assertEqual(248);
      expect(model.contentWidth(620)).assertEqual(372);
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_1843
     * @tc.name    ColumnsExtension1843
     * @tc.desc    Navbar and content widths keep the ratio split at window 625
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5ww0625', 0, () => {
      const model: ColumnsModel = new ColumnsModel();
      expect(model.navbarWidth(625)).assertEqual(250);
      expect(model.contentWidth(625)).assertEqual(375);
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_1844
     * @tc.name    ColumnsExtension1844
     * @tc.desc    Navbar and content widths keep the ratio split at window 630
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5ww0630', 0, () => {
      const model: ColumnsModel = new ColumnsModel();
      expect(model.navbarWidth(630)).assertEqual(252);
      expect(model.contentWidth(630)).assertEqual(378);
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_1845
     * @tc.name    ColumnsExtension1845
     * @tc.desc    Navbar and content widths keep the ratio split at window 635
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5ww0635', 0, () => {
      const model: ColumnsModel = new ColumnsModel();
      expect(model.navbarWidth(635)).assertEqual(254);
      expect(model.contentWidth(635)).assertEqual(381);
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_1846
     * @tc.name    ColumnsExtension1846
     * @tc.desc    Navbar and content widths keep the ratio split at window 640
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5ww0640', 0, () => {
      const model: ColumnsModel = new ColumnsModel();
      expect(model.navbarWidth(640)).assertEqual(256);
      expect(model.contentWidth(640)).assertEqual(384);
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_1847
     * @tc.name    ColumnsExtension1847
     * @tc.desc    Navbar and content widths keep the ratio split at window 645
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5ww0645', 0, () => {
      const model: ColumnsModel = new ColumnsModel();
      expect(model.navbarWidth(645)).assertEqual(258);
      expect(model.contentWidth(645)).assertEqual(387);
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_1848
     * @tc.name    ColumnsExtension1848
     * @tc.desc    Navbar and content widths keep the ratio split at window 650
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5ww0650', 0, () => {
      const model: ColumnsModel = new ColumnsModel();
      expect(model.navbarWidth(650)).assertEqual(260);
      expect(model.contentWidth(650)).assertEqual(390);
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_1849
     * @tc.name    ColumnsExtension1849
     * @tc.desc    Navbar and content widths keep the ratio split at window 655
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5ww0655', 0, () => {
      const model: ColumnsModel = new ColumnsModel();
      expect(model.navbarWidth(655)).assertEqual(262);
      expect(model.contentWidth(655)).assertEqual(393);
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_1850
     * @tc.name    ColumnsExtension1850
     * @tc.desc    Navbar and content widths keep the ratio split at window 660
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5ww0660', 0, () => {
      const model: ColumnsModel = new ColumnsModel();
      expect(model.navbarWidth(660)).assertEqual(264);
      expect(model.contentWidth(660)).assertEqual(396);
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_1851
     * @tc.name    ColumnsExtension1851
     * @tc.desc    Navbar and content widths keep the ratio split at window 665
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5ww0665', 0, () => {
      const model: ColumnsModel = new ColumnsModel();
      expect(model.navbarWidth(665)).assertEqual(266);
      expect(model.contentWidth(665)).assertEqual(399);
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_1852
     * @tc.name    ColumnsExtension1852
     * @tc.desc    Navbar and content widths keep the ratio split at window 670
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5ww0670', 0, () => {
      const model: ColumnsModel = new ColumnsModel();
      expect(model.navbarWidth(670)).assertEqual(268);
      expect(model.contentWidth(670)).assertEqual(402);
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_1853
     * @tc.name    ColumnsExtension1853
     * @tc.desc    Navbar and content widths keep the ratio split at window 675
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5ww0675', 0, () => {
      const model: ColumnsModel = new ColumnsModel();
      expect(model.navbarWidth(675)).assertEqual(270);
      expect(model.contentWidth(675)).assertEqual(405);
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_1854
     * @tc.name    ColumnsExtension1854
     * @tc.desc    Navbar and content widths keep the ratio split at window 680
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5ww0680', 0, () => {
      const model: ColumnsModel = new ColumnsModel();
      expect(model.navbarWidth(680)).assertEqual(272);
      expect(model.contentWidth(680)).assertEqual(408);
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_1855
     * @tc.name    ColumnsExtension1855
     * @tc.desc    Navbar and content widths keep the ratio split at window 685
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5ww0685', 0, () => {
      const model: ColumnsModel = new ColumnsModel();
      expect(model.navbarWidth(685)).assertEqual(274);
      expect(model.contentWidth(685)).assertEqual(411);
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_1856
     * @tc.name    ColumnsExtension1856
     * @tc.desc    Navbar and content widths keep the ratio split at window 690
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5ww0690', 0, () => {
      const model: ColumnsModel = new ColumnsModel();
      expect(model.navbarWidth(690)).assertEqual(276);
      expect(model.contentWidth(690)).assertEqual(414);
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_1857
     * @tc.name    ColumnsExtension1857
     * @tc.desc    Navbar and content widths keep the ratio split at window 695
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5ww0695', 0, () => {
      const model: ColumnsModel = new ColumnsModel();
      expect(model.navbarWidth(695)).assertEqual(278);
      expect(model.contentWidth(695)).assertEqual(417);
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_1858
     * @tc.name    ColumnsExtension1858
     * @tc.desc    Navbar and content widths keep the ratio split at window 700
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5ww0700', 0, () => {
      const model: ColumnsModel = new ColumnsModel();
      expect(model.navbarWidth(700)).assertEqual(280);
      expect(model.contentWidth(700)).assertEqual(420);
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_1859
     * @tc.name    ColumnsExtension1859
     * @tc.desc    Navbar and content widths keep the ratio split at window 705
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5ww0705', 0, () => {
      const model: ColumnsModel = new ColumnsModel();
      expect(model.navbarWidth(705)).assertEqual(282);
      expect(model.contentWidth(705)).assertEqual(423);
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_1860
     * @tc.name    ColumnsExtension1860
     * @tc.desc    Navbar and content widths keep the ratio split at window 710
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5ww0710', 0, () => {
      const model: ColumnsModel = new ColumnsModel();
      expect(model.navbarWidth(710)).assertEqual(284);
      expect(model.contentWidth(710)).assertEqual(426);
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_1861
     * @tc.name    ColumnsExtension1861
     * @tc.desc    Navbar and content widths keep the ratio split at window 715
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5ww0715', 0, () => {
      const model: ColumnsModel = new ColumnsModel();
      expect(model.navbarWidth(715)).assertEqual(286);
      expect(model.contentWidth(715)).assertEqual(429);
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_1862
     * @tc.name    ColumnsExtension1862
     * @tc.desc    Navbar and content widths keep the ratio split at window 720
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5ww0720', 0, () => {
      const model: ColumnsModel = new ColumnsModel();
      expect(model.navbarWidth(720)).assertEqual(288);
      expect(model.contentWidth(720)).assertEqual(432);
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_1863
     * @tc.name    ColumnsExtension1863
     * @tc.desc    Navbar and content widths keep the ratio split at window 725
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5ww0725', 0, () => {
      const model: ColumnsModel = new ColumnsModel();
      expect(model.navbarWidth(725)).assertEqual(290);
      expect(model.contentWidth(725)).assertEqual(435);
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_1864
     * @tc.name    ColumnsExtension1864
     * @tc.desc    Navbar and content widths keep the ratio split at window 730
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5ww0730', 0, () => {
      const model: ColumnsModel = new ColumnsModel();
      expect(model.navbarWidth(730)).assertEqual(292);
      expect(model.contentWidth(730)).assertEqual(438);
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_1865
     * @tc.name    ColumnsExtension1865
     * @tc.desc    Navbar and content widths keep the ratio split at window 735
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5ww0735', 0, () => {
      const model: ColumnsModel = new ColumnsModel();
      expect(model.navbarWidth(735)).assertEqual(294);
      expect(model.contentWidth(735)).assertEqual(441);
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_1866
     * @tc.name    ColumnsExtension1866
     * @tc.desc    Navbar and content widths keep the ratio split at window 740
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5ww0740', 0, () => {
      const model: ColumnsModel = new ColumnsModel();
      expect(model.navbarWidth(740)).assertEqual(296);
      expect(model.contentWidth(740)).assertEqual(444);
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_1867
     * @tc.name    ColumnsExtension1867
     * @tc.desc    Navbar and content widths keep the ratio split at window 745
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5ww0745', 0, () => {
      const model: ColumnsModel = new ColumnsModel();
      expect(model.navbarWidth(745)).assertEqual(298);
      expect(model.contentWidth(745)).assertEqual(447);
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_1868
     * @tc.name    ColumnsExtension1868
     * @tc.desc    Navbar and content widths keep the ratio split at window 750
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5ww0750', 0, () => {
      const model: ColumnsModel = new ColumnsModel();
      expect(model.navbarWidth(750)).assertEqual(300);
      expect(model.contentWidth(750)).assertEqual(450);
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_1869
     * @tc.name    ColumnsExtension1869
     * @tc.desc    Navbar and content widths keep the ratio split at window 755
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5ww0755', 0, () => {
      const model: ColumnsModel = new ColumnsModel();
      expect(model.navbarWidth(755)).assertEqual(302);
      expect(model.contentWidth(755)).assertEqual(453);
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_1870
     * @tc.name    ColumnsExtension1870
     * @tc.desc    Navbar and content widths keep the ratio split at window 760
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5ww0760', 0, () => {
      const model: ColumnsModel = new ColumnsModel();
      expect(model.navbarWidth(760)).assertEqual(304);
      expect(model.contentWidth(760)).assertEqual(456);
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_1871
     * @tc.name    ColumnsExtension1871
     * @tc.desc    Navbar and content widths keep the ratio split at window 765
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5ww0765', 0, () => {
      const model: ColumnsModel = new ColumnsModel();
      expect(model.navbarWidth(765)).assertEqual(306);
      expect(model.contentWidth(765)).assertEqual(459);
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_1872
     * @tc.name    ColumnsExtension1872
     * @tc.desc    Navbar and content widths keep the ratio split at window 770
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5ww0770', 0, () => {
      const model: ColumnsModel = new ColumnsModel();
      expect(model.navbarWidth(770)).assertEqual(308);
      expect(model.contentWidth(770)).assertEqual(462);
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_1873
     * @tc.name    ColumnsExtension1873
     * @tc.desc    Navbar and content widths keep the ratio split at window 775
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5ww0775', 0, () => {
      const model: ColumnsModel = new ColumnsModel();
      expect(model.navbarWidth(775)).assertEqual(310);
      expect(model.contentWidth(775)).assertEqual(465);
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_1874
     * @tc.name    ColumnsExtension1874
     * @tc.desc    Navbar and content widths keep the ratio split at window 780
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5ww0780', 0, () => {
      const model: ColumnsModel = new ColumnsModel();
      expect(model.navbarWidth(780)).assertEqual(312);
      expect(model.contentWidth(780)).assertEqual(468);
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_1875
     * @tc.name    ColumnsExtension1875
     * @tc.desc    Navbar and content widths keep the ratio split at window 785
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5ww0785', 0, () => {
      const model: ColumnsModel = new ColumnsModel();
      expect(model.navbarWidth(785)).assertEqual(314);
      expect(model.contentWidth(785)).assertEqual(471);
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_1876
     * @tc.name    ColumnsExtension1876
     * @tc.desc    Navbar and content widths keep the ratio split at window 790
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5ww0790', 0, () => {
      const model: ColumnsModel = new ColumnsModel();
      expect(model.navbarWidth(790)).assertEqual(316);
      expect(model.contentWidth(790)).assertEqual(474);
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_1877
     * @tc.name    ColumnsExtension1877
     * @tc.desc    Navbar and content widths keep the ratio split at window 795
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5ww0795', 0, () => {
      const model: ColumnsModel = new ColumnsModel();
      expect(model.navbarWidth(795)).assertEqual(318);
      expect(model.contentWidth(795)).assertEqual(477);
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_1878
     * @tc.name    ColumnsExtension1878
     * @tc.desc    Navbar and content widths keep the ratio split at window 800
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5ww0800', 0, () => {
      const model: ColumnsModel = new ColumnsModel();
      expect(model.navbarWidth(800)).assertEqual(320);
      expect(model.contentWidth(800)).assertEqual(480);
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_1879
     * @tc.name    ColumnsExtension1879
     * @tc.desc    Sample average of a wide pair stays exact at 3
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5avg2_01', 0, () => {
      expect(averageOf([1, 5])).assertEqual(3);
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_1880
     * @tc.name    ColumnsExtension1880
     * @tc.desc    Sample average of a wide pair stays exact at 5
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5avg2_03', 0, () => {
      expect(averageOf([3, 7])).assertEqual(5);
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_1881
     * @tc.name    ColumnsExtension1881
     * @tc.desc    Sample average of a wide pair stays exact at 6
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5avg2_04', 0, () => {
      expect(averageOf([4, 8])).assertEqual(6);
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_1882
     * @tc.name    ColumnsExtension1882
     * @tc.desc    Sample average of a wide pair stays exact at 7
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5avg2_05', 0, () => {
      expect(averageOf([5, 9])).assertEqual(7);
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_1883
     * @tc.name    ColumnsExtension1883
     * @tc.desc    Sample average of a wide pair stays exact at 8
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5avg2_06', 0, () => {
      expect(averageOf([6, 10])).assertEqual(8);
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_1884
     * @tc.name    ColumnsExtension1884
     * @tc.desc    Sample average of a wide pair stays exact at 9
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5avg2_07', 0, () => {
      expect(averageOf([7, 11])).assertEqual(9);
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_1885
     * @tc.name    ColumnsExtension1885
     * @tc.desc    Sample average of a wide pair stays exact at 10
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5avg2_08', 0, () => {
      expect(averageOf([8, 12])).assertEqual(10);
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_1886
     * @tc.name    ColumnsExtension1886
     * @tc.desc    Sample average of a wide pair stays exact at 11
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5avg2_09', 0, () => {
      expect(averageOf([9, 13])).assertEqual(11);
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_1887
     * @tc.name    ColumnsExtension1887
     * @tc.desc    Sample average of a wide pair stays exact at 12
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5avg2_10', 0, () => {
      expect(averageOf([10, 14])).assertEqual(12);
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_1888
     * @tc.name    ColumnsExtension1888
     * @tc.desc    Sample range of a wide pair stays exact at 100
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5rng2_01', 0, () => {
      expect(rangeOf([1, 101])).assertEqual(100);
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_1889
     * @tc.name    ColumnsExtension1889
     * @tc.desc    Sample range of a wide pair stays exact at 100
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5rng2_02', 0, () => {
      expect(rangeOf([2, 102])).assertEqual(100);
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_1890
     * @tc.name    ColumnsExtension1890
     * @tc.desc    Sample range of a wide pair stays exact at 100
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5rng2_03', 0, () => {
      expect(rangeOf([3, 103])).assertEqual(100);
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_1891
     * @tc.name    ColumnsExtension1891
     * @tc.desc    Sample range of a wide pair stays exact at 100
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5rng2_04', 0, () => {
      expect(rangeOf([4, 104])).assertEqual(100);
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_1892
     * @tc.name    ColumnsExtension1892
     * @tc.desc    Sample range of a wide pair stays exact at 100
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5rng2_05', 0, () => {
      expect(rangeOf([5, 105])).assertEqual(100);
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_1893
     * @tc.name    ColumnsExtension1893
     * @tc.desc    Sample range of a wide pair stays exact at 100
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5rng2_06', 0, () => {
      expect(rangeOf([6, 106])).assertEqual(100);
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_1894
     * @tc.name    ColumnsExtension1894
     * @tc.desc    Sample range of a wide pair stays exact at 100
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5rng2_07', 0, () => {
      expect(rangeOf([7, 107])).assertEqual(100);
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_1895
     * @tc.name    ColumnsExtension1895
     * @tc.desc    Sample range of a wide pair stays exact at 100
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5rng2_08', 0, () => {
      expect(rangeOf([8, 108])).assertEqual(100);
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_1896
     * @tc.name    ColumnsExtension1896
     * @tc.desc    Sample range of a wide pair stays exact at 100
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5rng2_09', 0, () => {
      expect(rangeOf([9, 109])).assertEqual(100);
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_1897
     * @tc.name    ColumnsExtension1897
     * @tc.desc    Sample range of a wide pair stays exact at 100
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5rng2_10', 0, () => {
      expect(rangeOf([10, 110])).assertEqual(100);
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_1898
     * @tc.name    ColumnsExtension1898
     * @tc.desc    Swapping two unread counters keeps the mail total 1
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5swap0', 0, () => {
      const model: ColumnsModel = new ColumnsModel();
      const first: number = model.getMails()[0].num;
      model.getMails()[0].num = model.getMails()[1].num;
      model.getMails()[1].num = first;
      expect(model.getTotalMailNum()).assertEqual(23);
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_1899
     * @tc.name    ColumnsExtension1899
     * @tc.desc    Swapping two unread counters keeps the mail total 2
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5swap1', 0, () => {
      const model: ColumnsModel = new ColumnsModel();
      const first: number = model.getMails()[1].num;
      model.getMails()[1].num = model.getMails()[2].num;
      model.getMails()[2].num = first;
      expect(model.getTotalMailNum()).assertEqual(23);
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_1900
     * @tc.name    ColumnsExtension1900
     * @tc.desc    Swapping two unread counters keeps the mail total 3
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5swap2', 0, () => {
      const model: ColumnsModel = new ColumnsModel();
      const first: number = model.getMails()[0].num;
      model.getMails()[0].num = model.getMails()[2].num;
      model.getMails()[2].num = first;
      expect(model.getTotalMailNum()).assertEqual(23);
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_1901
     * @tc.name    ColumnsExtension1901
     * @tc.desc    Swapping two unread counters keeps the mail total 4
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5swap3', 0, () => {
      const model: ColumnsModel = new ColumnsModel();
      const first: number = model.getMails()[1].num;
      model.getMails()[1].num = model.getMails()[0].num;
      model.getMails()[0].num = first;
      expect(model.getTotalMailNum()).assertEqual(23);
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_1902
     * @tc.name    ColumnsExtension1902
     * @tc.desc    Swapping two unread counters keeps the mail total 5
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5swap4', 0, () => {
      const model: ColumnsModel = new ColumnsModel();
      const first: number = model.getMails()[2].num;
      model.getMails()[2].num = model.getMails()[1].num;
      model.getMails()[1].num = first;
      expect(model.getTotalMailNum()).assertEqual(23);
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_1903
     * @tc.name    ColumnsExtension1903
     * @tc.desc    Raising photo counter 1 by one raises the total by one
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5inc0', 0, () => {
      const model: ColumnsModel = new ColumnsModel();
      const before: number = model.getTotalPhotoCount();
      model.getPhotos()[0].count = model.getPhotos()[0].count + 1;
      expect(model.getTotalPhotoCount()).assertEqual(before + 1);
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_1904
     * @tc.name    ColumnsExtension1904
     * @tc.desc    Raising photo counter 2 by one raises the total by one
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5inc1', 0, () => {
      const model: ColumnsModel = new ColumnsModel();
      const before: number = model.getTotalPhotoCount();
      model.getPhotos()[1].count = model.getPhotos()[1].count + 1;
      expect(model.getTotalPhotoCount()).assertEqual(before + 1);
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_1905
     * @tc.name    ColumnsExtension1905
     * @tc.desc    Raising photo counter 3 by one raises the total by one
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5inc2', 0, () => {
      const model: ColumnsModel = new ColumnsModel();
      const before: number = model.getTotalPhotoCount();
      model.getPhotos()[2].count = model.getPhotos()[2].count + 1;
      expect(model.getTotalPhotoCount()).assertEqual(before + 1);
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_1906
     * @tc.name    ColumnsExtension1906
     * @tc.desc    Raising photo counter 4 by one raises the total by one
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5inc3', 0, () => {
      const model: ColumnsModel = new ColumnsModel();
      const before: number = model.getTotalPhotoCount();
      model.getPhotos()[3].count = model.getPhotos()[3].count + 1;
      expect(model.getTotalPhotoCount()).assertEqual(before + 1);
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_1907
     * @tc.name    ColumnsExtension1907
     * @tc.desc    Zeroing photo counters 0 and 1 lowers the total accordingly
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5zero2_0', 0, () => {
      const model: ColumnsModel = new ColumnsModel();
      model.getPhotos()[0].count = 0;
      model.getPhotos()[1].count = 0;
      expect(model.getTotalPhotoCount()).assertEqual(22);
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_1908
     * @tc.name    ColumnsExtension1908
     * @tc.desc    Zeroing photo counters 1 and 2 lowers the total accordingly
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5zero2_1', 0, () => {
      const model: ColumnsModel = new ColumnsModel();
      model.getPhotos()[1].count = 0;
      model.getPhotos()[2].count = 0;
      expect(model.getTotalPhotoCount()).assertEqual(63);
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_1909
     * @tc.name    ColumnsExtension1909
     * @tc.desc    Zeroing photo counters 2 and 3 lowers the total accordingly
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5zero2_2', 0, () => {
      const model: ColumnsModel = new ColumnsModel();
      model.getPhotos()[2].count = 0;
      model.getPhotos()[3].count = 0;
      expect(model.getTotalPhotoCount()).assertEqual(69);
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_1910
     * @tc.name    ColumnsExtension1910
     * @tc.desc    Zeroing photo counters 0 and 3 lowers the total accordingly
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5zero2_3', 0, () => {
      const model: ColumnsModel = new ColumnsModel();
      model.getPhotos()[0].count = 0;
      model.getPhotos()[3].count = 0;
      expect(model.getTotalPhotoCount()).assertEqual(28);
    })
  })
}
