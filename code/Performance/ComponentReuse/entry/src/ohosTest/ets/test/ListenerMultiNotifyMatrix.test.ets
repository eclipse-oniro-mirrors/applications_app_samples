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

import { describe, beforeEach, it, expect, TestType, Size, Level } from '@ohos/hypium';
import { hilog } from '@kit.PerformanceAnalysisKit';
import { paceTurn } from './shared/TestPace';
import { ColorData } from '../../../main/ets/model/ColorData';

const DOMAIN: number = 0xF811;
const TAG: string = '[Sample_ComponentReuse_MultiNotify]';

class CountListener implements DataChangeListener {
  public addCount: number = 0;
  public lastIndex: number = -1;

  onDataReloaded(): void {
  }

  onDataAdded(index: number): void {
  }

  onDataAdd(index: number): void {
    this.addCount++;
    this.lastIndex = index;
  }

  onDataChange(index: number): void {
  }

  onDataChanged(index: number): void {
  }

  onDataDelete(index: number): void {
  }

  onDataDeleted(index: number): void {
  }

  onDataMove(from: number, to: number): void {
  }

  onDataMoved(from: number, to: number): void {
  }

  onDatasetChange(dataOperations: DataOperation[]): void {
  }
}

export default function listenerMultiNotifyMatrixTest() {
  describe('listenerMultiNotifyMatrixTest', () => {
    beforeEach(async () => {
      await paceTurn();
    });

    /**
     * @tc.number SUB_COMPONENT_REUSE_MULTINOTIFY_0100
     * @tc.name testMultiNotifyThree
     * @tc.desc Verify three sequential notifies reach all three listeners with the last index
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level LEVEL1
     */
    it('testMultiNotifyThree', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMultiNotifyThree begin');
      const data: ColorData = new ColorData();
      const listeners: CountListener[] = [];
      for (let i: number = 0; i < 3; i++) {
        const listener: CountListener = new CountListener();
        data.registerDataChangeListener(listener);
        listeners.push(listener);
      }
      data.notifyDataAdd(0);
      data.notifyDataAdd(2);
      data.notifyDataAdd(5);
      for (let i: number = 0; i < listeners.length; i++) {
        expect(listeners[i].addCount).assertEqual(3);
        expect(listeners[i].lastIndex).assertEqual(5);
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMultiNotifyThree end');
    });

    /**
     * @tc.number SUB_COMPONENT_REUSE_MULTINOTIFY_0200
     * @tc.name testMultiNotifyFour
     * @tc.desc Verify four sequential notifies update every listener count and last index
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level LEVEL1
     */
    it('testMultiNotifyFour', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMultiNotifyFour begin');
      const data: ColorData = new ColorData();
      const first: CountListener = new CountListener();
      const second: CountListener = new CountListener();
      data.registerDataChangeListener(first);
      data.registerDataChangeListener(second);
      data.notifyDataAdd(1);
      data.notifyDataAdd(3);
      data.notifyDataAdd(7);
      data.notifyDataAdd(9);
      expect(first.addCount).assertEqual(4);
      expect(second.addCount).assertEqual(4);
      expect(first.lastIndex).assertEqual(9);
      expect(second.lastIndex).assertEqual(9);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMultiNotifyFour end');
    });
  })
}
