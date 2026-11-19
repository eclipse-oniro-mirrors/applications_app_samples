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
import { MyDataSource, City } from '@ohos/common'

const LOG_DOMAIN: number = 0xF811
const LOG_TAG: string = '[Sample_Weather]'

export default function dsReal02Test() {
  describe('DsReal02', () => {

    /**
     * @tc.name   testDs0021
     * @tc.number SUB_WEATHER_DS_0021
     * @tc.desc   Three consecutive pushes grow the source in order
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('testDs0021', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDs0021 begin')
      const empty: string[] = []
      const ds = new MyDataSource<string>(empty)
      ds.pushData('p1')
      ds.pushData('p2')
      ds.pushData('p3')
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}d|%{public}s', ds.totalCount(), String(ds.getData(2)))
      expect(ds.totalCount()).assertEqual(3)
      expect(ds.getData(0)).assertEqual('p1')
      expect(ds.getData(2)).assertEqual('p3')
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDs0021 end')
    })

    /**
     * @tc.name   testDs0022
     * @tc.number SUB_WEATHER_DS_0022
     * @tc.desc   Repeated head insertion reverses the arrival order
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('testDs0022', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDs0022 begin')
      const empty: string[] = []
      const ds = new MyDataSource<string>(empty)
      ds.addData(0, 'a')
      ds.addData(0, 'b')
      ds.addData(0, 'c')
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s|%{public}s|%{public}s',
        String(ds.getData(0)), String(ds.getData(1)), String(ds.getData(2)))
      expect(ds.getData(0)).assertEqual('c')
      expect(ds.getData(1)).assertEqual('b')
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s', String(ds.getData(2)))
      expect(ds.getData(2)).assertEqual('a')
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDs0022 end')
    })

    /**
     * @tc.name   testDs0023
     * @tc.number SUB_WEATHER_DS_0023
     * @tc.desc   Mixed insert and push operations keep a coherent snapshot
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testDs0023', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDs0023 begin')
      const src: string[] = ['mid']
      const ds = new MyDataSource<string>(src)
      ds.addData(0, 'head')
      ds.pushData('tail')
      ds.addData(1, 'core')
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual count=%{public}d', ds.totalCount())
      expect(ds.totalCount()).assertEqual(4)
      expect(ds.getData(0)).assertEqual('head')
      expect(ds.getData(1)).assertEqual('core')
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s', String(ds.getData(3)))
      expect(ds.getData(3)).assertEqual('tail')
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDs0023 end')
    })

    /**
     * @tc.name   testDs0024
     * @tc.number SUB_WEATHER_DS_0024
     * @tc.desc   Anchor: repeated far-out-of-range inserts append sequentially
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('testDs0024', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDs0024 begin')
      const src: string[] = ['base']
      const ds = new MyDataSource<string>(src)
      ds.addData(100, 'far1')
      ds.addData(100, 'far2')
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}d last=%{public}s', ds.totalCount(), String(ds.getData(2)))
      expect(ds.totalCount()).assertEqual(3)
      expect(ds.getData(1)).assertEqual('far1')
      expect(ds.getData(2)).assertEqual('far2')
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDs0024 end')
    })

    /**
     * @tc.name   testDs0025
     * @tc.number SUB_WEATHER_DS_0025
     * @tc.desc   After collapsing to empty via setData new pushes start fresh
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testDs0025', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDs0025 begin')
      const src: string[] = ['x', 'y', 'z']
      const ds = new MyDataSource<string>(src)
      const empty: string[] = []
      ds.setData(empty)
      ds.pushData('fresh')
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}d|%{public}s', ds.totalCount(), String(ds.getData(0)))
      expect(ds.totalCount()).assertEqual(1)
      expect(ds.getData(0)).assertEqual('fresh')
      expect(ds.getData(1)).assertUndefined()
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDs0025 end')
    })

    /**
     * @tc.name   testDs0026
     * @tc.number SUB_WEATHER_DS_0026
     * @tc.desc   addData at current length behaves like a push
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testDs0026', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDs0026 begin')
      const src: string[] = ['one', 'two']
      const ds = new MyDataSource<string>(src)
      ds.addData(ds.totalCount(), 'three')
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s', String(ds.getData(2)))
      expect(ds.getData(2)).assertEqual('three')
      expect(ds.totalCount()).assertEqual(3)
      expect(ds.getData(0)).assertEqual('one')
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDs0026 end')
    })

    /**
     * @tc.name   testDs0027
     * @tc.number SUB_WEATHER_DS_0027
     * @tc.desc   Five-step mixed operation ends with a frozen snapshot
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testDs0027', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDs0027 begin')
      const src: string[] = ['s0']
      const ds = new MyDataSource<string>(src)
      ds.pushData('s1')
      ds.addData(0, 's2')
      const rep: string[] = ['s3', 's4']
      ds.setData(rep)
      ds.addData(1, 's5')
      ds.pushData('s6')
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual count=%{public}d', ds.totalCount())
      expect(ds.totalCount()).assertEqual(4)
      expect(ds.getData(0)).assertEqual('s3')
      expect(ds.getData(1)).assertEqual('s5')
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s', String(ds.getData(3)))
      expect(ds.getData(3)).assertEqual('s6')
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDs0027 end')
    })

    /**
     * @tc.name   testDs0028
     * @tc.number SUB_WEATHER_DS_0028
     * @tc.desc   Object-typed source drives City payloads
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testDs0028', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDs0028 begin')
      const arr: City[] = [new City('北京', '32', '晴')]
      const ds = new MyDataSource<City>(arr)
      ds.pushData(new City('上海', '28', '阴'))
      ds.addData(0, new City('广州', '35', '小雨'))
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s|%{public}s', ds.getData(0).name, ds.getData(2).name)
      expect(ds.totalCount()).assertEqual(3)
      expect(ds.getData(0).name).assertEqual('广州')
      expect(ds.getData(1).name).assertEqual('北京')
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s', String(ds.getData(2).weather))
      expect(ds.getData(2).weather).assertEqual('阴')
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDs0028 end')
    })

    /**
     * @tc.name   testDs0029
     * @tc.number SUB_WEATHER_DS_0029
     * @tc.desc   Out-of-range reads never mutate the stored state
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testDs0029', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDs0029 begin')
      const src: string[] = ['a', 'b']
      const ds = new MyDataSource<string>(src)
      const miss1 = ds.getData(7)
      const miss2 = ds.getData(-3)
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual m1=%{public}s m2=%{public}s', String(miss1), String(miss2))
      expect(miss1).assertUndefined()
      expect(miss2).assertUndefined()
      expect(ds.totalCount()).assertEqual(2)
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s', String(ds.getData(1)))
      expect(ds.getData(1)).assertEqual('b')
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDs0029 end')
    })

    /**
     * @tc.name   testDs0030
     * @tc.number SUB_WEATHER_DS_0030
     * @tc.desc   Successive setData calls leave only the last array
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testDs0030', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDs0030 begin')
      const src: string[] = ['first']
      const ds = new MyDataSource<string>(src)
      const second: string[] = ['s1', 's2', 's3']
      const third: string[] = ['t1']
      ds.setData(second)
      ds.setData(third)
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}d', ds.totalCount())
      expect(ds.totalCount()).assertEqual(1)
      expect(ds.getData(0)).assertEqual('t1')
      expect(ds.getData(2)).assertUndefined()
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDs0030 end')
    })

    /**
     * @tc.name   testDs0031
     * @tc.number SUB_WEATHER_DS_0031
     * @tc.desc   Valid reads still succeed after undefined probes
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('testDs0031', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDs0031 begin')
      const src: string[] = ['alive']
      const ds = new MyDataSource<string>(src)
      const probe = ds.getData(999)
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual probe=%{public}s live=%{public}s', String(probe), String(ds.getData(0)))
      expect(probe).assertUndefined()
      expect(ds.getData(0)).assertEqual('alive')
      expect(ds.totalCount()).assertEqual(1)
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDs0031 end')
    })

    /**
     * @tc.name   testDs0032
     * @tc.number SUB_WEATHER_DS_0032
     * @tc.desc   Ten pushes onto an empty source count exactly ten
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testDs0032', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDs0032 begin')
      const empty: string[] = []
      const ds = new MyDataSource<string>(empty)
      for (let i = 0; i < 10; i++) {
        ds.pushData(`k${i}`)
      }
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}d last=%{public}s', ds.totalCount(), String(ds.getData(9)))
      expect(ds.totalCount()).assertEqual(10)
      expect(ds.getData(0)).assertEqual('k0')
      expect(ds.getData(9)).assertEqual('k9')
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDs0032 end')
    })

    /**
     * @tc.name   testDs0033
     * @tc.number SUB_WEATHER_DS_0033
     * @tc.desc   Sequential middle insertions stack to the left of the cursor
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('testDs0033', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDs0033 begin')
      const src: string[] = ['A', 'Z']
      const ds = new MyDataSource<string>(src)
      ds.addData(1, 'X')
      ds.addData(1, 'Y')
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s|%{public}s|%{public}s',
        String(ds.getData(1)), String(ds.getData(2)), String(ds.getData(3)))
      expect(ds.getData(1)).assertEqual('Y')
      expect(ds.getData(2)).assertEqual('X')
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s', String(ds.getData(3)))
      expect(ds.getData(3)).assertEqual('Z')
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s', String(ds.totalCount()))
      expect(ds.totalCount()).assertEqual(4)
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDs0033 end')
    })

    /**
     * @tc.name   testDs0034
     * @tc.number SUB_WEATHER_DS_0034
     * @tc.desc   Head element survives all later mutations of the source
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testDs0034', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDs0034 begin')
      const src: string[] = ['head']
      const ds = new MyDataSource<string>(src)
      ds.pushData('two')
      ds.pushData('three')
      ds.addData(2, 'inserted')
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual head=%{public}s tail=%{public}s', String(ds.getData(0)), String(ds.getData(3)))
      expect(ds.getData(0)).assertEqual('head')
      expect(ds.getData(3)).assertEqual('three')
      expect(ds.getData(2)).assertEqual('inserted')
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s', String(ds.totalCount()))
      expect(ds.totalCount()).assertEqual(4)
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDs0034 end')
    })

    /**
     * @tc.name   testDs0035
     * @tc.number SUB_WEATHER_DS_0035
     * @tc.desc   Twenty-element source exposes correct head and tail reads
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testDs0035', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDs0035 begin')
      const src: string[] = []
      for (let i = 0; i < 20; i++) {
        src.push(`e${i}`)
      }
      const ds = new MyDataSource<string>(src)
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}d head=%{public}s tail=%{public}s',
        ds.totalCount(), String(ds.getData(0)), String(ds.getData(19)))
      expect(ds.totalCount()).assertEqual(20)
      expect(ds.getData(0)).assertEqual('e0')
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s', String(ds.getData(19)))
      expect(ds.getData(19)).assertEqual('e19')
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s', String(ds.getData(20)))
      expect(ds.getData(20)).assertUndefined()
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDs0035 end')
    })

    /**
     * @tc.name   testDs0036
     * @tc.number SUB_WEATHER_DS_0036
     * @tc.desc   Duplicated values are stored as independent entries
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('testDs0036', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDs0036 begin')
      const src: string[] = ['dup']
      const ds = new MyDataSource<string>(src)
      ds.pushData('dup')
      ds.pushData('dup')
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual count=%{public}d', ds.totalCount())
      expect(ds.totalCount()).assertEqual(3)
      expect(ds.getData(0)).assertEqual(ds.getData(1))
      expect(ds.getData(2)).assertEqual('dup')
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDs0036 end')
    })

    /**
     * @tc.name   testDs0037
     * @tc.number SUB_WEATHER_DS_0037
     * @tc.desc   Head insertion into an empty source mirrors push semantics
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testDs0037', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDs0037 begin')
      const empty: string[] = []
      const ds = new MyDataSource<string>(empty)
      ds.addData(0, 'solo')
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s count=%{public}d', String(ds.getData(0)), ds.totalCount())
      expect(ds.getData(0)).assertEqual('solo')
      expect(ds.totalCount()).assertEqual(1)
      expect(ds.getData(1)).assertUndefined()
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDs0037 end')
    })

    /**
     * @tc.name   testDs0038
     * @tc.number SUB_WEATHER_DS_0038
     * @tc.desc   Pushes after a negative-index insert append behind it
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('testDs0038', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDs0038 begin')
      const src: string[] = ['a', 'b', 'c']
      const ds = new MyDataSource<string>(src)
      ds.addData(-2, 'x')
      ds.pushData('d')
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s|%{public}s', String(ds.getData(1)), String(ds.getData(4)))
      expect(ds.getData(1)).assertEqual('x')
      expect(ds.getData(2)).assertEqual('b')
      expect(ds.getData(4)).assertEqual('d')
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s', String(ds.totalCount()))
      expect(ds.totalCount()).assertEqual(5)
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDs0038 end')
    })

    /**
     * @tc.name   testDs0039
     * @tc.number SUB_WEATHER_DS_0039
     * @tc.desc   Two sources over separate arrays evolve independently
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testDs0039', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDs0039 begin')
      const s1: string[] = ['a']
      const s2: string[] = ['b']
      const d1 = new MyDataSource<string>(s1)
      const d2 = new MyDataSource<string>(s2)
      d1.pushData('c')
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual d1=%{public}d d2=%{public}d', d1.totalCount(), d2.totalCount())
      expect(d1.totalCount()).assertEqual(2)
      expect(d2.totalCount()).assertEqual(1)
      expect(d2.getData(0)).assertEqual('b')
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s', String(d2.getData(1)))
      expect(d2.getData(1)).assertUndefined()
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDs0039 end')
    })

    /**
     * @tc.name   testDs0040
     * @tc.number SUB_WEATHER_DS_0040
     * @tc.desc   Anchor: the source holds the caller array by reference
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('testDs0040', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDs0040 begin')
      const src: string[] = ['ref']
      const ds = new MyDataSource<string>(src)
      src.push('direct')
      ds.pushData('viaSource')
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual count=%{public}d len=%{public}d', ds.totalCount(), src.length)
      expect(ds.totalCount()).assertEqual(3)
      expect(src.length).assertEqual(3)
      expect(ds.getData(1)).assertEqual('direct')
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s', String(ds.getData(2)))
      expect(ds.getData(2)).assertEqual('viaSource')
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDs0040 end')
    })
  })
}
