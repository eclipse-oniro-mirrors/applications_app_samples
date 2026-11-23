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

import { describe, expect, it, Level, Size, TestType } from '@ohos/hypium';
import hilog from '@ohos.hilog';
import { yieldToEventLoop } from '../support/AsyncSupport';
import { InputHandler } from '../../../../main/ets/model/KeyboardController';
import { ClientHarness, createClientHarness } from '../support/ClientHarness';

const DOMAIN: number = 0xF814;
const TAG: string = '[Sample_KikaInputStorageSnapshotConsistency]';

export default function storageSnapshotConsistencyTest(): void {
  describe('StorageSnapshotConsistencyTest', () => {

    /**
     * @tc.number    SUB_KIKA_INPUT_STORAGE_SNAPSHOT_CONSISTENCY_0100
     * @tc.name      testStorageSnapshotConsistency_001
     * @tc.desc      Verify that a stop removes no storage values and keeps all four keys typed.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testStorageSnapshotConsistency_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStorageSnapshotConsistency_001 begin');
      await createClientHarness(3, 4);
      InputHandler.getInstance().onInputStop();
      const enterType: number | undefined = AppStorage.get<number>('enterKeyType');
      const pattern: number | undefined = AppStorage.get<number>('inputPattern');
      const handler: InputHandler | undefined = AppStorage.get<InputHandler>('inputHandler');
      expect(typeof enterType).assertEqual('number');
      expect(typeof pattern).assertEqual('number');
      expect(handler !== undefined).assertTrue();
      expect(enterType).assertEqual(3);

      hilog.info(DOMAIN, TAG, '%{public}s', 'testStorageSnapshotConsistency_001 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_STORAGE_SNAPSHOT_CONSISTENCY_0200
     * @tc.name      testStorageSnapshotConsistency_002
     * @tc.desc      Verify that the handler object identity is unchanged after a stop and a restart.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testStorageSnapshotConsistency_002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStorageSnapshotConsistency_002 begin');
      const handler: InputHandler = InputHandler.getInstance();
      await createClientHarness(0);
      InputHandler.getInstance().onInputStop();
      await createClientHarness(0);
      const stored: InputHandler | undefined = AppStorage.get<InputHandler>('inputHandler');
      expect(stored).assertEqual(handler);
      expect(InputHandler.getInstance()).assertEqual(handler);

      hilog.info(DOMAIN, TAG, '%{public}s', 'testStorageSnapshotConsistency_002 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_STORAGE_SNAPSHOT_CONSISTENCY_0300
     * @tc.name      testStorageSnapshotConsistency_003
     * @tc.desc      Verify that the third attach wins the enter-key storage value.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testStorageSnapshotConsistency_003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStorageSnapshotConsistency_003 begin');
      await createClientHarness(1, 1);
      InputHandler.getInstance().onInputStop();
      await createClientHarness(2, 2);
      InputHandler.getInstance().onInputStop();
      const third: ClientHarness = await createClientHarness(3, 3);
      expect(AppStorage.get<number>('enterKeyType')).assertEqual(3);
      expect(AppStorage.get<number>('inputPattern')).assertEqual(3);
      InputHandler.getInstance().sendKeyFunction();
      expect(third.client.keyFunctions[0]).assertEqual(3);

      hilog.info(DOMAIN, TAG, '%{public}s', 'testStorageSnapshotConsistency_003 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_STORAGE_SNAPSHOT_CONSISTENCY_0400
     * @tc.name      testStorageSnapshotConsistency_004
     * @tc.desc      Verify that a refresh does not rewrite either numeric editor value.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testStorageSnapshotConsistency_004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStorageSnapshotConsistency_004 begin');
      await createClientHarness(7, 8);
      AppStorage.setOrCreate<string>('showLog', '');
      InputHandler.getInstance().refreshInfo();
      InputHandler.getInstance().refreshInfo();
      expect(AppStorage.get<number>('enterKeyType')).assertEqual(7);
      expect(AppStorage.get<number>('inputPattern')).assertEqual(8);
      const summary: string = AppStorage.get<string>('showLog') ?? '';
      expect(summary.indexOf('FWD5') >= 0).assertTrue();

      hilog.info(DOMAIN, TAG, '%{public}s', 'testStorageSnapshotConsistency_004 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_STORAGE_SNAPSHOT_CONSISTENCY_0500
     * @tc.name      testStorageSnapshotConsistency_005
     * @tc.desc      Verify that each refresh overwrites the summary instead of appending to it.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testStorageSnapshotConsistency_005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStorageSnapshotConsistency_005 begin');
      await createClientHarness(0);
      InputHandler.getInstance().setSelectInfo('SEL-once');
      AppStorage.setOrCreate<string>('showLog', '');
      InputHandler.getInstance().refreshInfo();
      const first: string = AppStorage.get<string>('showLog') ?? '';
      InputHandler.getInstance().refreshInfo();
      const second: string = AppStorage.get<string>('showLog') ?? '';
      expect(first).assertEqual(second);
      expect(countOf(second, 'SEL-once')).assertEqual(1);

      hilog.info(DOMAIN, TAG, '%{public}s', 'testStorageSnapshotConsistency_005 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_STORAGE_SNAPSHOT_CONSISTENCY_0600
     * @tc.name      testStorageSnapshotConsistency_006
     * @tc.desc      Verify that two stops in a row leave every storage value still readable.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testStorageSnapshotConsistency_006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStorageSnapshotConsistency_006 begin');
      await createClientHarness(9, 10);
      InputHandler.getInstance().onInputStop();
      InputHandler.getInstance().onInputStop();
      expect(AppStorage.get<number>('enterKeyType') !== undefined).assertTrue();
      expect(AppStorage.get<number>('inputPattern') !== undefined).assertTrue();
      expect(AppStorage.get<InputHandler>('inputHandler') !== undefined).assertTrue();

      hilog.info(DOMAIN, TAG, '%{public}s', 'testStorageSnapshotConsistency_006 end');
      await yieldToEventLoop();
    });

  });
}

function countOf(text: string, marker: string): number {
  let count: number = 0;
  let from: number = 0;
  let found: number = text.indexOf(marker, from);
  while (found >= 0) {
    count = count + 1;
    from = found + marker.length;
    found = text.indexOf(marker, from);
  }
  return count;
}
