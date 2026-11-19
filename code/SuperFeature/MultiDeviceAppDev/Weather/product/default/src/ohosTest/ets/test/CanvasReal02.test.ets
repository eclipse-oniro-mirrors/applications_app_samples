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
import { CanvasStubContext, runInitSun, runInitMoon } from '../util/TestHelper'

const LOG_DOMAIN: number = 0xF811
const LOG_TAG: string = '[Sample_Weather]'

export default function canvasReal02Test() {
  describe('CanvasReal02', () => {

    /**
     * @tc.name   testCanvas0019
     * @tc.number SUB_WEATHER_CANVAS_0019
     * @tc.desc   Sun chart baseline sits fifty-four pixels above the bottom
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('testCanvas0019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCanvas0019 begin')
      const ctx = new CanvasStubContext()
      const snap = runInitSun(ctx)
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual snap=%{public}s', snap)
      expect(snap.startsWith('146|300|120|')).assertTrue()
      expect(ctx.count('moveTo')).assertEqual(1)
      expect(ctx.count('lineTo')).assertEqual(1)
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCanvas0019 end')
    })

    /**
     * @tc.name   testCanvas0020
     * @tc.number SUB_WEATHER_CANVAS_0020
     * @tc.desc   Sun chart draws the frozen rise and set captions
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('testCanvas0020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCanvas0020 begin')
      const ctx = new CanvasStubContext()
      const snap = runInitSun(ctx)
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual snap=%{public}s', snap)
      expect(snap.endsWith('日出 早上6:00,日落 傍晚5:32')).assertTrue()
      expect(ctx.texts()[0]).assertEqual('日出 早上6:00')
      expect(ctx.texts()[1]).assertEqual('日落 傍晚5:32')
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s', String(ctx.texts().length))
      expect(ctx.texts().length).assertEqual(2)
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCanvas0020 end')
    })

    /**
     * @tc.name   testCanvas0021
     * @tc.number SUB_WEATHER_CANVAS_0021
     * @tc.desc   Sun arc uses forty percent of the canvas width as radius
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('testCanvas0021', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCanvas0021 begin')
      const ctx = new CanvasStubContext()
      runInitSun(ctx)
      const arc = ctx.lastOf('arc')
      const args = arc !== undefined ? arc.args : []
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual arc=%{public}s', JSON.stringify(args))
      expect(String(args[2])).assertEqual('120')
      expect(String(args[0])).assertEqual('150')
      expect(String(args[1])).assertEqual('175')
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCanvas0021 end')
    })

    /**
     * @tc.name   testCanvas0022
     * @tc.number SUB_WEATHER_CANVAS_0022
     * @tc.desc   Sun arc angles follow the frozen 193 and 346 degree endpoints
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testCanvas0022', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCanvas0022 begin')
      const ctx = new CanvasStubContext()
      runInitSun(ctx)
      const arc = ctx.lastOf('arc')
      const args = arc !== undefined ? arc.args : []
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual start=%{public}s end=%{public}s', String(args[3]), String(args[4]))
      expect(String(args[3])).assertEqual('3.368485456349056')
      expect(String(args[4])).assertEqual('6.03883921190038')
      expect(String(args[5])).assertEqual('false')
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCanvas0022 end')
    })

    /**
     * @tc.name   testCanvas0023
     * @tc.number SUB_WEATHER_CANVAS_0023
     * @tc.desc   Sun path is stroked with a dashed eight pixel pattern
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testCanvas0023', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCanvas0023 begin')
      const ctx = new CanvasStubContext()
      runInitSun(ctx)
      const dash = ctx.nthOf('setLineDash', 1)
      const dashArgs = dash !== undefined ? dash.args : []
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual dash=%{public}s count=%{public}d', String(dashArgs[0]), ctx.count('setLineDash'))
      expect(ctx.count('setLineDash')).assertEqual(2)
      expect(String(dashArgs[0])).assertEqual('8')
      expect(ctx.count('stroke') >= 1).assertTrue()
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCanvas0023 end')
    })

    /**
     * @tc.name   testCanvas0024
     * @tc.number SUB_WEATHER_CANVAS_0024
     * @tc.desc   Doubling canvas width doubles the sun arc radius
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testCanvas0024', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCanvas0024 begin')
      const ctx = new CanvasStubContext()
      ctx.width = 600
      const snap = runInitSun(ctx)
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual snap=%{public}s', snap)
      expect(snap.startsWith('146|600|240|')).assertTrue()
      expect(snap.includes('|240|')).assertTrue()
      expect(ctx.texts().length).assertEqual(2)
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCanvas0024 end')
    })

    /**
     * @tc.name   testCanvas0025
     * @tc.number SUB_WEATHER_CANVAS_0025
     * @tc.desc   Short canvas moves the baseline up by the frozen offset
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testCanvas0025', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCanvas0025 begin')
      const ctx = new CanvasStubContext()
      ctx.height = 100
      const snap = runInitSun(ctx)
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual snap=%{public}s', snap)
      expect(snap.startsWith('46|300|')).assertTrue()
      expect(snap.includes('120')).assertTrue()
      expect(snap.endsWith('日出 早上6:00,日落 傍晚5:32')).assertTrue()
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCanvas0025 end')
    })

    /**
     * @tc.name   testCanvas0026
     * @tc.number SUB_WEATHER_CANVAS_0026
     * @tc.desc   Gradient in sun chart spans the whole canvas box
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('testCanvas0026', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCanvas0026 begin')
      const ctx = new CanvasStubContext()
      runInitSun(ctx)
      const grad = ctx.nthOf('createLinearGradient', 0)
      const args = grad !== undefined ? grad.args : []
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual grad=%{public}s', JSON.stringify(args))
      expect(String(args[0])).assertEqual('0')
      expect(String(args[2])).assertEqual('300')
      expect(String(args[3])).assertEqual('200')
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCanvas0026 end')
    })

    /**
     * @tc.name   testCanvas0027
     * @tc.number SUB_WEATHER_CANVAS_0027
     * @tc.desc   Sun captions are painted near the chart bottom
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('testCanvas0027', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCanvas0027 begin')
      const ctx = new CanvasStubContext()
      runInitSun(ctx)
      const first = ctx.nthOf('fillText', 0)
      const second = ctx.nthOf('fillText', 1)
      const firstArgs = first !== undefined ? first.args : []
      const secondArgs = second !== undefined ? second.args : []
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual y1=%{public}s y2=%{public}s', String(firstArgs[2]), String(secondArgs[2]))
      expect(String(firstArgs[1])).assertEqual('50')
      expect(String(secondArgs[1])).assertEqual('250')
      expect(String(firstArgs[2])).assertEqual('160')
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCanvas0027 end')
    })

    /**
     * @tc.name   testCanvas0028
     * @tc.number SUB_WEATHER_CANVAS_0028
     * @tc.desc   Save restore pair wraps the sun arc stroke block
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('testCanvas0028', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCanvas0028 begin')
      const ctx = new CanvasStubContext()
      runInitSun(ctx)
      const hour = new Date().getHours()
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual save=%{public}d hour=%{public}d', ctx.count('save'), hour)
      expect(ctx.count('save') >= 1).assertTrue()
      expect(ctx.count('restore') >= 1).assertTrue()
      expect(ctx.count('beginPath') >= 1).assertTrue()
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s', String(hour >= 0 && hour <= 23))
      expect(hour >= 0 && hour <= 23).assertTrue()
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCanvas0028 end')
    })

    /**
     * @tc.name   testCanvas0029
     * @tc.number SUB_WEATHER_CANVAS_0029
     * @tc.desc   Moon chart arc radius is thirty percent of canvas width
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('testCanvas0029', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCanvas0029 begin')
      const ctx = new CanvasStubContext()
      const snap = runInitMoon(ctx)
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual snap=%{public}s', snap)
      expect(snap.startsWith('90|')).assertTrue()
      expect(ctx.count('arc')).assertEqual(1)
      expect(snap.includes('NaN')).assertFalse()
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCanvas0029 end')
    })

    /**
     * @tc.name   testCanvas0030
     * @tc.number SUB_WEATHER_CANVAS_0030
     * @tc.desc   Moon chart paints the frozen three captions
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('testCanvas0030', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCanvas0030 begin')
      const ctx = new CanvasStubContext()
      const snap = runInitMoon(ctx)
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual snap=%{public}s', snap)
      expect(snap).assertEqual('90|月出 傍晚5:12,上弦月,月落 早上6:20')
      expect(ctx.texts().length).assertEqual(3)
      expect(ctx.texts()[1]).assertEqual('上弦月')
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCanvas0030 end')
    })

    /**
     * @tc.name   testCanvas0031
     * @tc.number SUB_WEATHER_CANVAS_0031
     * @tc.desc   Moon arc follows the frozen 197 and 342 degree geometry
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testCanvas0031', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCanvas0031 begin')
      const ctx = new CanvasStubContext()
      runInitMoon(ctx)
      const arc = ctx.lastOf('arc')
      const args = arc !== undefined ? arc.args : []
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual start=%{public}s end=%{public}s', String(args[3]), String(args[4]))
      expect(String(args[3])).assertEqual('3.4382986264288293')
      expect(String(args[4])).assertEqual('5.969026041820607')
      expect(String(args[2])).assertEqual('90')
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCanvas0031 end')
    })

    /**
     * @tc.name   testCanvas0032
     * @tc.number SUB_WEATHER_CANVAS_0032
     * @tc.desc   Moon icon is drawn once at the top of the chart
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testCanvas0032', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCanvas0032 begin')
      const ctx = new CanvasStubContext()
      runInitMoon(ctx)
      const img = ctx.nthOf('drawImage', 0)
      const args = img !== undefined ? img.args : []
      const hour = new Date().getHours()
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual draws=%{public}d hour=%{public}d', ctx.count('drawImage'), hour)
      expect(ctx.count('drawImage') >= 1).assertTrue()
      expect(String(args[5])).assertEqual('145')
      expect(String(args[7])).assertEqual('24')
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s', String(ctx.count('setLineDash')))
      expect(ctx.count('setLineDash')).assertEqual(1)
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCanvas0032 end')
    })

    /**
     * @tc.name   testCanvas0033
     * @tc.number SUB_WEATHER_CANVAS_0033
     * @tc.desc   Doubling canvas width scales the moon arc radius
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testCanvas0033', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCanvas0033 begin')
      const ctx = new CanvasStubContext()
      ctx.width = 600
      const snap = runInitMoon(ctx)
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual snap=%{public}s', snap)
      expect(snap.startsWith('180|')).assertTrue()
      expect(snap.includes('月出 傍晚5:12')).assertTrue()
      expect(ctx.count('arc')).assertEqual(1)
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCanvas0033 end')
    })

    /**
     * @tc.name   testCanvas0034
     * @tc.number SUB_WEATHER_CANVAS_0034
     * @tc.desc   Moon captions share one baseline twenty pixels from bottom
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('testCanvas0034', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCanvas0034 begin')
      const ctx = new CanvasStubContext()
      runInitMoon(ctx)
      const a = ctx.nthOf('fillText', 0)
      const b = ctx.nthOf('fillText', 2)
      const argsA = a !== undefined ? a.args : []
      const argsB = b !== undefined ? b.args : []
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual yA=%{public}s yB=%{public}s', String(argsA[2]), String(argsB[2]))
      expect(String(argsA[2])).assertEqual('180')
      expect(String(argsB[2])).assertEqual('180')
      expect(String(argsA[1])).assertEqual('50')
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCanvas0034 end')
    })

    /**
     * @tc.name   testCanvas0035
     * @tc.number SUB_WEATHER_CANVAS_0035
     * @tc.desc   Moon chart opens and closes one gradient pass
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('testCanvas0035', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCanvas0035 begin')
      const ctx = new CanvasStubContext()
      runInitMoon(ctx)
      const grad = ctx.nthOf('createLinearGradient', 0)
      const args = grad !== undefined ? grad.args : []
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual grad=%{public}s', JSON.stringify(args))
      expect(ctx.count('createLinearGradient')).assertEqual(1)
      expect(String(args[1])).assertEqual('0')
      expect(String(args[3])).assertEqual('200')
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s', String(ctx.count('stroke') >= 1))
      expect(ctx.count('stroke') >= 1).assertTrue()
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCanvas0035 end')
    })
  })
}
