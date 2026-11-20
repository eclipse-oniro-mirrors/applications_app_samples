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
