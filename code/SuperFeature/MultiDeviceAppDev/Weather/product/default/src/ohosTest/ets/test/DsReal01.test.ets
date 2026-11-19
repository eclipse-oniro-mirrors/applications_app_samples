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

class DsRecorder {
  public notified: number = -1

  onDataReloaded(): void {
  }

  onDataAdd(index: number): void {
    this.notified = index
  }

  onDataChange(index: number): void {
  }

  onDataDelete(index: number): void {
  }

  onDataMove(from: number, to: number): void {
  }
}

export default function dsReal01Test() {
  describe('DsReal01', () => {

    /**
     * @tc.name   testDs0001
     * @tc.number SUB_WEATHER_DS_0001
     * @tc.desc   Empty source reports zero total count
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('testDs0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDs0001 begin')
      const empty: string[] = []
      const ds = new MyDataSource<string>(empty)
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}d expected=%{public}d', ds.totalCount(), 0)
      expect(ds.totalCount()).assertEqual(0)
      expect(ds.totalCount() === 0).assertTrue()
      expect(ds instanceof MyDataSource).assertTrue()
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDs0001 end')
    })

    /**
     * @tc.name   testDs0002
     * @tc.number SUB_WEATHER_DS_0002
     * @tc.desc   Single element source reads back the stored item
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('testDs0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDs0002 begin')
      const src: string[] = ['only']
      const ds = new MyDataSource<string>(src)
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s', String(ds.getData(0)))
      expect(ds.totalCount()).assertEqual(1)
      expect(ds.getData(0)).assertEqual('only')
      expect(ds.getData(0) === 'only').assertTrue()
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDs0002 end')
    })

    /**
     * @tc.name   testDs0003
     * @tc.number SUB_WEATHER_DS_0003
     * @tc.desc   Multi element source preserves order
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('testDs0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDs0003 begin')
      const src: string[] = ['a', 'b', 'c']
      const ds = new MyDataSource<string>(src)
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s|%{public}s|%{public}s',
        String(ds.getData(0)), String(ds.getData(1)), String(ds.getData(2)))
      expect(ds.getData(0)).assertEqual('a')
      expect(ds.getData(1)).assertEqual('b')
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s', String(ds.getData(2)))
      expect(ds.getData(2)).assertEqual('c')
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDs0003 end')
    })

    /**
     * @tc.name   testDs0004
     * @tc.number SUB_WEATHER_DS_0004
     * @tc.desc   Out-of-range index resolves to undefined
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('testDs0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDs0004 begin')
      const src: string[] = ['x']
      const ds = new MyDataSource<string>(src)
      const oob = ds.getData(5)
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual oob=%{public}s', String(oob))
      expect(oob).assertUndefined()
      expect(ds.totalCount()).assertEqual(1)
      expect(String(oob)).assertEqual('undefined')
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDs0004 end')
    })

    /**
     * @tc.name   testDs0005
     * @tc.number SUB_WEATHER_DS_0005
     * @tc.desc   Negative index resolves to undefined
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testDs0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDs0005 begin')
      const src: string[] = ['p', 'q']
      const ds = new MyDataSource<string>(src)
      const neg = ds.getData(-1)
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual neg=%{public}s', String(neg))
      expect(neg).assertUndefined()
      expect(ds.getData(1)).assertEqual('q')
      expect(ds.totalCount()).assertEqual(2)
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDs0005 end')
    })

    /**
     * @tc.name   testDs0006
     * @tc.number SUB_WEATHER_DS_0006
     * @tc.desc   setData replaces the whole backing array
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('testDs0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDs0006 begin')
      const src: string[] = ['old1', 'old2']
      const ds = new MyDataSource<string>(src)
      const next: string[] = ['new1']
      ds.setData(next)
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}d|%{public}s', ds.totalCount(), String(ds.getData(0)))
      expect(ds.totalCount()).assertEqual(1)
      expect(ds.getData(0)).assertEqual('new1')
      expect(ds.getData(1)).assertUndefined()
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDs0006 end')
    })

    /**
     * @tc.name   testDs0007
     * @tc.number SUB_WEATHER_DS_0007
     * @tc.desc   setData accepts an empty array collapsing the source
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testDs0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDs0007 begin')
      const src: string[] = ['a', 'b', 'c']
      const ds = new MyDataSource<string>(src)
      const empty: string[] = []
      ds.setData(empty)
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}d', ds.totalCount())
      expect(ds.totalCount()).assertEqual(0)
      expect(ds.getData(0)).assertUndefined()
      expect(ds.getData(2)).assertUndefined()
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDs0007 end')
    })

    /**
     * @tc.name   testDs0008
     * @tc.number SUB_WEATHER_DS_0008
     * @tc.desc   Source keeps object element identity for model classes
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testDs0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDs0008 begin')
      const c1 = new City('北京', '32', '晴')
      const c2 = new City('上海', '28', '阴')
      const arr: City[] = [c1, c2]
      const ds = new MyDataSource<City>(arr)
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s', ds.getData(1).name)
      expect(ds.getData(0) === c1).assertTrue()
      expect(ds.getData(1).name).assertEqual('上海')
      expect(ds.totalCount()).assertEqual(2)
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDs0008 end')
    })

    /**
     * @tc.name   testDs0009
     * @tc.number SUB_WEATHER_DS_0009
     * @tc.desc   Ten element source reads every index correctly
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('testDs0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDs0009 begin')
      const src: string[] = ['v0', 'v1', 'v2', 'v3', 'v4', 'v5', 'v6', 'v7', 'v8', 'v9']
      const ds = new MyDataSource<string>(src)
      let allOk = true
      for (let i = 0; i < 10; i++) {
        if (ds.getData(i) !== `v${i}`) {
          allOk = false
        }
      }
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual allOk=%{public}s', String(allOk))
      expect(allOk).assertTrue()
      expect(ds.totalCount()).assertEqual(10)
      expect(ds.getData(9)).assertEqual('v9')
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDs0009 end')
    })

    /**
     * @tc.name   testDs0010
     * @tc.number SUB_WEATHER_DS_0010
     * @tc.desc   Two sources built from one array reflect shared mutation
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('testDs0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDs0010 begin')
      const src: string[] = ['shared']
      const ds1 = new MyDataSource<string>(src)
      const ds2 = new MyDataSource<string>(src)
      src.push('extra')
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual ds1=%{public}d ds2=%{public}d', ds1.totalCount(), ds2.totalCount())
      expect(ds1.totalCount()).assertEqual(2)
      expect(ds2.totalCount()).assertEqual(2)
      expect(ds1.getData(1)).assertEqual('extra')
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDs0010 end')
    })

    /**
     * @tc.name   testDs0011
     * @tc.number SUB_WEATHER_DS_0011
     * @tc.desc   Empty source push grows the count to one
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('testDs0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDs0011 begin')
      const empty: string[] = []
      const ds = new MyDataSource<string>(empty)
      ds.pushData('first')
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}d|%{public}s', ds.totalCount(), String(ds.getData(0)))
      expect(ds.totalCount()).assertEqual(1)
      expect(ds.getData(0)).assertEqual('first')
      expect(ds.getData(1)).assertUndefined()
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDs0011 end')
    })

    /**
     * @tc.name   testDs0012
     * @tc.number SUB_WEATHER_DS_0012
     * @tc.desc   pushData appends after the last element without reordering
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('testDs0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDs0012 begin')
      const src: string[] = ['a', 'b']
      const ds = new MyDataSource<string>(src)
      ds.pushData('c')
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s', String(ds.getData(2)))
      expect(ds.getData(0)).assertEqual('a')
      expect(ds.getData(1)).assertEqual('b')
      expect(ds.getData(2)).assertEqual('c')
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDs0012 end')
    })

    /**
     * @tc.name   testDs0013
     * @tc.number SUB_WEATHER_DS_0013
     * @tc.desc   addData at index zero shifts the head element
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('testDs0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDs0013 begin')
      const src: string[] = ['b', 'c']
      const ds = new MyDataSource<string>(src)
      ds.addData(0, 'a')
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s|%{public}s', String(ds.getData(0)), String(ds.getData(1)))
      expect(ds.getData(0)).assertEqual('a')
      expect(ds.getData(1)).assertEqual('b')
      expect(ds.totalCount()).assertEqual(3)
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDs0013 end')
    })

    /**
     * @tc.name   testDs0014
     * @tc.number SUB_WEATHER_DS_0014
     * @tc.desc   addData at the middle index inserts precisely there
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('testDs0014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDs0014 begin')
      const src: string[] = ['a', 'c']
      const ds = new MyDataSource<string>(src)
      ds.addData(1, 'b')
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s', String(ds.getData(1)))
      expect(ds.getData(1)).assertEqual('b')
      expect(ds.getData(2)).assertEqual('c')
      expect(ds.totalCount()).assertEqual(3)
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDs0014 end')
    })

    /**
     * @tc.name   testDs0015
     * @tc.number SUB_WEATHER_DS_0015
     * @tc.desc   Anchor: addData beyond length appends like splice tail insertion
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testDs0015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDs0015 begin')
      const src: string[] = ['a']
      const ds = new MyDataSource<string>(src)
      ds.addData(9, 'far')
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}d|%{public}s', ds.totalCount(), String(ds.getData(1)))
      expect(ds.totalCount()).assertEqual(2)
      expect(ds.getData(1)).assertEqual('far')
      expect(ds.getData(0)).assertEqual('a')
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDs0015 end')
    })

    /**
     * @tc.name   testDs0016
     * @tc.number SUB_WEATHER_DS_0016
     * @tc.desc   Anchor: addData with negative index behaves as splice clamp
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('testDs0016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDs0016 begin')
      const src: string[] = ['a', 'b']
      const ds = new MyDataSource<string>(src)
      ds.addData(-1, 'tail')
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}d mid=%{public}s', ds.totalCount(), String(ds.getData(1)))
      expect(ds.totalCount()).assertEqual(3)
      expect(ds.getData(1)).assertEqual('tail')
      expect(ds.getData(2)).assertEqual('b')
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDs0016 end')
    })

    /**
     * @tc.name   testDs0017
     * @tc.number SUB_WEATHER_DS_0017
     * @tc.desc   totalCount is idempotent across repeated reads
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testDs0017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDs0017 begin')
      const src: string[] = ['m', 'n', 'o']
      const ds = new MyDataSource<string>(src)
      const t1 = ds.totalCount()
      const t2 = ds.totalCount()
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual t1=%{public}d t2=%{public}d', t1, t2)
      expect(t1).assertEqual(3)
      expect(t2).assertEqual(t1)
      expect(ds.getData(2)).assertEqual('o')
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDs0017 end')
    })

    /**
     * @tc.name   testDs0018
     * @tc.number SUB_WEATHER_DS_0018
     * @tc.desc   getData(0) on an empty source yields undefined not an error
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testDs0018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDs0018 begin')
      const empty: string[] = []
      const ds = new MyDataSource<string>(empty)
      const head = ds.getData(0)
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual head=%{public}s', String(head))
      expect(head).assertUndefined()
      expect(ds.totalCount()).assertEqual(0)
      expect(String(head)).assertEqual('undefined')
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDs0018 end')
    })

    /**
     * @tc.name   testDs0019
     * @tc.number SUB_WEATHER_DS_0019
     * @tc.desc   setData after mutations fully replaces previous state
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testDs0019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDs0019 begin')
      const src: string[] = ['a']
      const ds = new MyDataSource<string>(src)
      ds.pushData('b')
      ds.addData(0, 'z')
      const fresh: string[] = ['only']
      ds.setData(fresh)
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}d', ds.totalCount())
      expect(ds.totalCount()).assertEqual(1)
      expect(ds.getData(0)).assertEqual('only')
      expect(ds.getData(1)).assertUndefined()
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDs0019 end')
    })

    /**
     * @tc.name   testDs0020
     * @tc.number SUB_WEATHER_DS_0020
     * @tc.desc   Registering and using a change listener keeps data intact
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('testDs0020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDs0020 begin')
      const src: string[] = ['keep']
      const ds = new MyDataSource<string>(src)
            const recorder = new DsRecorder()
      const listener = recorder as Object as DataChangeListener
      ds.registerDataChangeListener(listener)
      ds.pushData('second')
      ds.unregisterDataChangeListener(listener)
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual notified=%{public}d count=%{public}d', recorder.notified, ds.totalCount())
      expect(recorder.notified).assertEqual(1)
      expect(ds.totalCount()).assertEqual(2)
      expect(ds.getData(1)).assertEqual('second')
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDs0020 end')
    })
  })
}
