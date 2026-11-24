/*
 * Copyright (c) 2022-2023 Huawei Device Co., Ltd.
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

import { describe, it, expect, TestType, Size, Level } from '@ohos/hypium'
import { hilog } from '@kit.PerformanceAnalysisKit'
import {
  CanvasStubContext, runInitRound, asContext, StubCall
} from '../util/TestHelper'
import { initRound } from '../../../main/ets/feature/AirQualityFeature'
import { AirStub } from '../util/TestHelper'

const LOG_DOMAIN: number = 0xF811
const LOG_TAG: string = '[Sample_Weather]'

export default function canvasReal01Test() {
  describe('CanvasReal01', () => {

    /**
     * @tc.name   testCanvas0001
     * @tc.number SUB_WEATHER_CANVAS_0001
     * @tc.desc   Gauge paints exactly two arcs and one linear gradient
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('testCanvas0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCanvas0001 begin')
      const ctx = new CanvasStubContext()
      runInitRound(ctx, '28', '优')
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual arc=%{public}d grad=%{public}d', ctx.count('arc'), ctx.count('createLinearGradient'))
      expect(ctx.count('arc')).assertEqual(2)
      expect(ctx.count('createLinearGradient')).assertEqual(1)
      expect(ctx.count('stroke')).assertEqual(2)
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCanvas0001 end')
    })

    /**
     * @tc.name   testCanvas0002
     * @tc.number SUB_WEATHER_CANVAS_0002
     * @tc.desc   Background arc spans the frozen bottom opening angles
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('testCanvas0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCanvas0002 begin')
      const ctx = new CanvasStubContext()
      runInitRound(ctx, '28', '优')
      const bg = ctx.nthOf('arc', 0)
      const args = bg !== undefined ? bg.args : []
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual bg=%{public}s', JSON.stringify(args))
      expect(String(args[0])).assertEqual('150')
      expect(String(args[3])).assertEqual('0.9424777960769379')
      expect(String(args[4])).assertEqual('2.199114857512855')
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCanvas0002 end')
    })

    /**
     * @tc.name   testCanvas0003
     * @tc.number SUB_WEATHER_CANVAS_0003
     * @tc.desc   Gauge radius derives from canvas width minus ten
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('testCanvas0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCanvas0003 begin')
      const ctx = new CanvasStubContext()
      const snap = runInitRound(ctx, '28', '优')
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual snap=%{public}s', snap)
      expect(snap.startsWith('140|')).assertTrue()
      expect(ctx.count('arc')).assertEqual(2)
      expect(snap.includes('NaN')).assertFalse()
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCanvas0003 end')
    })

    /**
     * @tc.name   testCanvas0004
     * @tc.number SUB_WEATHER_CANVAS_0004
     * @tc.desc   Value 28 sweeps the gauge to the frozen end angle
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('testCanvas0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCanvas0004 begin')
      const ctx = new CanvasStubContext()
      const snap = runInitRound(ctx, '28', '优')
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual snap=%{public}s', snap)
      expect(snap).assertEqual('140|3.330088212805181|优,28,0,500')
      expect(snap.includes('3.330088212805181')).assertTrue()
      expect(ctx.texts()[1]).assertEqual('28')
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCanvas0004 end')
    })

    /**
     * @tc.name   testCanvas0005
     * @tc.number SUB_WEATHER_CANVAS_0005
     * @tc.desc   Value 0 keeps the gauge at the half-turn baseline
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('testCanvas0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCanvas0005 begin')
      const ctx = new CanvasStubContext()
      const snap = runInitRound(ctx, '0', '优')
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual snap=%{public}s', snap)
      expect(snap).assertEqual('140|1.5707963267948966|优,0,0,500')
      expect(snap.includes('1.5707963267948966')).assertTrue()
      expect(ctx.texts()[0]).assertEqual('优')
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCanvas0005 end')
    })

    /**
     * @tc.name   testCanvas0006
     * @tc.number SUB_WEATHER_CANVAS_0006
     * @tc.desc   Anchor: value 500 overshoots ten turns on the sweep angle
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testCanvas0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCanvas0006 begin')
      const ctx = new CanvasStubContext()
      const snap = runInitRound(ctx, '500', '严重污染')
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual snap=%{public}s', snap)
      expect(snap).assertEqual('140|32.98672286269283|严重污染,500,0,500')
      expect(snap.includes('32.98672286269283')).assertTrue()
      expect(ctx.texts().length).assertEqual(4)
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCanvas0006 end')
    })

    /**
     * @tc.name   testCanvas0007
     * @tc.number SUB_WEATHER_CANVAS_0007
     * @tc.desc   Mid scale value 250 lands on the frozen angle
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testCanvas0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCanvas0007 begin')
      const ctx = new CanvasStubContext()
      const snap = runInitRound(ctx, '250', '重度污染')
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual snap=%{public}s', snap)
      expect(snap.startsWith('140|17.27875959474386')).assertTrue()
      expect(snap.includes('重度污染,250')).assertTrue()
      expect(snap.endsWith('0,500')).assertTrue()
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCanvas0007 end')
    })

    /**
     * @tc.name   testCanvas0008
     * @tc.number SUB_WEATHER_CANVAS_0008
     * @tc.desc   Value 99 sweeps the frozen near-double-turn angle
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testCanvas0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCanvas0008 begin')
      const ctx = new CanvasStubContext()
      const snap = runInitRound(ctx, '99', '良')
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual snap=%{public}s', snap)
      expect(snap).assertEqual('140|7.791149780902687|良,99,0,500')
      expect(snap.includes('良,99')).assertTrue()
      expect(ctx.count('fillText')).assertEqual(4)
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCanvas0008 end')
    })

    /**
     * @tc.name   testCanvas0009
     * @tc.number SUB_WEATHER_CANVAS_0009
     * @tc.desc   Fractional value 0.5 adds a twentieth of a turn
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('testCanvas0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCanvas0009 begin')
      const ctx = new CanvasStubContext()
      const snap = runInitRound(ctx, '0.5', '优')
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual snap=%{public}s', snap)
      expect(snap).assertEqual('140|1.6022122533307945|优,0.5,0,500')
      expect(snap.includes('1.6022122533307945')).assertTrue()
      expect(ctx.texts()[1]).assertEqual('0.5')
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCanvas0009 end')
    })

    /**
     * @tc.name   testCanvas0010
     * @tc.number SUB_WEATHER_CANVAS_0010
     * @tc.desc   Anchor: non numeric quality produces a NaN end angle
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testCanvas0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCanvas0010 begin')
      const ctx = new CanvasStubContext()
      const snap = runInitRound(ctx, 'abc', '优')
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual snap=%{public}s', snap)
      expect(snap.includes('|NaN|')).assertTrue()
      expect(snap.startsWith('140|')).assertTrue()
      expect(snap.endsWith('优,abc,0,500')).assertTrue()
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCanvas0010 end')
    })

    /**
     * @tc.name   testCanvas0011
     * @tc.number SUB_WEATHER_CANVAS_0011
     * @tc.desc   Anchor: dash placeholder quality also collapses to NaN
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('testCanvas0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCanvas0011 begin')
      const ctx = new CanvasStubContext()
      const snap = runInitRound(ctx, '-', '-')
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual snap=%{public}s', snap)
      expect(snap.includes('NaN')).assertTrue()
      expect(snap.endsWith('-,-,0,500')).assertTrue()
      expect(ctx.count('arc')).assertEqual(2)
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCanvas0011 end')
    })

    /**
     * @tc.name   testCanvas0012
     * @tc.number SUB_WEATHER_CANVAS_0012
     * @tc.desc   Negative value drags the sweep angle below zero
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('testCanvas0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCanvas0012 begin')
      const ctx = new CanvasStubContext()
      const snap = runInitRound(ctx, '-28', '优')
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual snap=%{public}s', snap)
      expect(snap).assertEqual('140|-0.18849555921538774|优,-28,0,500')
      expect(snap.includes('-0.18849555921538774')).assertTrue()
      expect(snap.includes('NaN')).assertFalse()
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCanvas0012 end')
    })

    /**
     * @tc.name   testCanvas0013
     * @tc.number SUB_WEATHER_CANVAS_0013
     * @tc.desc   Scale boundary 100 doubles the sweep past the baseline
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testCanvas0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCanvas0013 begin')
      const ctx = new CanvasStubContext()
      const snap = runInitRound(ctx, '100', '良')
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual snap=%{public}s', snap)
      expect(snap).assertEqual('140|7.853981633974483|良,100,0,500')
      expect(snap.includes('7.853981633974483')).assertTrue()
      expect(ctx.texts().length).assertEqual(4)
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCanvas0013 end')
    })

    /**
     * @tc.name   testCanvas0014
     * @tc.number SUB_WEATHER_CANVAS_0014
     * @tc.desc   Scale labels 0 and 500 are drawn at frozen coordinates
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testCanvas0014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCanvas0014 begin')
      const ctx = new CanvasStubContext()
      runInitRound(ctx, '32', '优')
      const zero = ctx.nthOf('fillText', 2)
      const max = ctx.nthOf('fillText', 3)
      const zeroArgs = zero !== undefined ? zero.args : []
      const maxArgs = max !== undefined ? max.args : []
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual zero=%{public}s max=%{public}s', JSON.stringify(zeroArgs), JSON.stringify(maxArgs))
      expect(String(zeroArgs[0])).assertEqual('0')
      expect(String(zeroArgs[1])).assertEqual('120')
      expect(String(maxArgs[1])).assertEqual('175')
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCanvas0014 end')
    })

    /**
     * @tc.name   testCanvas0015
     * @tc.number SUB_WEATHER_CANVAS_0015
     * @tc.desc   Center texts sit on the frozen vertical offsets
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testCanvas0015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCanvas0015 begin')
      const ctx = new CanvasStubContext()
      runInitRound(ctx, '32', '优')
      const desc = ctx.nthOf('fillText', 0)
      const value = ctx.nthOf('fillText', 1)
      const descArgs = desc !== undefined ? desc.args : []
      const valueArgs = value !== undefined ? value.args : []
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual descY=%{public}s valueY=%{public}s', String(descArgs[2]), String(valueArgs[2]))
      expect(String(descArgs[2])).assertEqual('80')
      expect(String(valueArgs[2])).assertEqual('105')
      expect(String(descArgs[1])).assertEqual('150')
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCanvas0015 end')
    })

    /**
     * @tc.name   testCanvas0016
     * @tc.number SUB_WEATHER_CANVAS_0016
     * @tc.desc   Empty description still renders an empty center label
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('testCanvas0016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCanvas0016 begin')
      const ctx = new CanvasStubContext()
      const snap = runInitRound(ctx, '28', '')
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual snap=%{public}s', snap)
      expect(snap.endsWith('|,28,0,500')).assertTrue()
      expect(ctx.texts()[0]).assertEqual('')
      expect(ctx.count('fillText')).assertEqual(4)
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCanvas0016 end')
    })

    /**
     * @tc.name   testCanvas0017
     * @tc.number SUB_WEATHER_CANVAS_0017
     * @tc.desc   Save restore and path calls keep the paired drawing blocks
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testCanvas0017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCanvas0017 begin')
      const ctx = new CanvasStubContext()
      runInitRound(ctx, '28', '优')
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual save=%{public}d restore=%{public}d close=%{public}d',
        ctx.count('save'), ctx.count('restore'), ctx.count('closePath'))
      expect(ctx.count('save')).assertEqual(2)
      expect(ctx.count('restore')).assertEqual(2)
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s', String(ctx.count('closePath')))
      expect(ctx.count('closePath')).assertEqual(2)
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s', String(ctx.count('beginPath')))
      expect(ctx.count('beginPath')).assertEqual(2)
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCanvas0017 end')
    })

    /**
     * @tc.name   testCanvas0018
     * @tc.number SUB_WEATHER_CANVAS_0018
     * @tc.desc   Gradient stops carry the frozen palette trio
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('testCanvas0018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCanvas0018 begin')
      const ctx = new CanvasStubContext()
      const air: AirStub = { airQuality: '28', airDesc: '优' }
      initRound(asContext(ctx), air)
      const grad = ctx.lastGradient
      const stops = grad !== undefined ? grad.stops : []
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual stops=%{public}s', JSON.stringify(stops))
      expect(stops.length).assertEqual(3)
      expect(stops[0]).assertEqual('0|#AED34A')
      expect(stops[2]).assertEqual('1|#82CD61')
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s', String(String(stops[1]).startsWith('0.5')))
      expect(String(stops[1]).startsWith('0.5')).assertTrue()
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCanvas0018 end')
    })
  })
}
