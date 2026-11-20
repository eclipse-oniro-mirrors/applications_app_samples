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
import { BreakpointModel } from '../Shared/BreakpointModel';

const DOMAIN: number = 0xF811;
const TAG: string = '[BreakpointTests]';

export default function breakpointPowerConsumptionSuite() {
  describe('BreakpointPowerConsumptionSuite', () => {
    let m: BreakpointModel = new BreakpointModel();

    beforeEach(() => {
      m = new BreakpointModel();
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_BREAKPOINT_0100
     * @tc.name    BreakpointPowerConsumption001
     * @tc.desc    Width 0vp resolves to breakpoint xs
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('BreakpointPowerConsumption001', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      expect(m.resolve(0)).assertEqual('xs');
      m.applyWidth(0);
      expect(m.getCurrent()).assertEqual('xs');
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_BREAKPOINT_0200
     * @tc.name    BreakpointPowerConsumption002
     * @tc.desc    Width 1vp resolves to breakpoint xs
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('BreakpointPowerConsumption002', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      expect(m.resolve(1)).assertEqual('xs');
      m.applyWidth(1);
      expect(m.getCurrent()).assertEqual('xs');
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_BREAKPOINT_0300
     * @tc.name    BreakpointPowerConsumption003
     * @tc.desc    Each breakpoint definition resolves to itself and owns its lower bound
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('BreakpointPowerConsumption003', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      for (let k = 0; k < m.getDefinitions().length; k++) {
        const def = m.getDefinitions()[k];
        expect(def.name.length).assertLarger(0);
        expect(def.size >= 0).assertEqual(true);
        expect(m.resolve(def.size)).assertEqual(def.name);
        const range: number[] = m.rangeOf(def.name);
        expect(range[0]).assertEqual(def.size);
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_BREAKPOINT_0400
     * @tc.name    BreakpointPowerConsumption004
     * @tc.desc    Width 319vp resolves to breakpoint xs
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('BreakpointPowerConsumption004', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      expect(m.resolve(319)).assertEqual('xs');
      m.applyWidth(319);
      expect(m.getCurrent()).assertEqual('xs');
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_BREAKPOINT_0500
     * @tc.name    BreakpointPowerConsumption005
     * @tc.desc    Width 320vp resolves to breakpoint sm
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('BreakpointPowerConsumption005', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      expect(m.resolve(320)).assertEqual('sm');
      m.applyWidth(320);
      expect(m.getCurrent()).assertEqual('sm');
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_BREAKPOINT_0600
     * @tc.name    BreakpointPowerConsumption006
     * @tc.desc    Adjacent breakpoint ranges share a boundary with no gaps
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('BreakpointPowerConsumption006', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      const names: string[] = m.getBreakpointNames();
      for (let k = 1; k < names.length; k++) {
        const prevRange: number[] = m.rangeOf(names[k - 1]);
        const currRange: number[] = m.rangeOf(names[k]);
        expect(prevRange[1]).assertEqual(currRange[0]);
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_BREAKPOINT_0700
     * @tc.name    BreakpointPowerConsumption007
     * @tc.desc    Width 480vp resolves to breakpoint sm
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('BreakpointPowerConsumption007', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      expect(m.resolve(480)).assertEqual('sm');
      m.applyWidth(480);
      expect(m.getCurrent()).assertEqual('sm');
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_BREAKPOINT_0800
     * @tc.name    BreakpointPowerConsumption008
     * @tc.desc    Width 599vp resolves to breakpoint sm
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('BreakpointPowerConsumption008', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      expect(m.resolve(599)).assertEqual('sm');
      m.applyWidth(599);
      expect(m.getCurrent()).assertEqual('sm');
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_BREAKPOINT_0900
     * @tc.name    BreakpointPowerConsumption009
     * @tc.desc    Columns gutter margin and font never decrease as breakpoint grows
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('BreakpointPowerConsumption009', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      const ordered: string[] = m.getBreakpointNames();
      let prevColumns: number = -1;
      let prevGutter: number = -1;
      let prevMargin: number = -1;
      let prevFont: number = -1;
      for (let k = 0; k < ordered.length; k++) {
        const profile = m.profileOf(ordered[k]);
        expect(profile.columns >= prevColumns).assertEqual(true);
        expect(profile.gutterVp >= prevGutter).assertEqual(true);
        expect(profile.marginVp >= prevMargin).assertEqual(true);
        expect(profile.fontFp >= prevFont).assertEqual(true);
        prevColumns = profile.columns;
        prevGutter = profile.gutterVp;
        prevMargin = profile.marginVp;
        prevFont = profile.fontFp;
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_BREAKPOINT_1000
     * @tc.name    BreakpointPowerConsumption010
     * @tc.desc    Width 601vp resolves to breakpoint md
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('BreakpointPowerConsumption010', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      expect(m.resolve(601)).assertEqual('md');
      m.applyWidth(601);
      expect(m.getCurrent()).assertEqual('md');
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_BREAKPOINT_1100
     * @tc.name    BreakpointPowerConsumption011
     * @tc.desc    Width 720vp resolves to breakpoint md
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('BreakpointPowerConsumption011', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      expect(m.resolve(720)).assertEqual('md');
      m.applyWidth(720);
      expect(m.getCurrent()).assertEqual('md');
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_BREAKPOINT_1200
     * @tc.name    BreakpointPowerConsumption012
     * @tc.desc    History forms a linked chain with strictly increasing sequence numbers
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('BreakpointPowerConsumption012', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      m.clearHistory();
      const sweep: number[] = [0, 400, 700, 900, 500, 100];
      for (let k = 0; k < sweep.length; k++) {
        m.applyWidth(sweep[k]);
      }
      const trail = m.getHistory();
      for (let k = 1; k < trail.length; k++) {
        expect(trail[k].seq).assertEqual(trail[k - 1].seq + 1);
        expect(trail[k].from).assertEqual(trail[k - 1].to);
      }
      if (trail.length > 0) {
        expect(trail[trail.length - 1].to).assertEqual(m.getCurrent());
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_BREAKPOINT_1300
     * @tc.name    BreakpointPowerConsumption013
     * @tc.desc    Width 840vp resolves to breakpoint lg
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('BreakpointPowerConsumption013', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      expect(m.resolve(840)).assertEqual('lg');
      m.applyWidth(840);
      expect(m.getCurrent()).assertEqual('lg');
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_BREAKPOINT_1400
     * @tc.name    BreakpointPowerConsumption014
     * @tc.desc    Width 841vp resolves to breakpoint lg
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('BreakpointPowerConsumption014', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      expect(m.resolve(841)).assertEqual('lg');
      m.applyWidth(841);
      expect(m.getCurrent()).assertEqual('lg');
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_BREAKPOINT_1500
     * @tc.name    BreakpointPowerConsumption015
     * @tc.desc    Five register and five unregister calls leave zero listeners
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('BreakpointPowerConsumption015', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      const regBefore: number = m.getRegisterCalls();
      const unregBefore: number = m.getUnregisterCalls();
      for (let k = 0; k < 5; k++) {
        m.register();
      }
      for (let k = 0; k < 5; k++) {
        m.unregister();
      }
      expect(m.getRegisterCalls()).assertEqual(regBefore + 5);
      expect(m.getUnregisterCalls()).assertEqual(unregBefore + 5);
      expect(m.getListenerCount()).assertEqual(0);
      expect(m.isListenerBalanced()).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_BREAKPOINT_1600
     * @tc.name    BreakpointPowerConsumption016
     * @tc.desc    Width 1440vp resolves to breakpoint lg
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('BreakpointPowerConsumption016', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      expect(m.resolve(1440)).assertEqual('lg');
      m.applyWidth(1440);
      expect(m.getCurrent()).assertEqual('lg');
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_BREAKPOINT_1700
     * @tc.name    BreakpointPowerConsumption017
     * @tc.desc    SM breakpoint range is [320, 600)
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('BreakpointPowerConsumption017', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      const r: number[] = m.rangeOf('sm');
      expect(r[0]).assertEqual(320);
      expect(r[1]).assertEqual(600);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_BREAKPOINT_1800
     * @tc.name    BreakpointPowerConsumption018
     * @tc.desc    Wider breakpoints produce narrower individual columns
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('BreakpointPowerConsumption018', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      const wide: number = m.columnWidth(1440, 'lg');
      const narrow: number = m.columnWidth(1440, 'sm');
      expect(wide > 0).assertEqual(true);
      expect(narrow > 0).assertEqual(true);
      expect(wide < narrow).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_BREAKPOINT_1900
     * @tc.name    BreakpointPowerConsumption019
     * @tc.desc    LG breakpoint range has open upper bound
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('BreakpointPowerConsumption019', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      const r: number[] = m.rangeOf('lg');
      expect(r[0]).assertEqual(840);
      expect(r[1]).assertEqual(Number.MAX_SAFE_INTEGER);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_BREAKPOINT_2000
     * @tc.name    BreakpointPowerConsumption020
     * @tc.desc    Unknown breakpoint returns negative range
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('BreakpointPowerConsumption020', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      const r: number[] = m.rangeOf('nope');
      expect(r[0]).assertEqual(-1);
      expect(r[1]).assertEqual(-1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_BREAKPOINT_2100
     * @tc.name    BreakpointPowerConsumption021
     * @tc.desc    Clamping preserves legal widths and never returns a negative value
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('BreakpointPowerConsumption021', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      const raw: number[] = [-100, -1, 0, 319, 320, 599, 600, 839, 840, 2000];
      for (let k = 0; k < raw.length; k++) {
        const clamped: number = m.clampWidth(raw[k]);
        expect(clamped >= 0).assertEqual(true);
        if (raw[k] >= 0) {
          expect(clamped).assertEqual(raw[k]);
        }
        expect(m.resolve(clamped).length).assertLarger(0);
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_BREAKPOINT_2200
     * @tc.name    BreakpointPowerConsumption022
     * @tc.desc    Layout profiles grow monotonically with breakpoint
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('BreakpointPowerConsumption022', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      expect(m.isProfileMonotonic()).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_BREAKPOINT_2300
     * @tc.name    BreakpointPowerConsumption023
     * @tc.desc    XS profile uses 2 columns
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('BreakpointPowerConsumption023', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      expect(m.profileOf('xs').columns).assertEqual(2);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_BREAKPOINT_2400
     * @tc.name    BreakpointPowerConsumption024
     * @tc.desc    LG profile uses 12 columns
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('BreakpointPowerConsumption024', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      expect(m.profileOf('lg').columns).assertEqual(12);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_BREAKPOINT_2500
     * @tc.name    BreakpointPowerConsumption025
     * @tc.desc    Negative width clamps to zero
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('BreakpointPowerConsumption025', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      expect(m.clampWidth(-1)).assertEqual(0);
      expect(m.clampWidth(-999)).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_BREAKPOINT_2600
     * @tc.name    BreakpointPowerConsumption026
     * @tc.desc    Non-negative width is preserved by clamp
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('BreakpointPowerConsumption026', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      expect(m.clampWidth(0)).assertEqual(0);
      expect(m.clampWidth(1440)).assertEqual(1440);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_BREAKPOINT_2700
     * @tc.name    BreakpointPowerConsumption027
     * @tc.desc    Widths 500 and 599 share the same breakpoint
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('BreakpointPowerConsumption027', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      expect(m.isSameBreakpoint(500, 599)).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_BREAKPOINT_2800
     * @tc.name    BreakpointPowerConsumption028
     * @tc.desc    Widths 599 and 600 differ in breakpoint
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('BreakpointPowerConsumption028', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      expect(m.isSameBreakpoint(599, 600)).assertEqual(false);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_BREAKPOINT_2900
     * @tc.name    BreakpointPowerConsumption029
     * @tc.desc    LG column width is positive at 1000vp
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('BreakpointPowerConsumption029', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      expect(m.columnWidth(1000, 'lg') > 0).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_BREAKPOINT_3000
     * @tc.name    BreakpointPowerConsumption030
     * @tc.desc    Column width never becomes negative
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('BreakpointPowerConsumption030', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      expect(m.columnWidth(10, 'lg') >= 0).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_BREAKPOINT_3100
     * @tc.name    BreakpointPowerConsumption031
     * @tc.desc    Register and unregister calls stay balanced
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('BreakpointPowerConsumption031', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      m.register();
      m.register();
      m.unregister();
      m.unregister();
      expect(m.isListenerBalanced()).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_BREAKPOINT_3200
     * @tc.name    BreakpointPowerConsumption032
     * @tc.desc    Extra unregister never drives listener count negative
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('BreakpointPowerConsumption032', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      const base: number = m.getListenerCount();
      m.unregister();
      expect(m.getListenerCount()).assertEqual(base);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_BREAKPOINT_3300
     * @tc.name    BreakpointPowerConsumption033
     * @tc.desc    Breakpoint names follow xs/sm/md/lg order
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('BreakpointPowerConsumption033', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      const names: string[] = m.getBreakpointNames();
      expect(names[0]).assertEqual('xs');
      expect(names[3]).assertEqual('lg');
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_BREAKPOINT_3400
     * @tc.name    BreakpointPowerConsumption034
     * @tc.desc    Breakpoint definition table has four entries
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('BreakpointPowerConsumption034', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      expect(m.getDefinitions().length).assertEqual(4);
      expect(m.getDefinitions()[0].size).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_BREAKPOINT_3500
     * @tc.name    BreakpointPowerConsumption035
     * @tc.desc    Breakpoint history forms a linked from/to chain
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('BreakpointPowerConsumption035', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      m.clearHistory();
      m.applyWidth(0);
      m.applyWidth(500);
      m.applyWidth(700);
      const h = m.getHistory();
      for (let k = 1; k < h.length; k++) {
        expect(h[k].from).assertEqual(h[k - 1].to);
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_BREAKPOINT_3600
     * @tc.name    BreakpointPowerConsumption036
     * @tc.desc    Same-tier width changes raise no change event
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('BreakpointPowerConsumption036', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      m.clearHistory();
      m.applyWidth(700);
      const c0: number = m.getChangeCount();
      m.clearHistory();
      m.applyWidth(700);
      const c1: number = m.getChangeCount();
      expect(c1).assertEqual(0);
      expect(c0 >= 0).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_BREAKPOINT_3700
     * @tc.name    BreakpointPowerConsumption037
     * @tc.desc    SM breakpoint range is [320, 600)
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('BreakpointPowerConsumption037', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      const r: number[] = m.rangeOf('sm');
      expect(r[0]).assertEqual(320);
      expect(r[1]).assertEqual(600);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_BREAKPOINT_3800
     * @tc.name    BreakpointPowerConsumption038
     * @tc.desc    MD breakpoint range is [600, 840)
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('BreakpointPowerConsumption038', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      const r: number[] = m.rangeOf('md');
      expect(r[0]).assertEqual(600);
      expect(r[1]).assertEqual(840);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_BREAKPOINT_3900
     * @tc.name    BreakpointPowerConsumption039
     * @tc.desc    LG breakpoint range has open upper bound
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('BreakpointPowerConsumption039', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      const r: number[] = m.rangeOf('lg');
      expect(r[0]).assertEqual(840);
      expect(r[1]).assertEqual(Number.MAX_SAFE_INTEGER);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_BREAKPOINT_4000
     * @tc.name    BreakpointPowerConsumption040
     * @tc.desc    Unknown breakpoint returns negative range
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('BreakpointPowerConsumption040', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      const r: number[] = m.rangeOf('nope');
      expect(r[0]).assertEqual(-1);
      expect(r[1]).assertEqual(-1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_BREAKPOINT_4100
     * @tc.name    BreakpointPowerConsumption041
     * @tc.desc    Breakpoint thresholds are strictly ascending
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('BreakpointPowerConsumption041', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      expect(m.isThresholdAscending()).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_BREAKPOINT_4200
     * @tc.name    BreakpointPowerConsumption042
     * @tc.desc    Layout profiles grow monotonically with breakpoint
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('BreakpointPowerConsumption042', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      expect(m.isProfileMonotonic()).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_BREAKPOINT_4300
     * @tc.name    BreakpointPowerConsumption043
     * @tc.desc    XS profile uses 2 columns
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('BreakpointPowerConsumption043', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      expect(m.profileOf('xs').columns).assertEqual(2);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_BREAKPOINT_4400
     * @tc.name    BreakpointPowerConsumption044
     * @tc.desc    LG profile uses 12 columns
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('BreakpointPowerConsumption044', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      expect(m.profileOf('lg').columns).assertEqual(12);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_BREAKPOINT_4500
     * @tc.name    BreakpointPowerConsumption045
     * @tc.desc    Negative width clamps to zero
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('BreakpointPowerConsumption045', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      expect(m.clampWidth(-1)).assertEqual(0);
      expect(m.clampWidth(-999)).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_BREAKPOINT_4600
     * @tc.name    BreakpointPowerConsumption046
     * @tc.desc    Non-negative width is preserved by clamp
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('BreakpointPowerConsumption046', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      expect(m.clampWidth(0)).assertEqual(0);
      expect(m.clampWidth(1440)).assertEqual(1440);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_BREAKPOINT_4700
     * @tc.name    BreakpointPowerConsumption047
     * @tc.desc    Widths 500 and 599 share the same breakpoint
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('BreakpointPowerConsumption047', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      expect(m.isSameBreakpoint(500, 599)).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_BREAKPOINT_4800
     * @tc.name    BreakpointPowerConsumption048
     * @tc.desc    Widths 599 and 600 differ in breakpoint
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('BreakpointPowerConsumption048', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      expect(m.isSameBreakpoint(599, 600)).assertEqual(false);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_BREAKPOINT_4900
     * @tc.name    BreakpointPowerConsumption049
     * @tc.desc    LG column width is positive at 1000vp
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('BreakpointPowerConsumption049', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      expect(m.columnWidth(1000, 'lg') > 0).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_BREAKPOINT_5000
     * @tc.name    BreakpointPowerConsumption050
     * @tc.desc    Column width never becomes negative
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('BreakpointPowerConsumption050', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      expect(m.columnWidth(10, 'lg') >= 0).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_BREAKPOINT_5100
     * @tc.name    BreakpointPowerConsumption051
     * @tc.desc    Register and unregister calls stay balanced
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('BreakpointPowerConsumption051', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      m.register();
      m.register();
      m.unregister();
      m.unregister();
      expect(m.isListenerBalanced()).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_BREAKPOINT_5200
     * @tc.name    BreakpointPowerConsumption052
     * @tc.desc    Extra unregister never drives listener count negative
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('BreakpointPowerConsumption052', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      const base: number = m.getListenerCount();
      m.unregister();
      expect(m.getListenerCount()).assertEqual(base);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_BREAKPOINT_5300
     * @tc.name    BreakpointPowerConsumption053
     * @tc.desc    Breakpoint names follow xs/sm/md/lg order
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('BreakpointPowerConsumption053', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      const names: string[] = m.getBreakpointNames();
      expect(names[0]).assertEqual('xs');
      expect(names[3]).assertEqual('lg');
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_BREAKPOINT_5400
     * @tc.name    BreakpointPowerConsumption054
     * @tc.desc    Breakpoint definition table has four entries
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('BreakpointPowerConsumption054', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      expect(m.getDefinitions().length).assertEqual(4);
      expect(m.getDefinitions()[0].size).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_BREAKPOINT_5500
     * @tc.name    BreakpointPowerConsumption055
     * @tc.desc    Breakpoint history forms a linked from/to chain
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('BreakpointPowerConsumption055', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      m.clearHistory();
      m.applyWidth(0);
      m.applyWidth(500);
      m.applyWidth(700);
      const h = m.getHistory();
      for (let k = 1; k < h.length; k++) {
        expect(h[k].from).assertEqual(h[k - 1].to);
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_BREAKPOINT_5600
     * @tc.name    BreakpointPowerConsumption056
     * @tc.desc    Same-tier width changes raise no change event
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('BreakpointPowerConsumption056', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      m.clearHistory();
      m.applyWidth(700);
      const c0: number = m.getChangeCount();
      m.clearHistory();
      m.applyWidth(700);
      const c1: number = m.getChangeCount();
      expect(c1).assertEqual(0);
      expect(c0 >= 0).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_BREAKPOINT_5700
     * @tc.name    BreakpointPowerConsumption057
     * @tc.desc    SM breakpoint range is [320, 600)
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('BreakpointPowerConsumption057', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      const r: number[] = m.rangeOf('sm');
      expect(r[0]).assertEqual(320);
      expect(r[1]).assertEqual(600);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_BREAKPOINT_5800
     * @tc.name    BreakpointPowerConsumption058
     * @tc.desc    MD breakpoint range is [600, 840)
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('BreakpointPowerConsumption058', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      const r: number[] = m.rangeOf('md');
      expect(r[0]).assertEqual(600);
      expect(r[1]).assertEqual(840);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_BREAKPOINT_5900
     * @tc.name    BreakpointPowerConsumption059
     * @tc.desc    LG breakpoint range has open upper bound
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('BreakpointPowerConsumption059', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      const r: number[] = m.rangeOf('lg');
      expect(r[0]).assertEqual(840);
      expect(r[1]).assertEqual(Number.MAX_SAFE_INTEGER);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_BREAKPOINT_6000
     * @tc.name    BreakpointPowerConsumption060
     * @tc.desc    Unknown breakpoint returns negative range
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('BreakpointPowerConsumption060', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      const r: number[] = m.rangeOf('nope');
      expect(r[0]).assertEqual(-1);
      expect(r[1]).assertEqual(-1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_BREAKPOINT_6100
     * @tc.name    BreakpointPowerConsumption061
     * @tc.desc    Breakpoint thresholds are strictly ascending
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('BreakpointPowerConsumption061', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      expect(m.isThresholdAscending()).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_BREAKPOINT_6200
     * @tc.name    BreakpointPowerConsumption062
     * @tc.desc    Layout profiles grow monotonically with breakpoint
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('BreakpointPowerConsumption062', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      expect(m.isProfileMonotonic()).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_BREAKPOINT_6300
     * @tc.name    BreakpointPowerConsumption063
     * @tc.desc    XS profile uses 2 columns
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('BreakpointPowerConsumption063', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      expect(m.profileOf('xs').columns).assertEqual(2);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_BREAKPOINT_6400
     * @tc.name    BreakpointPowerConsumption064
     * @tc.desc    LG profile uses 12 columns
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('BreakpointPowerConsumption064', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      expect(m.profileOf('lg').columns).assertEqual(12);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_BREAKPOINT_6500
     * @tc.name    BreakpointPowerConsumption065
     * @tc.desc    Negative width clamps to zero
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('BreakpointPowerConsumption065', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      expect(m.clampWidth(-1)).assertEqual(0);
      expect(m.clampWidth(-999)).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_BREAKPOINT_6600
     * @tc.name    BreakpointPowerConsumption066
     * @tc.desc    Non-negative width is preserved by clamp
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('BreakpointPowerConsumption066', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      expect(m.clampWidth(0)).assertEqual(0);
      expect(m.clampWidth(1440)).assertEqual(1440);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_BREAKPOINT_6700
     * @tc.name    BreakpointPowerConsumption067
     * @tc.desc    Widths 500 and 599 share the same breakpoint
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('BreakpointPowerConsumption067', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      expect(m.isSameBreakpoint(500, 599)).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_BREAKPOINT_6800
     * @tc.name    BreakpointPowerConsumption068
     * @tc.desc    Widths 599 and 600 differ in breakpoint
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('BreakpointPowerConsumption068', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      expect(m.isSameBreakpoint(599, 600)).assertEqual(false);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_BREAKPOINT_6900
     * @tc.name    BreakpointPowerConsumption069
     * @tc.desc    LG column width is positive at 1000vp
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('BreakpointPowerConsumption069', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      expect(m.columnWidth(1000, 'lg') > 0).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_BREAKPOINT_7000
     * @tc.name    BreakpointPowerConsumption070
     * @tc.desc    Column width never becomes negative
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('BreakpointPowerConsumption070', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      expect(m.columnWidth(10, 'lg') >= 0).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_BREAKPOINT_7100
     * @tc.name    BreakpointPowerConsumption071
     * @tc.desc    Register and unregister calls stay balanced
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('BreakpointPowerConsumption071', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      m.register();
      m.register();
      m.unregister();
      m.unregister();
      expect(m.isListenerBalanced()).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_BREAKPOINT_7200
     * @tc.name    BreakpointPowerConsumption072
     * @tc.desc    Extra unregister never drives listener count negative
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('BreakpointPowerConsumption072', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      const base: number = m.getListenerCount();
      m.unregister();
      expect(m.getListenerCount()).assertEqual(base);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_BREAKPOINT_7300
     * @tc.name    BreakpointPowerConsumption073
     * @tc.desc    Breakpoint names follow xs/sm/md/lg order
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('BreakpointPowerConsumption073', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      const names: string[] = m.getBreakpointNames();
      expect(names[0]).assertEqual('xs');
      expect(names[3]).assertEqual('lg');
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_BREAKPOINT_7400
     * @tc.name    BreakpointPowerConsumption074
     * @tc.desc    Breakpoint definition table has four entries
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('BreakpointPowerConsumption074', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      expect(m.getDefinitions().length).assertEqual(4);
      expect(m.getDefinitions()[0].size).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

  });
}

