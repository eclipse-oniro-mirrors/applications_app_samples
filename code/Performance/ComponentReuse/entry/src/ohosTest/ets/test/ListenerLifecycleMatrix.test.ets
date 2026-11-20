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
import { ColorModel } from '../../../main/ets/model/BasicDataSource';
import { ColorData } from '../../../main/ets/model/ColorData';

const DOMAIN: number = 0xF811;
const TAG: string = '[Sample_ComponentReuse_ListenerLifecycle]';

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

function runLifecycle(count: number, notifyIndex: number): void {
  const data: ColorData = new ColorData();
  const listeners: CountListener[] = [];
  for (let i: number = 0; i < count; i++) {
    const listener: CountListener = new CountListener();
    data.registerDataChangeListener(listener);
    listeners.push(listener);
  }
  data.notifyDataAdd(notifyIndex);
  for (let i: number = 0; i < listeners.length; i++) {
    expect(listeners[i].addCount).assertEqual(1);
    expect(listeners[i].lastIndex).assertEqual(notifyIndex);
  }

  data.registerDataChangeListener(listeners[0]);
  data.notifyDataAdd(notifyIndex + 1);
  for (let i: number = 0; i < listeners.length; i++) {
    expect(listeners[i].addCount).assertEqual(2);
    expect(listeners[i].lastIndex).assertEqual(notifyIndex + 1);
  }

  data.unregisterDataChangeListener(listeners[count - 1]);
  data.notifyDataAdd(notifyIndex + 2);
  expect(listeners[count - 1].addCount).assertEqual(2);
  for (let i: number = 0; i < listeners.length - 1; i++) {
    expect(listeners[i].addCount).assertEqual(3);
  }
}

export default function listenerLifecycleMatrixTest() {
  describe('listenerLifecycleMatrixTest', () => {
    beforeEach(async () => {
      await paceTurn();
    });

    /**
     * @tc.number SUB_COMPONENT_REUSE_LISTENER_0100
     * @tc.name testListenerTwo
     * @tc.desc Verify notify, duplicate-register dedupe and unregister with two listeners
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level LEVEL1
     */
    it('testListenerTwo', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testListenerTwo begin');
      runLifecycle(2, 0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testListenerTwo end');
    });

    /**
     * @tc.number SUB_COMPONENT_REUSE_LISTENER_0200
     * @tc.name testListenerThree
     * @tc.desc Verify notify, duplicate-register dedupe and unregister with three listeners
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level LEVEL1
     */
    it('testListenerThree', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testListenerThree begin');
      runLifecycle(3, 5);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testListenerThree end');
    });

    /**
     * @tc.number SUB_COMPONENT_REUSE_LISTENER_0300
     * @tc.name testListenerFour
     * @tc.desc Verify notify, duplicate-register dedupe and unregister with four listeners
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level LEVEL1
     */
    it('testListenerFour', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testListenerFour begin');
      runLifecycle(4, 11);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testListenerFour end');
    });

    /**
     * @tc.number SUB_COMPONENT_REUSE_LISTENER_0400
     * @tc.name testListenerEight
     * @tc.desc Verify notify, duplicate-register dedupe and unregister with eight listeners
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level LEVEL1
     */
    it('testListenerEight', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testListenerEight begin');
      runLifecycle(8, 19);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testListenerEight end');
    });
  })
}
