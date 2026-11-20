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
import { ColumnsModel } from '../Shared/ColumnsModel';

const DOMAIN: number = 0xF811;
const TAG: string = '[ColumnsTests]';

export default function columnsKeyCodeValidationSuite() {
  describe('ColumnsKeyCodeValidationSuite', () => {
    let m: ColumnsModel = new ColumnsModel();

    beforeEach(() => {
      m = new ColumnsModel();
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_0834
     * @tc.name    ColumnsKeyCodeValidation834
     * @tc.desc    Columns split mode at 834 probe 834
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('ColumnsKeyCodeValidation834', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const width: number = 834;
      expect(m.isSplitMode(width)).assertEqual(width >= 600);
      expect(m.getMailByType('nohit834') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_0835
     * @tc.name    ColumnsKeyCodeValidation835
     * @tc.desc    Columns split mode at 835 probe 835
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('ColumnsKeyCodeValidation835', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const width: number = 835;
      expect(m.isSplitMode(width)).assertEqual(width >= 600);
      expect(m.getMailByType('nohit835') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_0836
     * @tc.name    ColumnsKeyCodeValidation836
     * @tc.desc    Columns split mode at 836 probe 836
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('ColumnsKeyCodeValidation836', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const width: number = 836;
      expect(m.isSplitMode(width)).assertEqual(width >= 600);
      expect(m.getMailByType('nohit836') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_0837
     * @tc.name    ColumnsKeyCodeValidation837
     * @tc.desc    Columns split mode at 837 probe 837
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('ColumnsKeyCodeValidation837', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const width: number = 837;
      expect(m.isSplitMode(width)).assertEqual(width >= 600);
      expect(m.getMailByType('nohit837') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_0838
     * @tc.name    ColumnsKeyCodeValidation838
     * @tc.desc    Columns split mode at 838 probe 838
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('ColumnsKeyCodeValidation838', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const width: number = 838;
      expect(m.isSplitMode(width)).assertEqual(width >= 600);
      expect(m.getMailByType('nohit838') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_0839
     * @tc.name    ColumnsKeyCodeValidation839
     * @tc.desc    Columns split mode at 839 probe 839
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('ColumnsKeyCodeValidation839', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const width: number = 839;
      expect(m.isSplitMode(width)).assertEqual(width >= 600);
      expect(m.getMailByType('nohit839') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_0840
     * @tc.name    ColumnsKeyCodeValidation840
     * @tc.desc    Columns split mode at 840 probe 840
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('ColumnsKeyCodeValidation840', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const width: number = 840;
      expect(m.isSplitMode(width)).assertEqual(width >= 600);
      expect(m.getMailByType('nohit840') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_0841
     * @tc.name    ColumnsKeyCodeValidation841
     * @tc.desc    Columns split mode at 841 probe 841
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('ColumnsKeyCodeValidation841', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const width: number = 841;
      expect(m.isSplitMode(width)).assertEqual(width >= 600);
      expect(m.getMailByType('nohit841') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_0842
     * @tc.name    ColumnsKeyCodeValidation842
     * @tc.desc    Columns split mode at 842 probe 842
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('ColumnsKeyCodeValidation842', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const width: number = 842;
      expect(m.isSplitMode(width)).assertEqual(width >= 600);
      expect(m.getMailByType('nohit842') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_0843
     * @tc.name    ColumnsKeyCodeValidation843
     * @tc.desc    Columns split mode at 843 probe 843
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('ColumnsKeyCodeValidation843', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const width: number = 843;
      expect(m.isSplitMode(width)).assertEqual(width >= 600);
      expect(m.getMailByType('nohit843') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_0844
     * @tc.name    ColumnsKeyCodeValidation844
     * @tc.desc    Columns split mode at 844 probe 844
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('ColumnsKeyCodeValidation844', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const width: number = 844;
      expect(m.isSplitMode(width)).assertEqual(width >= 600);
      expect(m.getMailByType('nohit844') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_0845
     * @tc.name    ColumnsKeyCodeValidation845
     * @tc.desc    Columns split mode at 845 probe 845
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('ColumnsKeyCodeValidation845', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const width: number = 845;
      expect(m.isSplitMode(width)).assertEqual(width >= 600);
      expect(m.getMailByType('nohit845') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_0846
     * @tc.name    ColumnsKeyCodeValidation846
     * @tc.desc    Columns split mode at 846 probe 846
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('ColumnsKeyCodeValidation846', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const width: number = 846;
      expect(m.isSplitMode(width)).assertEqual(width >= 600);
      expect(m.getMailByType('nohit846') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_0847
     * @tc.name    ColumnsKeyCodeValidation847
     * @tc.desc    Columns split mode at 847 probe 847
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('ColumnsKeyCodeValidation847', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const width: number = 847;
      expect(m.isSplitMode(width)).assertEqual(width >= 600);
      expect(m.getMailByType('nohit847') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_0848
     * @tc.name    ColumnsKeyCodeValidation848
     * @tc.desc    Columns split mode at 848 probe 848
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('ColumnsKeyCodeValidation848', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const width: number = 848;
      expect(m.isSplitMode(width)).assertEqual(width >= 600);
      expect(m.getMailByType('nohit848') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_0849
     * @tc.name    ColumnsKeyCodeValidation849
     * @tc.desc    Columns split mode at 849 probe 849
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('ColumnsKeyCodeValidation849', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const width: number = 849;
      expect(m.isSplitMode(width)).assertEqual(width >= 600);
      expect(m.getMailByType('nohit849') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_0850
     * @tc.name    ColumnsKeyCodeValidation850
     * @tc.desc    Columns split mode at 850 probe 850
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('ColumnsKeyCodeValidation850', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const width: number = 850;
      expect(m.isSplitMode(width)).assertEqual(width >= 600);
      expect(m.getMailByType('nohit850') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_0851
     * @tc.name    ColumnsKeyCodeValidation851
     * @tc.desc    Columns split mode at 851 probe 851
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('ColumnsKeyCodeValidation851', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const width: number = 851;
      expect(m.isSplitMode(width)).assertEqual(width >= 600);
      expect(m.getMailByType('nohit851') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_0852
     * @tc.name    ColumnsKeyCodeValidation852
     * @tc.desc    Columns split mode at 852 probe 852
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('ColumnsKeyCodeValidation852', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const width: number = 852;
      expect(m.isSplitMode(width)).assertEqual(width >= 600);
      expect(m.getMailByType('nohit852') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_0853
     * @tc.name    ColumnsKeyCodeValidation853
     * @tc.desc    Columns split mode at 853 probe 853
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('ColumnsKeyCodeValidation853', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const width: number = 853;
      expect(m.isSplitMode(width)).assertEqual(width >= 600);
      expect(m.getMailByType('nohit853') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_0854
     * @tc.name    ColumnsKeyCodeValidation854
     * @tc.desc    Columns split mode at 854 probe 854
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('ColumnsKeyCodeValidation854', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const width: number = 854;
      expect(m.isSplitMode(width)).assertEqual(width >= 600);
      expect(m.getMailByType('nohit854') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_0855
     * @tc.name    ColumnsKeyCodeValidation855
     * @tc.desc    Columns split mode at 855 probe 855
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('ColumnsKeyCodeValidation855', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const width: number = 855;
      expect(m.isSplitMode(width)).assertEqual(width >= 600);
      expect(m.getMailByType('nohit855') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_0856
     * @tc.name    ColumnsKeyCodeValidation856
     * @tc.desc    Columns split mode at 856 probe 856
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('ColumnsKeyCodeValidation856', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const width: number = 856;
      expect(m.isSplitMode(width)).assertEqual(width >= 600);
      expect(m.getMailByType('nohit856') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_0857
     * @tc.name    ColumnsKeyCodeValidation857
     * @tc.desc    Columns split mode at 857 probe 857
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('ColumnsKeyCodeValidation857', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const width: number = 857;
      expect(m.isSplitMode(width)).assertEqual(width >= 600);
      expect(m.getMailByType('nohit857') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_0858
     * @tc.name    ColumnsKeyCodeValidation858
     * @tc.desc    Columns split mode at 858 probe 858
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('ColumnsKeyCodeValidation858', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const width: number = 858;
      expect(m.isSplitMode(width)).assertEqual(width >= 600);
      expect(m.getMailByType('nohit858') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_0859
     * @tc.name    ColumnsKeyCodeValidation859
     * @tc.desc    Columns split mode at 859 probe 859
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('ColumnsKeyCodeValidation859', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const width: number = 859;
      expect(m.isSplitMode(width)).assertEqual(width >= 600);
      expect(m.getMailByType('nohit859') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_0860
     * @tc.name    ColumnsKeyCodeValidation860
     * @tc.desc    Columns split mode at 860 probe 860
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('ColumnsKeyCodeValidation860', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const width: number = 860;
      expect(m.isSplitMode(width)).assertEqual(width >= 600);
      expect(m.getMailByType('nohit860') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_0861
     * @tc.name    ColumnsKeyCodeValidation861
     * @tc.desc    Columns split mode at 861 probe 861
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('ColumnsKeyCodeValidation861', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const width: number = 861;
      expect(m.isSplitMode(width)).assertEqual(width >= 600);
      expect(m.getMailByType('nohit861') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_0862
     * @tc.name    ColumnsKeyCodeValidation862
     * @tc.desc    Columns split mode at 862 probe 862
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('ColumnsKeyCodeValidation862', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const width: number = 862;
      expect(m.isSplitMode(width)).assertEqual(width >= 600);
      expect(m.getMailByType('nohit862') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_0863
     * @tc.name    ColumnsKeyCodeValidation863
     * @tc.desc    Columns split mode at 863 probe 863
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('ColumnsKeyCodeValidation863', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const width: number = 863;
      expect(m.isSplitMode(width)).assertEqual(width >= 600);
      expect(m.getMailByType('nohit863') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_0864
     * @tc.name    ColumnsKeyCodeValidation864
     * @tc.desc    Columns split mode at 864 probe 864
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('ColumnsKeyCodeValidation864', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const width: number = 864;
      expect(m.isSplitMode(width)).assertEqual(width >= 600);
      expect(m.getMailByType('nohit864') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_0865
     * @tc.name    ColumnsKeyCodeValidation865
     * @tc.desc    Columns split mode at 865 probe 865
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('ColumnsKeyCodeValidation865', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const width: number = 865;
      expect(m.isSplitMode(width)).assertEqual(width >= 600);
      expect(m.getMailByType('nohit865') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_0866
     * @tc.name    ColumnsKeyCodeValidation866
     * @tc.desc    Columns split mode at 866 probe 866
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('ColumnsKeyCodeValidation866', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const width: number = 866;
      expect(m.isSplitMode(width)).assertEqual(width >= 600);
      expect(m.getMailByType('nohit866') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_0867
     * @tc.name    ColumnsKeyCodeValidation867
     * @tc.desc    Columns split mode at 867 probe 867
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('ColumnsKeyCodeValidation867', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const width: number = 867;
      expect(m.isSplitMode(width)).assertEqual(width >= 600);
      expect(m.getMailByType('nohit867') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_0868
     * @tc.name    ColumnsKeyCodeValidation868
     * @tc.desc    Columns split mode at 868 probe 868
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('ColumnsKeyCodeValidation868', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const width: number = 868;
      expect(m.isSplitMode(width)).assertEqual(width >= 600);
      expect(m.getMailByType('nohit868') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_0869
     * @tc.name    ColumnsKeyCodeValidation869
     * @tc.desc    Columns split mode at 869 probe 869
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('ColumnsKeyCodeValidation869', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const width: number = 869;
      expect(m.isSplitMode(width)).assertEqual(width >= 600);
      expect(m.getMailByType('nohit869') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_0870
     * @tc.name    ColumnsKeyCodeValidation870
     * @tc.desc    Columns split mode at 870 probe 870
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('ColumnsKeyCodeValidation870', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const width: number = 870;
      expect(m.isSplitMode(width)).assertEqual(width >= 600);
      expect(m.getMailByType('nohit870') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_0871
     * @tc.name    ColumnsKeyCodeValidation871
     * @tc.desc    Columns split mode at 871 probe 871
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('ColumnsKeyCodeValidation871', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const width: number = 871;
      expect(m.isSplitMode(width)).assertEqual(width >= 600);
      expect(m.getMailByType('nohit871') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_0872
     * @tc.name    ColumnsKeyCodeValidation872
     * @tc.desc    Columns split mode at 872 probe 872
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('ColumnsKeyCodeValidation872', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const width: number = 872;
      expect(m.isSplitMode(width)).assertEqual(width >= 600);
      expect(m.getMailByType('nohit872') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_0873
     * @tc.name    ColumnsKeyCodeValidation873
     * @tc.desc    Columns split mode at 873 probe 873
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('ColumnsKeyCodeValidation873', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const width: number = 873;
      expect(m.isSplitMode(width)).assertEqual(width >= 600);
      expect(m.getMailByType('nohit873') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_0874
     * @tc.name    ColumnsKeyCodeValidation874
     * @tc.desc    Columns split mode at 874 probe 874
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('ColumnsKeyCodeValidation874', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const width: number = 874;
      expect(m.isSplitMode(width)).assertEqual(width >= 600);
      expect(m.getMailByType('nohit874') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_0875
     * @tc.name    ColumnsKeyCodeValidation875
     * @tc.desc    Columns split mode at 875 probe 875
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('ColumnsKeyCodeValidation875', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const width: number = 875;
      expect(m.isSplitMode(width)).assertEqual(width >= 600);
      expect(m.getMailByType('nohit875') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_0876
     * @tc.name    ColumnsKeyCodeValidation876
     * @tc.desc    Columns split mode at 876 probe 876
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('ColumnsKeyCodeValidation876', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const width: number = 876;
      expect(m.isSplitMode(width)).assertEqual(width >= 600);
      expect(m.getMailByType('nohit876') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_0877
     * @tc.name    ColumnsKeyCodeValidation877
     * @tc.desc    Columns split mode at 877 probe 877
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('ColumnsKeyCodeValidation877', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const width: number = 877;
      expect(m.isSplitMode(width)).assertEqual(width >= 600);
      expect(m.getMailByType('nohit877') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_0878
     * @tc.name    ColumnsKeyCodeValidation878
     * @tc.desc    Columns split mode at 878 probe 878
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('ColumnsKeyCodeValidation878', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const width: number = 878;
      expect(m.isSplitMode(width)).assertEqual(width >= 600);
      expect(m.getMailByType('nohit878') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_0879
     * @tc.name    ColumnsKeyCodeValidation879
     * @tc.desc    Columns split mode at 879 probe 879
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('ColumnsKeyCodeValidation879', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const width: number = 879;
      expect(m.isSplitMode(width)).assertEqual(width >= 600);
      expect(m.getMailByType('nohit879') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_0880
     * @tc.name    ColumnsKeyCodeValidation880
     * @tc.desc    Columns split mode at 880 probe 880
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('ColumnsKeyCodeValidation880', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const width: number = 880;
      expect(m.isSplitMode(width)).assertEqual(width >= 600);
      expect(m.getMailByType('nohit880') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_0881
     * @tc.name    ColumnsKeyCodeValidation881
     * @tc.desc    Columns split mode at 881 probe 881
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('ColumnsKeyCodeValidation881', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const width: number = 881;
      expect(m.isSplitMode(width)).assertEqual(width >= 600);
      expect(m.getMailByType('nohit881') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_0882
     * @tc.name    ColumnsKeyCodeValidation882
     * @tc.desc    Columns split mode at 882 probe 882
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('ColumnsKeyCodeValidation882', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const width: number = 882;
      expect(m.isSplitMode(width)).assertEqual(width >= 600);
      expect(m.getMailByType('nohit882') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_0883
     * @tc.name    ColumnsKeyCodeValidation883
     * @tc.desc    Columns split mode at 883 probe 883
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('ColumnsKeyCodeValidation883', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const width: number = 883;
      expect(m.isSplitMode(width)).assertEqual(width >= 600);
      expect(m.getMailByType('nohit883') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_0884
     * @tc.name    ColumnsKeyCodeValidation884
     * @tc.desc    Columns split mode at 884 probe 884
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('ColumnsKeyCodeValidation884', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const width: number = 884;
      expect(m.isSplitMode(width)).assertEqual(width >= 600);
      expect(m.getMailByType('nohit884') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_0885
     * @tc.name    ColumnsKeyCodeValidation885
     * @tc.desc    Columns split mode at 885 probe 885
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('ColumnsKeyCodeValidation885', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const width: number = 885;
      expect(m.isSplitMode(width)).assertEqual(width >= 600);
      expect(m.getMailByType('nohit885') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_0886
     * @tc.name    ColumnsKeyCodeValidation886
     * @tc.desc    Columns split mode at 886 probe 886
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('ColumnsKeyCodeValidation886', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const width: number = 886;
      expect(m.isSplitMode(width)).assertEqual(width >= 600);
      expect(m.getMailByType('nohit886') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_0887
     * @tc.name    ColumnsKeyCodeValidation887
     * @tc.desc    Columns split mode at 887 probe 887
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('ColumnsKeyCodeValidation887', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const width: number = 887;
      expect(m.isSplitMode(width)).assertEqual(width >= 600);
      expect(m.getMailByType('nohit887') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_0888
     * @tc.name    ColumnsKeyCodeValidation888
     * @tc.desc    Columns split mode at 888 probe 888
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('ColumnsKeyCodeValidation888', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const width: number = 888;
      expect(m.isSplitMode(width)).assertEqual(width >= 600);
      expect(m.getMailByType('nohit888') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_0889
     * @tc.name    ColumnsKeyCodeValidation889
     * @tc.desc    Columns split mode at 889 probe 889
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('ColumnsKeyCodeValidation889', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const width: number = 889;
      expect(m.isSplitMode(width)).assertEqual(width >= 600);
      expect(m.getMailByType('nohit889') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_0890
     * @tc.name    ColumnsKeyCodeValidation890
     * @tc.desc    Columns split mode at 890 probe 890
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('ColumnsKeyCodeValidation890', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const width: number = 890;
      expect(m.isSplitMode(width)).assertEqual(width >= 600);
      expect(m.getMailByType('nohit890') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_0891
     * @tc.name    ColumnsKeyCodeValidation891
     * @tc.desc    Columns split mode at 891 probe 891
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('ColumnsKeyCodeValidation891', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const width: number = 891;
      expect(m.isSplitMode(width)).assertEqual(width >= 600);
      expect(m.getMailByType('nohit891') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_0892
     * @tc.name    ColumnsKeyCodeValidation892
     * @tc.desc    Columns split mode at 892 probe 892
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('ColumnsKeyCodeValidation892', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const width: number = 892;
      expect(m.isSplitMode(width)).assertEqual(width >= 600);
      expect(m.getMailByType('nohit892') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_0893
     * @tc.name    ColumnsKeyCodeValidation893
     * @tc.desc    Columns split mode at 893 probe 893
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('ColumnsKeyCodeValidation893', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const width: number = 893;
      expect(m.isSplitMode(width)).assertEqual(width >= 600);
      expect(m.getMailByType('nohit893') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_0894
     * @tc.name    ColumnsKeyCodeValidation894
     * @tc.desc    Columns split mode at 894 probe 894
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('ColumnsKeyCodeValidation894', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const width: number = 894;
      expect(m.isSplitMode(width)).assertEqual(width >= 600);
      expect(m.getMailByType('nohit894') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_0895
     * @tc.name    ColumnsKeyCodeValidation895
     * @tc.desc    Columns split mode at 895 probe 895
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('ColumnsKeyCodeValidation895', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const width: number = 895;
      expect(m.isSplitMode(width)).assertEqual(width >= 600);
      expect(m.getMailByType('nohit895') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_0896
     * @tc.name    ColumnsKeyCodeValidation896
     * @tc.desc    Columns split mode at 896 probe 896
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('ColumnsKeyCodeValidation896', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const width: number = 896;
      expect(m.isSplitMode(width)).assertEqual(width >= 600);
      expect(m.getMailByType('nohit896') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_0897
     * @tc.name    ColumnsKeyCodeValidation897
     * @tc.desc    Columns split mode at 897 probe 897
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('ColumnsKeyCodeValidation897', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const width: number = 897;
      expect(m.isSplitMode(width)).assertEqual(width >= 600);
      expect(m.getMailByType('nohit897') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_0898
     * @tc.name    ColumnsKeyCodeValidation898
     * @tc.desc    Columns split mode at 898 probe 898
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('ColumnsKeyCodeValidation898', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const width: number = 898;
      expect(m.isSplitMode(width)).assertEqual(width >= 600);
      expect(m.getMailByType('nohit898') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_0899
     * @tc.name    ColumnsKeyCodeValidation899
     * @tc.desc    Columns split mode at 899 probe 899
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('ColumnsKeyCodeValidation899', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const width: number = 899;
      expect(m.isSplitMode(width)).assertEqual(width >= 600);
      expect(m.getMailByType('nohit899') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_0900
     * @tc.name    ColumnsKeyCodeValidation900
     * @tc.desc    Columns split mode at 900 probe 900
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('ColumnsKeyCodeValidation900', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const width: number = 900;
      expect(m.isSplitMode(width)).assertEqual(width >= 600);
      expect(m.getMailByType('nohit900') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_0901
     * @tc.name    ColumnsKeyCodeValidation901
     * @tc.desc    Columns split mode at 901 probe 901
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('ColumnsKeyCodeValidation901', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const width: number = 901;
      expect(m.isSplitMode(width)).assertEqual(width >= 600);
      expect(m.getMailByType('nohit901') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_0902
     * @tc.name    ColumnsKeyCodeValidation902
     * @tc.desc    Columns split mode at 902 probe 902
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('ColumnsKeyCodeValidation902', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const width: number = 902;
      expect(m.isSplitMode(width)).assertEqual(width >= 600);
      expect(m.getMailByType('nohit902') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_0903
     * @tc.name    ColumnsKeyCodeValidation903
     * @tc.desc    Columns split mode at 903 probe 903
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('ColumnsKeyCodeValidation903', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const width: number = 903;
      expect(m.isSplitMode(width)).assertEqual(width >= 600);
      expect(m.getMailByType('nohit903') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_0904
     * @tc.name    ColumnsKeyCodeValidation904
     * @tc.desc    Columns split mode at 904 probe 904
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('ColumnsKeyCodeValidation904', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const width: number = 904;
      expect(m.isSplitMode(width)).assertEqual(width >= 600);
      expect(m.getMailByType('nohit904') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_0905
     * @tc.name    ColumnsKeyCodeValidation905
     * @tc.desc    Columns split mode at 905 probe 905
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('ColumnsKeyCodeValidation905', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const width: number = 905;
      expect(m.isSplitMode(width)).assertEqual(width >= 600);
      expect(m.getMailByType('nohit905') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_0906
     * @tc.name    ColumnsKeyCodeValidation906
     * @tc.desc    Columns split mode at 906 probe 906
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('ColumnsKeyCodeValidation906', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const width: number = 906;
      expect(m.isSplitMode(width)).assertEqual(width >= 600);
      expect(m.getMailByType('nohit906') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_0907
     * @tc.name    ColumnsKeyCodeValidation907
     * @tc.desc    Columns split mode at 907 probe 907
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('ColumnsKeyCodeValidation907', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const width: number = 907;
      expect(m.isSplitMode(width)).assertEqual(width >= 600);
      expect(m.getMailByType('nohit907') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_0908
     * @tc.name    ColumnsKeyCodeValidation908
     * @tc.desc    Columns split mode at 908 probe 908
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('ColumnsKeyCodeValidation908', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const width: number = 908;
      expect(m.isSplitMode(width)).assertEqual(width >= 600);
      expect(m.getMailByType('nohit908') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_0909
     * @tc.name    ColumnsKeyCodeValidation909
     * @tc.desc    Columns split mode at 909 probe 909
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('ColumnsKeyCodeValidation909', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const width: number = 909;
      expect(m.isSplitMode(width)).assertEqual(width >= 600);
      expect(m.getMailByType('nohit909') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_0910
     * @tc.name    ColumnsKeyCodeValidation910
     * @tc.desc    Columns split mode at 910 probe 910
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('ColumnsKeyCodeValidation910', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const width: number = 910;
      expect(m.isSplitMode(width)).assertEqual(width >= 600);
      expect(m.getMailByType('nohit910') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_0911
     * @tc.name    ColumnsKeyCodeValidation911
     * @tc.desc    Columns split mode at 911 probe 911
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('ColumnsKeyCodeValidation911', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const width: number = 911;
      expect(m.isSplitMode(width)).assertEqual(width >= 600);
      expect(m.getMailByType('nohit911') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_0912
     * @tc.name    ColumnsKeyCodeValidation912
     * @tc.desc    Columns split mode at 912 probe 912
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('ColumnsKeyCodeValidation912', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const width: number = 912;
      expect(m.isSplitMode(width)).assertEqual(width >= 600);
      expect(m.getMailByType('nohit912') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_0913
     * @tc.name    ColumnsKeyCodeValidation913
     * @tc.desc    Columns split mode at 913 probe 913
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('ColumnsKeyCodeValidation913', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const width: number = 913;
      expect(m.isSplitMode(width)).assertEqual(width >= 600);
      expect(m.getMailByType('nohit913') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_0914
     * @tc.name    ColumnsKeyCodeValidation914
     * @tc.desc    Columns split mode at 914 probe 914
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('ColumnsKeyCodeValidation914', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const width: number = 914;
      expect(m.isSplitMode(width)).assertEqual(width >= 600);
      expect(m.getMailByType('nohit914') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_0915
     * @tc.name    ColumnsKeyCodeValidation915
     * @tc.desc    Columns split mode at 915 probe 915
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('ColumnsKeyCodeValidation915', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const width: number = 915;
      expect(m.isSplitMode(width)).assertEqual(width >= 600);
      expect(m.getMailByType('nohit915') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_0916
     * @tc.name    ColumnsKeyCodeValidation916
     * @tc.desc    Columns split mode at 916 probe 916
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('ColumnsKeyCodeValidation916', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const width: number = 916;
      expect(m.isSplitMode(width)).assertEqual(width >= 600);
      expect(m.getMailByType('nohit916') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_0917
     * @tc.name    ColumnsKeyCodeValidation917
     * @tc.desc    Columns split mode at 917 probe 917
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('ColumnsKeyCodeValidation917', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const width: number = 917;
      expect(m.isSplitMode(width)).assertEqual(width >= 600);
      expect(m.getMailByType('nohit917') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_0918
     * @tc.name    ColumnsKeyCodeValidation918
     * @tc.desc    Columns split mode at 918 probe 918
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('ColumnsKeyCodeValidation918', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const width: number = 918;
      expect(m.isSplitMode(width)).assertEqual(width >= 600);
      expect(m.getMailByType('nohit918') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_0919
     * @tc.name    ColumnsKeyCodeValidation919
     * @tc.desc    Columns split mode at 919 probe 919
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('ColumnsKeyCodeValidation919', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const width: number = 919;
      expect(m.isSplitMode(width)).assertEqual(width >= 600);
      expect(m.getMailByType('nohit919') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_0920
     * @tc.name    ColumnsKeyCodeValidation920
     * @tc.desc    Columns split mode at 920 probe 920
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('ColumnsKeyCodeValidation920', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const width: number = 920;
      expect(m.isSplitMode(width)).assertEqual(width >= 600);
      expect(m.getMailByType('nohit920') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_0921
     * @tc.name    ColumnsKeyCodeValidation921
     * @tc.desc    Columns split mode at 921 probe 921
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('ColumnsKeyCodeValidation921', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const width: number = 921;
      expect(m.isSplitMode(width)).assertEqual(width >= 600);
      expect(m.getMailByType('nohit921') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_0922
     * @tc.name    ColumnsKeyCodeValidation922
     * @tc.desc    Columns split mode at 922 probe 922
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('ColumnsKeyCodeValidation922', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const width: number = 922;
      expect(m.isSplitMode(width)).assertEqual(width >= 600);
      expect(m.getMailByType('nohit922') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_0923
     * @tc.name    ColumnsKeyCodeValidation923
     * @tc.desc    Columns split mode at 923 probe 923
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('ColumnsKeyCodeValidation923', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const width: number = 923;
      expect(m.isSplitMode(width)).assertEqual(width >= 600);
      expect(m.getMailByType('nohit923') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_0924
     * @tc.name    ColumnsKeyCodeValidation924
     * @tc.desc    Columns split mode at 924 probe 924
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('ColumnsKeyCodeValidation924', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const width: number = 924;
      expect(m.isSplitMode(width)).assertEqual(width >= 600);
      expect(m.getMailByType('nohit924') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_0925
     * @tc.name    ColumnsKeyCodeValidation925
     * @tc.desc    Columns split mode at 925 probe 925
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('ColumnsKeyCodeValidation925', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const width: number = 925;
      expect(m.isSplitMode(width)).assertEqual(width >= 600);
      expect(m.getMailByType('nohit925') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_0926
     * @tc.name    ColumnsKeyCodeValidation926
     * @tc.desc    Columns split mode at 926 probe 926
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('ColumnsKeyCodeValidation926', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const width: number = 926;
      expect(m.isSplitMode(width)).assertEqual(width >= 600);
      expect(m.getMailByType('nohit926') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_0927
     * @tc.name    ColumnsKeyCodeValidation927
     * @tc.desc    Columns split mode at 927 probe 927
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('ColumnsKeyCodeValidation927', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const width: number = 927;
      expect(m.isSplitMode(width)).assertEqual(width >= 600);
      expect(m.getMailByType('nohit927') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_0928
     * @tc.name    ColumnsKeyCodeValidation928
     * @tc.desc    Columns split mode at 928 probe 928
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('ColumnsKeyCodeValidation928', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const width: number = 928;
      expect(m.isSplitMode(width)).assertEqual(width >= 600);
      expect(m.getMailByType('nohit928') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_0929
     * @tc.name    ColumnsKeyCodeValidation929
     * @tc.desc    Columns split mode at 929 probe 929
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('ColumnsKeyCodeValidation929', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const width: number = 929;
      expect(m.isSplitMode(width)).assertEqual(width >= 600);
      expect(m.getMailByType('nohit929') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_0930
     * @tc.name    ColumnsKeyCodeValidation930
     * @tc.desc    Columns split mode at 930 probe 930
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('ColumnsKeyCodeValidation930', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const width: number = 930;
      expect(m.isSplitMode(width)).assertEqual(width >= 600);
      expect(m.getMailByType('nohit930') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_0931
     * @tc.name    ColumnsKeyCodeValidation931
     * @tc.desc    Columns split mode at 931 probe 931
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('ColumnsKeyCodeValidation931', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const width: number = 931;
      expect(m.isSplitMode(width)).assertEqual(width >= 600);
      expect(m.getMailByType('nohit931') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_0932
     * @tc.name    ColumnsKeyCodeValidation932
     * @tc.desc    Columns split mode at 932 probe 932
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('ColumnsKeyCodeValidation932', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const width: number = 932;
      expect(m.isSplitMode(width)).assertEqual(width >= 600);
      expect(m.getMailByType('nohit932') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_0933
     * @tc.name    ColumnsKeyCodeValidation933
     * @tc.desc    Columns split mode at 933 probe 933
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('ColumnsKeyCodeValidation933', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const width: number = 933;
      expect(m.isSplitMode(width)).assertEqual(width >= 600);
      expect(m.getMailByType('nohit933') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_0934
     * @tc.name    ColumnsKeyCodeValidation934
     * @tc.desc    Columns split mode at 934 probe 934
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('ColumnsKeyCodeValidation934', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const width: number = 934;
      expect(m.isSplitMode(width)).assertEqual(width >= 600);
      expect(m.getMailByType('nohit934') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_0935
     * @tc.name    ColumnsKeyCodeValidation935
     * @tc.desc    Columns split mode at 935 probe 935
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('ColumnsKeyCodeValidation935', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const width: number = 935;
      expect(m.isSplitMode(width)).assertEqual(width >= 600);
      expect(m.getMailByType('nohit935') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_0936
     * @tc.name    ColumnsKeyCodeValidation936
     * @tc.desc    Columns split mode at 936 probe 936
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('ColumnsKeyCodeValidation936', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const width: number = 936;
      expect(m.isSplitMode(width)).assertEqual(width >= 600);
      expect(m.getMailByType('nohit936') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_0937
     * @tc.name    ColumnsKeyCodeValidation937
     * @tc.desc    Columns split mode at 937 probe 937
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('ColumnsKeyCodeValidation937', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const width: number = 937;
      expect(m.isSplitMode(width)).assertEqual(width >= 600);
      expect(m.getMailByType('nohit937') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_0938
     * @tc.name    ColumnsKeyCodeValidation938
     * @tc.desc    Columns split mode at 938 probe 938
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('ColumnsKeyCodeValidation938', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const width: number = 938;
      expect(m.isSplitMode(width)).assertEqual(width >= 600);
      expect(m.getMailByType('nohit938') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_0939
     * @tc.name    ColumnsKeyCodeValidation939
     * @tc.desc    Columns split mode at 939 probe 939
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('ColumnsKeyCodeValidation939', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const width: number = 939;
      expect(m.isSplitMode(width)).assertEqual(width >= 600);
      expect(m.getMailByType('nohit939') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_0940
     * @tc.name    ColumnsKeyCodeValidation940
     * @tc.desc    Columns split mode at 940 probe 940
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('ColumnsKeyCodeValidation940', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const width: number = 940;
      expect(m.isSplitMode(width)).assertEqual(width >= 600);
      expect(m.getMailByType('nohit940') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_0941
     * @tc.name    ColumnsKeyCodeValidation941
     * @tc.desc    Columns split mode at 941 probe 941
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('ColumnsKeyCodeValidation941', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const width: number = 941;
      expect(m.isSplitMode(width)).assertEqual(width >= 600);
      expect(m.getMailByType('nohit941') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_0942
     * @tc.name    ColumnsKeyCodeValidation942
     * @tc.desc    Columns split mode at 942 probe 942
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('ColumnsKeyCodeValidation942', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const width: number = 942;
      expect(m.isSplitMode(width)).assertEqual(width >= 600);
      expect(m.getMailByType('nohit942') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_0943
     * @tc.name    ColumnsKeyCodeValidation943
     * @tc.desc    Columns split mode at 943 probe 943
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('ColumnsKeyCodeValidation943', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const width: number = 943;
      expect(m.isSplitMode(width)).assertEqual(width >= 600);
      expect(m.getMailByType('nohit943') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_0944
     * @tc.name    ColumnsKeyCodeValidation944
     * @tc.desc    Columns split mode at 944 probe 944
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('ColumnsKeyCodeValidation944', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const width: number = 944;
      expect(m.isSplitMode(width)).assertEqual(width >= 600);
      expect(m.getMailByType('nohit944') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_0945
     * @tc.name    ColumnsKeyCodeValidation945
     * @tc.desc    Columns split mode at 945 probe 945
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('ColumnsKeyCodeValidation945', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const width: number = 945;
      expect(m.isSplitMode(width)).assertEqual(width >= 600);
      expect(m.getMailByType('nohit945') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_0946
     * @tc.name    ColumnsKeyCodeValidation946
     * @tc.desc    Columns split mode at 946 probe 946
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('ColumnsKeyCodeValidation946', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const width: number = 946;
      expect(m.isSplitMode(width)).assertEqual(width >= 600);
      expect(m.getMailByType('nohit946') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_0947
     * @tc.name    ColumnsKeyCodeValidation947
     * @tc.desc    Columns split mode at 947 probe 947
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('ColumnsKeyCodeValidation947', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const width: number = 947;
      expect(m.isSplitMode(width)).assertEqual(width >= 600);
      expect(m.getMailByType('nohit947') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_0948
     * @tc.name    ColumnsKeyCodeValidation948
     * @tc.desc    Columns split mode at 948 probe 948
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('ColumnsKeyCodeValidation948', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const width: number = 948;
      expect(m.isSplitMode(width)).assertEqual(width >= 600);
      expect(m.getMailByType('nohit948') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_0949
     * @tc.name    ColumnsKeyCodeValidation949
     * @tc.desc    Columns split mode at 949 probe 949
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('ColumnsKeyCodeValidation949', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const width: number = 949;
      expect(m.isSplitMode(width)).assertEqual(width >= 600);
      expect(m.getMailByType('nohit949') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_0950
     * @tc.name    ColumnsKeyCodeValidation950
     * @tc.desc    Columns split mode at 950 probe 950
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('ColumnsKeyCodeValidation950', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const width: number = 950;
      expect(m.isSplitMode(width)).assertEqual(width >= 600);
      expect(m.getMailByType('nohit950') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_0951
     * @tc.name    ColumnsKeyCodeValidation951
     * @tc.desc    Columns split mode at 951 probe 951
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('ColumnsKeyCodeValidation951', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const width: number = 951;
      expect(m.isSplitMode(width)).assertEqual(width >= 600);
      expect(m.getMailByType('nohit951') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_0952
     * @tc.name    ColumnsKeyCodeValidation952
     * @tc.desc    Columns split mode at 952 probe 952
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('ColumnsKeyCodeValidation952', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const width: number = 952;
      expect(m.isSplitMode(width)).assertEqual(width >= 600);
      expect(m.getMailByType('nohit952') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_0953
     * @tc.name    ColumnsKeyCodeValidation953
     * @tc.desc    Columns split mode at 953 probe 953
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('ColumnsKeyCodeValidation953', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const width: number = 953;
      expect(m.isSplitMode(width)).assertEqual(width >= 600);
      expect(m.getMailByType('nohit953') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_0954
     * @tc.name    ColumnsKeyCodeValidation954
     * @tc.desc    Columns split mode at 954 probe 954
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('ColumnsKeyCodeValidation954', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const width: number = 954;
      expect(m.isSplitMode(width)).assertEqual(width >= 600);
      expect(m.getMailByType('nohit954') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_0955
     * @tc.name    ColumnsKeyCodeValidation955
     * @tc.desc    Columns split mode at 955 probe 955
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('ColumnsKeyCodeValidation955', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const width: number = 955;
      expect(m.isSplitMode(width)).assertEqual(width >= 600);
      expect(m.getMailByType('nohit955') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_0956
     * @tc.name    ColumnsKeyCodeValidation956
     * @tc.desc    Columns split mode at 956 probe 956
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('ColumnsKeyCodeValidation956', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const width: number = 956;
      expect(m.isSplitMode(width)).assertEqual(width >= 600);
      expect(m.getMailByType('nohit956') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_0957
     * @tc.name    ColumnsKeyCodeValidation957
     * @tc.desc    Columns split mode at 957 probe 957
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('ColumnsKeyCodeValidation957', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const width: number = 957;
      expect(m.isSplitMode(width)).assertEqual(width >= 600);
      expect(m.getMailByType('nohit957') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_0958
     * @tc.name    ColumnsKeyCodeValidation958
     * @tc.desc    Columns split mode at 958 probe 958
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('ColumnsKeyCodeValidation958', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const width: number = 958;
      expect(m.isSplitMode(width)).assertEqual(width >= 600);
      expect(m.getMailByType('nohit958') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_0959
     * @tc.name    ColumnsKeyCodeValidation959
     * @tc.desc    Columns split mode at 959 probe 959
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('ColumnsKeyCodeValidation959', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const width: number = 959;
      expect(m.isSplitMode(width)).assertEqual(width >= 600);
      expect(m.getMailByType('nohit959') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_0960
     * @tc.name    ColumnsKeyCodeValidation960
     * @tc.desc    Columns split mode at 960 probe 960
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('ColumnsKeyCodeValidation960', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const width: number = 960;
      expect(m.isSplitMode(width)).assertEqual(width >= 600);
      expect(m.getMailByType('nohit960') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_0961
     * @tc.name    ColumnsKeyCodeValidation961
     * @tc.desc    Columns split mode at 961 probe 961
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('ColumnsKeyCodeValidation961', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const width: number = 961;
      expect(m.isSplitMode(width)).assertEqual(width >= 600);
      expect(m.getMailByType('nohit961') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_0962
     * @tc.name    ColumnsKeyCodeValidation962
     * @tc.desc    Columns split mode at 962 probe 962
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('ColumnsKeyCodeValidation962', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const width: number = 962;
      expect(m.isSplitMode(width)).assertEqual(width >= 600);
      expect(m.getMailByType('nohit962') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_0963
     * @tc.name    ColumnsKeyCodeValidation963
     * @tc.desc    Columns split mode at 963 probe 963
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('ColumnsKeyCodeValidation963', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const width: number = 963;
      expect(m.isSplitMode(width)).assertEqual(width >= 600);
      expect(m.getMailByType('nohit963') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_0964
     * @tc.name    ColumnsKeyCodeValidation964
     * @tc.desc    Columns split mode at 964 probe 964
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('ColumnsKeyCodeValidation964', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const width: number = 964;
      expect(m.isSplitMode(width)).assertEqual(width >= 600);
      expect(m.getMailByType('nohit964') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_0965
     * @tc.name    ColumnsKeyCodeValidation965
     * @tc.desc    Columns split mode at 965 probe 965
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('ColumnsKeyCodeValidation965', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const width: number = 965;
      expect(m.isSplitMode(width)).assertEqual(width >= 600);
      expect(m.getMailByType('nohit965') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_0966
     * @tc.name    ColumnsKeyCodeValidation966
     * @tc.desc    Columns split mode at 966 probe 966
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('ColumnsKeyCodeValidation966', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const width: number = 966;
      expect(m.isSplitMode(width)).assertEqual(width >= 600);
      expect(m.getMailByType('nohit966') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_0967
     * @tc.name    ColumnsKeyCodeValidation967
     * @tc.desc    Columns split mode at 967 probe 967
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('ColumnsKeyCodeValidation967', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const width: number = 967;
      expect(m.isSplitMode(width)).assertEqual(width >= 600);
      expect(m.getMailByType('nohit967') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_0968
     * @tc.name    ColumnsKeyCodeValidation968
     * @tc.desc    Columns split mode at 968 probe 968
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('ColumnsKeyCodeValidation968', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const width: number = 968;
      expect(m.isSplitMode(width)).assertEqual(width >= 600);
      expect(m.getMailByType('nohit968') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_0969
     * @tc.name    ColumnsKeyCodeValidation969
     * @tc.desc    Columns split mode at 969 probe 969
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('ColumnsKeyCodeValidation969', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const width: number = 969;
      expect(m.isSplitMode(width)).assertEqual(width >= 600);
      expect(m.getMailByType('nohit969') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_0970
     * @tc.name    ColumnsKeyCodeValidation970
     * @tc.desc    Columns split mode at 970 probe 970
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('ColumnsKeyCodeValidation970', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const width: number = 970;
      expect(m.isSplitMode(width)).assertEqual(width >= 600);
      expect(m.getMailByType('nohit970') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_0971
     * @tc.name    ColumnsKeyCodeValidation971
     * @tc.desc    Columns split mode at 971 probe 971
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('ColumnsKeyCodeValidation971', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const width: number = 971;
      expect(m.isSplitMode(width)).assertEqual(width >= 600);
      expect(m.getMailByType('nohit971') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_0972
     * @tc.name    ColumnsKeyCodeValidation972
     * @tc.desc    Columns split mode at 972 probe 972
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('ColumnsKeyCodeValidation972', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const width: number = 972;
      expect(m.isSplitMode(width)).assertEqual(width >= 600);
      expect(m.getMailByType('nohit972') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_0973
     * @tc.name    ColumnsKeyCodeValidation973
     * @tc.desc    Columns split mode at 973 probe 973
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('ColumnsKeyCodeValidation973', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const width: number = 973;
      expect(m.isSplitMode(width)).assertEqual(width >= 600);
      expect(m.getMailByType('nohit973') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_0974
     * @tc.name    ColumnsKeyCodeValidation974
     * @tc.desc    Columns split mode at 974 probe 974
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('ColumnsKeyCodeValidation974', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const width: number = 974;
      expect(m.isSplitMode(width)).assertEqual(width >= 600);
      expect(m.getMailByType('nohit974') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_0975
     * @tc.name    ColumnsKeyCodeValidation975
     * @tc.desc    Columns split mode at 975 probe 975
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('ColumnsKeyCodeValidation975', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const width: number = 975;
      expect(m.isSplitMode(width)).assertEqual(width >= 600);
      expect(m.getMailByType('nohit975') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_0976
     * @tc.name    ColumnsKeyCodeValidation976
     * @tc.desc    Columns split mode at 976 probe 976
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('ColumnsKeyCodeValidation976', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const width: number = 976;
      expect(m.isSplitMode(width)).assertEqual(width >= 600);
      expect(m.getMailByType('nohit976') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_0977
     * @tc.name    ColumnsKeyCodeValidation977
     * @tc.desc    Columns split mode at 977 probe 977
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('ColumnsKeyCodeValidation977', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const width: number = 977;
      expect(m.isSplitMode(width)).assertEqual(width >= 600);
      expect(m.getMailByType('nohit977') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_0978
     * @tc.name    ColumnsKeyCodeValidation978
     * @tc.desc    Columns split mode at 978 probe 978
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('ColumnsKeyCodeValidation978', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const width: number = 978;
      expect(m.isSplitMode(width)).assertEqual(width >= 600);
      expect(m.getMailByType('nohit978') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_0979
     * @tc.name    ColumnsKeyCodeValidation979
     * @tc.desc    Columns split mode at 979 probe 979
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('ColumnsKeyCodeValidation979', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const width: number = 979;
      expect(m.isSplitMode(width)).assertEqual(width >= 600);
      expect(m.getMailByType('nohit979') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_0980
     * @tc.name    ColumnsKeyCodeValidation980
     * @tc.desc    Columns split mode at 980 probe 980
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('ColumnsKeyCodeValidation980', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const width: number = 980;
      expect(m.isSplitMode(width)).assertEqual(width >= 600);
      expect(m.getMailByType('nohit980') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_0981
     * @tc.name    ColumnsKeyCodeValidation981
     * @tc.desc    Columns split mode at 981 probe 981
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('ColumnsKeyCodeValidation981', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const width: number = 981;
      expect(m.isSplitMode(width)).assertEqual(width >= 600);
      expect(m.getMailByType('nohit981') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_0982
     * @tc.name    ColumnsKeyCodeValidation982
     * @tc.desc    Columns split mode at 982 probe 982
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('ColumnsKeyCodeValidation982', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const width: number = 982;
      expect(m.isSplitMode(width)).assertEqual(width >= 600);
      expect(m.getMailByType('nohit982') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_0983
     * @tc.name    ColumnsKeyCodeValidation983
     * @tc.desc    Columns split mode at 983 probe 983
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('ColumnsKeyCodeValidation983', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const width: number = 983;
      expect(m.isSplitMode(width)).assertEqual(width >= 600);
      expect(m.getMailByType('nohit983') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_0984
     * @tc.name    ColumnsKeyCodeValidation984
     * @tc.desc    Columns split mode at 984 probe 984
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('ColumnsKeyCodeValidation984', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const width: number = 984;
      expect(m.isSplitMode(width)).assertEqual(width >= 600);
      expect(m.getMailByType('nohit984') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_0985
     * @tc.name    ColumnsKeyCodeValidation985
     * @tc.desc    Columns split mode at 985 probe 985
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('ColumnsKeyCodeValidation985', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const width: number = 985;
      expect(m.isSplitMode(width)).assertEqual(width >= 600);
      expect(m.getMailByType('nohit985') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_0986
     * @tc.name    ColumnsKeyCodeValidation986
     * @tc.desc    Columns split mode at 986 probe 986
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('ColumnsKeyCodeValidation986', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const width: number = 986;
      expect(m.isSplitMode(width)).assertEqual(width >= 600);
      expect(m.getMailByType('nohit986') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_0987
     * @tc.name    ColumnsKeyCodeValidation987
     * @tc.desc    Columns split mode at 987 probe 987
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('ColumnsKeyCodeValidation987', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const width: number = 987;
      expect(m.isSplitMode(width)).assertEqual(width >= 600);
      expect(m.getMailByType('nohit987') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_0988
     * @tc.name    ColumnsKeyCodeValidation988
     * @tc.desc    Columns split mode at 988 probe 988
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('ColumnsKeyCodeValidation988', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const width: number = 988;
      expect(m.isSplitMode(width)).assertEqual(width >= 600);
      expect(m.getMailByType('nohit988') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_0989
     * @tc.name    ColumnsKeyCodeValidation989
     * @tc.desc    Columns split mode at 989 probe 989
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('ColumnsKeyCodeValidation989', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const width: number = 989;
      expect(m.isSplitMode(width)).assertEqual(width >= 600);
      expect(m.getMailByType('nohit989') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_0990
     * @tc.name    ColumnsKeyCodeValidation990
     * @tc.desc    Columns split mode at 990 probe 990
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('ColumnsKeyCodeValidation990', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const width: number = 990;
      expect(m.isSplitMode(width)).assertEqual(width >= 600);
      expect(m.getMailByType('nohit990') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_0991
     * @tc.name    ColumnsKeyCodeValidation991
     * @tc.desc    Columns split mode at 991 probe 991
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('ColumnsKeyCodeValidation991', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const width: number = 991;
      expect(m.isSplitMode(width)).assertEqual(width >= 600);
      expect(m.getMailByType('nohit991') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_0992
     * @tc.name    ColumnsKeyCodeValidation992
     * @tc.desc    Columns split mode at 992 probe 992
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('ColumnsKeyCodeValidation992', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const width: number = 992;
      expect(m.isSplitMode(width)).assertEqual(width >= 600);
      expect(m.getMailByType('nohit992') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_0993
     * @tc.name    ColumnsKeyCodeValidation993
     * @tc.desc    Columns split mode at 993 probe 993
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('ColumnsKeyCodeValidation993', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const width: number = 993;
      expect(m.isSplitMode(width)).assertEqual(width >= 600);
      expect(m.getMailByType('nohit993') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_0994
     * @tc.name    ColumnsKeyCodeValidation994
     * @tc.desc    Columns split mode at 994 probe 994
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('ColumnsKeyCodeValidation994', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const width: number = 994;
      expect(m.isSplitMode(width)).assertEqual(width >= 600);
      expect(m.getMailByType('nohit994') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_0995
     * @tc.name    ColumnsKeyCodeValidation995
     * @tc.desc    Columns split mode at 995 probe 995
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('ColumnsKeyCodeValidation995', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const width: number = 995;
      expect(m.isSplitMode(width)).assertEqual(width >= 600);
      expect(m.getMailByType('nohit995') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_0996
     * @tc.name    ColumnsKeyCodeValidation996
     * @tc.desc    Columns split mode at 996 probe 996
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('ColumnsKeyCodeValidation996', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const width: number = 996;
      expect(m.isSplitMode(width)).assertEqual(width >= 600);
      expect(m.getMailByType('nohit996') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_0997
     * @tc.name    ColumnsKeyCodeValidation997
     * @tc.desc    Columns split mode at 997 probe 997
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('ColumnsKeyCodeValidation997', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const width: number = 997;
      expect(m.isSplitMode(width)).assertEqual(width >= 600);
      expect(m.getMailByType('nohit997') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_0998
     * @tc.name    ColumnsKeyCodeValidation998
     * @tc.desc    Columns split mode at 998 probe 998
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('ColumnsKeyCodeValidation998', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const width: number = 998;
      expect(m.isSplitMode(width)).assertEqual(width >= 600);
      expect(m.getMailByType('nohit998') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_0999
     * @tc.name    ColumnsKeyCodeValidation999
     * @tc.desc    Columns split mode at 999 probe 999
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('ColumnsKeyCodeValidation999', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const width: number = 999;
      expect(m.isSplitMode(width)).assertEqual(width >= 600);
      expect(m.getMailByType('nohit999') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_1000
     * @tc.name    ColumnsKeyCodeValidation1000
     * @tc.desc    Columns split mode at 0 probe 1000
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('ColumnsKeyCodeValidation1000', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const width: number = 0;
      expect(m.isSplitMode(width)).assertEqual(width >= 600);
      expect(m.getMailByType('nohit1000') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_1001
     * @tc.name    ColumnsKeyCodeValidation1001
     * @tc.desc    Columns split mode at 1 probe 1001
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('ColumnsKeyCodeValidation1001', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const width: number = 1;
      expect(m.isSplitMode(width)).assertEqual(width >= 600);
      expect(m.getMailByType('nohit1001') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_1002
     * @tc.name    ColumnsKeyCodeValidation1002
     * @tc.desc    Columns split mode at 2 probe 1002
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('ColumnsKeyCodeValidation1002', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const width: number = 2;
      expect(m.isSplitMode(width)).assertEqual(width >= 600);
      expect(m.getMailByType('nohit1002') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_1003
     * @tc.name    ColumnsKeyCodeValidation1003
     * @tc.desc    Columns split mode at 3 probe 1003
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('ColumnsKeyCodeValidation1003', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const width: number = 3;
      expect(m.isSplitMode(width)).assertEqual(width >= 600);
      expect(m.getMailByType('nohit1003') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_1004
     * @tc.name    ColumnsKeyCodeValidation1004
     * @tc.desc    Columns split mode at 4 probe 1004
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('ColumnsKeyCodeValidation1004', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const width: number = 4;
      expect(m.isSplitMode(width)).assertEqual(width >= 600);
      expect(m.getMailByType('nohit1004') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_1005
     * @tc.name    ColumnsKeyCodeValidation1005
     * @tc.desc    Columns split mode at 5 probe 1005
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('ColumnsKeyCodeValidation1005', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const width: number = 5;
      expect(m.isSplitMode(width)).assertEqual(width >= 600);
      expect(m.getMailByType('nohit1005') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_1006
     * @tc.name    ColumnsKeyCodeValidation1006
     * @tc.desc    Columns split mode at 6 probe 1006
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('ColumnsKeyCodeValidation1006', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const width: number = 6;
      expect(m.isSplitMode(width)).assertEqual(width >= 600);
      expect(m.getMailByType('nohit1006') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_1007
     * @tc.name    ColumnsKeyCodeValidation1007
     * @tc.desc    Columns split mode at 7 probe 1007
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('ColumnsKeyCodeValidation1007', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const width: number = 7;
      expect(m.isSplitMode(width)).assertEqual(width >= 600);
      expect(m.getMailByType('nohit1007') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_1008
     * @tc.name    ColumnsKeyCodeValidation1008
     * @tc.desc    Columns split mode at 8 probe 1008
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('ColumnsKeyCodeValidation1008', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const width: number = 8;
      expect(m.isSplitMode(width)).assertEqual(width >= 600);
      expect(m.getMailByType('nohit1008') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_1009
     * @tc.name    ColumnsKeyCodeValidation1009
     * @tc.desc    Columns split mode at 9 probe 1009
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('ColumnsKeyCodeValidation1009', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const width: number = 9;
      expect(m.isSplitMode(width)).assertEqual(width >= 600);
      expect(m.getMailByType('nohit1009') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_1010
     * @tc.name    ColumnsKeyCodeValidation1010
     * @tc.desc    Columns split mode at 10 probe 1010
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('ColumnsKeyCodeValidation1010', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const width: number = 10;
      expect(m.isSplitMode(width)).assertEqual(width >= 600);
      expect(m.getMailByType('nohit1010') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_1011
     * @tc.name    ColumnsKeyCodeValidation1011
     * @tc.desc    Columns split mode at 11 probe 1011
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('ColumnsKeyCodeValidation1011', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const width: number = 11;
      expect(m.isSplitMode(width)).assertEqual(width >= 600);
      expect(m.getMailByType('nohit1011') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_1012
     * @tc.name    ColumnsKeyCodeValidation1012
     * @tc.desc    Columns split mode at 12 probe 1012
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('ColumnsKeyCodeValidation1012', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const width: number = 12;
      expect(m.isSplitMode(width)).assertEqual(width >= 600);
      expect(m.getMailByType('nohit1012') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_1013
     * @tc.name    ColumnsKeyCodeValidation1013
     * @tc.desc    Columns split mode at 13 probe 1013
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('ColumnsKeyCodeValidation1013', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const width: number = 13;
      expect(m.isSplitMode(width)).assertEqual(width >= 600);
      expect(m.getMailByType('nohit1013') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_1014
     * @tc.name    ColumnsKeyCodeValidation1014
     * @tc.desc    Columns split mode at 14 probe 1014
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('ColumnsKeyCodeValidation1014', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const width: number = 14;
      expect(m.isSplitMode(width)).assertEqual(width >= 600);
      expect(m.getMailByType('nohit1014') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_1015
     * @tc.name    ColumnsKeyCodeValidation1015
     * @tc.desc    Columns split mode at 15 probe 1015
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('ColumnsKeyCodeValidation1015', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const width: number = 15;
      expect(m.isSplitMode(width)).assertEqual(width >= 600);
      expect(m.getMailByType('nohit1015') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_1016
     * @tc.name    ColumnsKeyCodeValidation1016
     * @tc.desc    Columns split mode at 16 probe 1016
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('ColumnsKeyCodeValidation1016', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const width: number = 16;
      expect(m.isSplitMode(width)).assertEqual(width >= 600);
      expect(m.getMailByType('nohit1016') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_1017
     * @tc.name    ColumnsKeyCodeValidation1017
     * @tc.desc    Columns split mode at 17 probe 1017
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('ColumnsKeyCodeValidation1017', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const width: number = 17;
      expect(m.isSplitMode(width)).assertEqual(width >= 600);
      expect(m.getMailByType('nohit1017') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_1018
     * @tc.name    ColumnsKeyCodeValidation1018
     * @tc.desc    Columns split mode at 18 probe 1018
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('ColumnsKeyCodeValidation1018', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const width: number = 18;
      expect(m.isSplitMode(width)).assertEqual(width >= 600);
      expect(m.getMailByType('nohit1018') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_1019
     * @tc.name    ColumnsKeyCodeValidation1019
     * @tc.desc    Columns split mode at 19 probe 1019
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('ColumnsKeyCodeValidation1019', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const width: number = 19;
      expect(m.isSplitMode(width)).assertEqual(width >= 600);
      expect(m.getMailByType('nohit1019') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_1020
     * @tc.name    ColumnsKeyCodeValidation1020
     * @tc.desc    Columns split mode at 20 probe 1020
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('ColumnsKeyCodeValidation1020', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const width: number = 20;
      expect(m.isSplitMode(width)).assertEqual(width >= 600);
      expect(m.getMailByType('nohit1020') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_1021
     * @tc.name    ColumnsKeyCodeValidation1021
     * @tc.desc    Columns split mode at 21 probe 1021
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('ColumnsKeyCodeValidation1021', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const width: number = 21;
      expect(m.isSplitMode(width)).assertEqual(width >= 600);
      expect(m.getMailByType('nohit1021') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_1022
     * @tc.name    ColumnsKeyCodeValidation1022
     * @tc.desc    Columns split mode at 22 probe 1022
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('ColumnsKeyCodeValidation1022', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const width: number = 22;
      expect(m.isSplitMode(width)).assertEqual(width >= 600);
      expect(m.getMailByType('nohit1022') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_1023
     * @tc.name    ColumnsKeyCodeValidation1023
     * @tc.desc    Columns split mode at 23 probe 1023
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('ColumnsKeyCodeValidation1023', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const width: number = 23;
      expect(m.isSplitMode(width)).assertEqual(width >= 600);
      expect(m.getMailByType('nohit1023') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_1024
     * @tc.name    ColumnsKeyCodeValidation1024
     * @tc.desc    Columns split mode at 24 probe 1024
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('ColumnsKeyCodeValidation1024', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const width: number = 24;
      expect(m.isSplitMode(width)).assertEqual(width >= 600);
      expect(m.getMailByType('nohit1024') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_1025
     * @tc.name    ColumnsKeyCodeValidation1025
     * @tc.desc    Columns split mode at 25 probe 1025
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('ColumnsKeyCodeValidation1025', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const width: number = 25;
      expect(m.isSplitMode(width)).assertEqual(width >= 600);
      expect(m.getMailByType('nohit1025') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_1026
     * @tc.name    ColumnsKeyCodeValidation1026
     * @tc.desc    Columns split mode at 26 probe 1026
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('ColumnsKeyCodeValidation1026', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const width: number = 26;
      expect(m.isSplitMode(width)).assertEqual(width >= 600);
      expect(m.getMailByType('nohit1026') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_1027
     * @tc.name    ColumnsKeyCodeValidation1027
     * @tc.desc    Columns split mode at 27 probe 1027
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('ColumnsKeyCodeValidation1027', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const width: number = 27;
      expect(m.isSplitMode(width)).assertEqual(width >= 600);
      expect(m.getMailByType('nohit1027') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_1028
     * @tc.name    ColumnsKeyCodeValidation1028
     * @tc.desc    Columns split mode at 28 probe 1028
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('ColumnsKeyCodeValidation1028', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const width: number = 28;
      expect(m.isSplitMode(width)).assertEqual(width >= 600);
      expect(m.getMailByType('nohit1028') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_1029
     * @tc.name    ColumnsKeyCodeValidation1029
     * @tc.desc    Columns split mode at 29 probe 1029
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('ColumnsKeyCodeValidation1029', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const width: number = 29;
      expect(m.isSplitMode(width)).assertEqual(width >= 600);
      expect(m.getMailByType('nohit1029') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_1030
     * @tc.name    ColumnsKeyCodeValidation1030
     * @tc.desc    Columns split mode at 30 probe 1030
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('ColumnsKeyCodeValidation1030', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const width: number = 30;
      expect(m.isSplitMode(width)).assertEqual(width >= 600);
      expect(m.getMailByType('nohit1030') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_1031
     * @tc.name    ColumnsKeyCodeValidation1031
     * @tc.desc    Columns split mode at 31 probe 1031
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('ColumnsKeyCodeValidation1031', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const width: number = 31;
      expect(m.isSplitMode(width)).assertEqual(width >= 600);
      expect(m.getMailByType('nohit1031') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_1032
     * @tc.name    ColumnsKeyCodeValidation1032
     * @tc.desc    Columns split mode at 32 probe 1032
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('ColumnsKeyCodeValidation1032', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const width: number = 32;
      expect(m.isSplitMode(width)).assertEqual(width >= 600);
      expect(m.getMailByType('nohit1032') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_1033
     * @tc.name    ColumnsKeyCodeValidation1033
     * @tc.desc    Columns split mode at 33 probe 1033
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('ColumnsKeyCodeValidation1033', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const width: number = 33;
      expect(m.isSplitMode(width)).assertEqual(width >= 600);
      expect(m.getMailByType('nohit1033') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_1034
     * @tc.name    ColumnsKeyCodeValidation1034
     * @tc.desc    Columns split mode at 34 probe 1034
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('ColumnsKeyCodeValidation1034', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const width: number = 34;
      expect(m.isSplitMode(width)).assertEqual(width >= 600);
      expect(m.getMailByType('nohit1034') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_1035
     * @tc.name    ColumnsKeyCodeValidation1035
     * @tc.desc    Columns split mode at 35 probe 1035
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('ColumnsKeyCodeValidation1035', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const width: number = 35;
      expect(m.isSplitMode(width)).assertEqual(width >= 600);
      expect(m.getMailByType('nohit1035') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_1036
     * @tc.name    ColumnsKeyCodeValidation1036
     * @tc.desc    Columns split mode at 36 probe 1036
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('ColumnsKeyCodeValidation1036', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const width: number = 36;
      expect(m.isSplitMode(width)).assertEqual(width >= 600);
      expect(m.getMailByType('nohit1036') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_1037
     * @tc.name    ColumnsKeyCodeValidation1037
     * @tc.desc    Columns split mode at 37 probe 1037
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('ColumnsKeyCodeValidation1037', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const width: number = 37;
      expect(m.isSplitMode(width)).assertEqual(width >= 600);
      expect(m.getMailByType('nohit1037') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_1038
     * @tc.name    ColumnsKeyCodeValidation1038
     * @tc.desc    Columns split mode at 38 probe 1038
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('ColumnsKeyCodeValidation1038', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const width: number = 38;
      expect(m.isSplitMode(width)).assertEqual(width >= 600);
      expect(m.getMailByType('nohit1038') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_1039
     * @tc.name    ColumnsKeyCodeValidation1039
     * @tc.desc    Columns split mode at 39 probe 1039
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('ColumnsKeyCodeValidation1039', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const width: number = 39;
      expect(m.isSplitMode(width)).assertEqual(width >= 600);
      expect(m.getMailByType('nohit1039') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_1040
     * @tc.name    ColumnsKeyCodeValidation1040
     * @tc.desc    Columns split mode at 40 probe 1040
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('ColumnsKeyCodeValidation1040', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const width: number = 40;
      expect(m.isSplitMode(width)).assertEqual(width >= 600);
      expect(m.getMailByType('nohit1040') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_1041
     * @tc.name    ColumnsKeyCodeValidation1041
     * @tc.desc    Columns split mode at 41 probe 1041
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('ColumnsKeyCodeValidation1041', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const width: number = 41;
      expect(m.isSplitMode(width)).assertEqual(width >= 600);
      expect(m.getMailByType('nohit1041') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_1042
     * @tc.name    ColumnsKeyCodeValidation1042
     * @tc.desc    Columns split mode at 42 probe 1042
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('ColumnsKeyCodeValidation1042', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const width: number = 42;
      expect(m.isSplitMode(width)).assertEqual(width >= 600);
      expect(m.getMailByType('nohit1042') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_1043
     * @tc.name    ColumnsKeyCodeValidation1043
     * @tc.desc    Columns split mode at 43 probe 1043
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('ColumnsKeyCodeValidation1043', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const width: number = 43;
      expect(m.isSplitMode(width)).assertEqual(width >= 600);
      expect(m.getMailByType('nohit1043') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_1044
     * @tc.name    ColumnsKeyCodeValidation1044
     * @tc.desc    Columns split mode at 44 probe 1044
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('ColumnsKeyCodeValidation1044', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const width: number = 44;
      expect(m.isSplitMode(width)).assertEqual(width >= 600);
      expect(m.getMailByType('nohit1044') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_1045
     * @tc.name    ColumnsKeyCodeValidation1045
     * @tc.desc    Columns split mode at 45 probe 1045
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('ColumnsKeyCodeValidation1045', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const width: number = 45;
      expect(m.isSplitMode(width)).assertEqual(width >= 600);
      expect(m.getMailByType('nohit1045') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_1046
     * @tc.name    ColumnsKeyCodeValidation1046
     * @tc.desc    Columns split mode at 46 probe 1046
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('ColumnsKeyCodeValidation1046', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const width: number = 46;
      expect(m.isSplitMode(width)).assertEqual(width >= 600);
      expect(m.getMailByType('nohit1046') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_1047
     * @tc.name    ColumnsKeyCodeValidation1047
     * @tc.desc    Columns split mode at 47 probe 1047
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('ColumnsKeyCodeValidation1047', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const width: number = 47;
      expect(m.isSplitMode(width)).assertEqual(width >= 600);
      expect(m.getMailByType('nohit1047') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_1048
     * @tc.name    ColumnsKeyCodeValidation1048
     * @tc.desc    Columns split mode at 48 probe 1048
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('ColumnsKeyCodeValidation1048', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const width: number = 48;
      expect(m.isSplitMode(width)).assertEqual(width >= 600);
      expect(m.getMailByType('nohit1048') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_1049
     * @tc.name    ColumnsKeyCodeValidation1049
     * @tc.desc    Columns split mode at 49 probe 1049
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('ColumnsKeyCodeValidation1049', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const width: number = 49;
      expect(m.isSplitMode(width)).assertEqual(width >= 600);
      expect(m.getMailByType('nohit1049') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_1050
     * @tc.name    ColumnsKeyCodeValidation1050
     * @tc.desc    Columns split mode at 50 probe 1050
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('ColumnsKeyCodeValidation1050', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const width: number = 50;
      expect(m.isSplitMode(width)).assertEqual(width >= 600);
      expect(m.getMailByType('nohit1050') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_1051
     * @tc.name    ColumnsKeyCodeValidation1051
     * @tc.desc    Columns split mode at 51 probe 1051
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('ColumnsKeyCodeValidation1051', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const width: number = 51;
      expect(m.isSplitMode(width)).assertEqual(width >= 600);
      expect(m.getMailByType('nohit1051') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_1052
     * @tc.name    ColumnsKeyCodeValidation1052
     * @tc.desc    Columns split mode at 52 probe 1052
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('ColumnsKeyCodeValidation1052', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const width: number = 52;
      expect(m.isSplitMode(width)).assertEqual(width >= 600);
      expect(m.getMailByType('nohit1052') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_1053
     * @tc.name    ColumnsKeyCodeValidation1053
     * @tc.desc    Columns split mode at 53 probe 1053
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('ColumnsKeyCodeValidation1053', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const width: number = 53;
      expect(m.isSplitMode(width)).assertEqual(width >= 600);
      expect(m.getMailByType('nohit1053') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_1054
     * @tc.name    ColumnsKeyCodeValidation1054
     * @tc.desc    Columns split mode at 54 probe 1054
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('ColumnsKeyCodeValidation1054', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const width: number = 54;
      expect(m.isSplitMode(width)).assertEqual(width >= 600);
      expect(m.getMailByType('nohit1054') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_1055
     * @tc.name    ColumnsKeyCodeValidation1055
     * @tc.desc    Columns split mode at 55 probe 1055
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('ColumnsKeyCodeValidation1055', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const width: number = 55;
      expect(m.isSplitMode(width)).assertEqual(width >= 600);
      expect(m.getMailByType('nohit1055') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_1056
     * @tc.name    ColumnsKeyCodeValidation1056
     * @tc.desc    Columns split mode at 56 probe 1056
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('ColumnsKeyCodeValidation1056', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const width: number = 56;
      expect(m.isSplitMode(width)).assertEqual(width >= 600);
      expect(m.getMailByType('nohit1056') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_1057
     * @tc.name    ColumnsKeyCodeValidation1057
     * @tc.desc    Columns split mode at 57 probe 1057
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('ColumnsKeyCodeValidation1057', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const width: number = 57;
      expect(m.isSplitMode(width)).assertEqual(width >= 600);
      expect(m.getMailByType('nohit1057') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_1058
     * @tc.name    ColumnsKeyCodeValidation1058
     * @tc.desc    Columns split mode at 58 probe 1058
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('ColumnsKeyCodeValidation1058', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const width: number = 58;
      expect(m.isSplitMode(width)).assertEqual(width >= 600);
      expect(m.getMailByType('nohit1058') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_1059
     * @tc.name    ColumnsKeyCodeValidation1059
     * @tc.desc    Columns split mode at 59 probe 1059
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('ColumnsKeyCodeValidation1059', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const width: number = 59;
      expect(m.isSplitMode(width)).assertEqual(width >= 600);
      expect(m.getMailByType('nohit1059') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_1060
     * @tc.name    ColumnsKeyCodeValidation1060
     * @tc.desc    Columns split mode at 60 probe 1060
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('ColumnsKeyCodeValidation1060', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const width: number = 60;
      expect(m.isSplitMode(width)).assertEqual(width >= 600);
      expect(m.getMailByType('nohit1060') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_1061
     * @tc.name    ColumnsKeyCodeValidation1061
     * @tc.desc    Columns split mode at 61 probe 1061
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('ColumnsKeyCodeValidation1061', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const width: number = 61;
      expect(m.isSplitMode(width)).assertEqual(width >= 600);
      expect(m.getMailByType('nohit1061') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_1062
     * @tc.name    ColumnsKeyCodeValidation1062
     * @tc.desc    Columns split mode at 62 probe 1062
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('ColumnsKeyCodeValidation1062', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const width: number = 62;
      expect(m.isSplitMode(width)).assertEqual(width >= 600);
      expect(m.getMailByType('nohit1062') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_1063
     * @tc.name    ColumnsKeyCodeValidation1063
     * @tc.desc    Columns split mode at 63 probe 1063
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('ColumnsKeyCodeValidation1063', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const width: number = 63;
      expect(m.isSplitMode(width)).assertEqual(width >= 600);
      expect(m.getMailByType('nohit1063') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_1064
     * @tc.name    ColumnsKeyCodeValidation1064
     * @tc.desc    Columns split mode at 64 probe 1064
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('ColumnsKeyCodeValidation1064', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const width: number = 64;
      expect(m.isSplitMode(width)).assertEqual(width >= 600);
      expect(m.getMailByType('nohit1064') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_1065
     * @tc.name    ColumnsKeyCodeValidation1065
     * @tc.desc    Columns split mode at 65 probe 1065
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('ColumnsKeyCodeValidation1065', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const width: number = 65;
      expect(m.isSplitMode(width)).assertEqual(width >= 600);
      expect(m.getMailByType('nohit1065') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });
