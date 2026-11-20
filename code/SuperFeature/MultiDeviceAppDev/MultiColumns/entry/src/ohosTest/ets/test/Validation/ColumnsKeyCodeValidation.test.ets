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
