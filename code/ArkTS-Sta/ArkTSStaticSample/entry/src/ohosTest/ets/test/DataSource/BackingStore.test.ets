/*
 * Copyright (c) 2026 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0.
 */

import { describe, it, expect, beforeEach } from '@ohos/hypium';
import { DataSource } from 'library/src/main/ets/components/dyn/DataSource';
import { makeSource, snapshotTitles } from '../Shared/ScenarioSupport';
import { expectSyncFailure, yieldBetweenCases } from '../Shared/BoundarySupport';
import { freezeObject, setReadProperty } from '../Shared/BoundaryFixtures';

export default function backingStoreTest(): void {
  describe('BackingStoreTest', () => {
    beforeEach(yieldBetweenCases);

    it('BackingStoreTest_rebindingPublicListRedirectsReadsAndAppends', 0, () => {
      const source = makeSource('round2.source.rebind', 2, 'old');
      const oldList = source.dataList;
      const replacement = makeSource('round2.source.rebind', 1, 'new').dataList;
      source.dataList = replacement;
      const appended = makeSource('round2.source.rebind', 1, 'appended').getData(0);
      source.addData(appended);
      expect(snapshotTitles(source)).assertDeepEquals(['new:0', 'appended:0']);
      expect(replacement.length).assertEqual(2);
      expect(oldList.length).assertEqual(2);
      expect(oldList[0].opt('item').title.name).assertEqual('old:0');
      expect(source.getData(1) === appended).assertTrue();
    });

    it('BackingStoreTest_failedAppendToFrozenListPreservesCountAndCanRecover', 0, () => {
      const source = makeSource('round2.source.frozen', 1, 'existing');
      const original = source.dataList;
      freezeObject(original);
      const next = makeSource('round2.source.frozen', 1, 'next').getData(0);
      let caught = false;
      try {
        source.addData(next);
      } catch (error) {
        caught = error instanceof TypeError;
      }
      expect(caught).assertTrue();
      expect(source.totalCount()).assertEqual(1);
      expect(source.getData(1)).assertUndefined();
      source.dataList = original.slice();
      source.addData(next);
      expect(source.totalCount()).assertEqual(2);
      expect(source.getData(1) === next).assertTrue();
      expect(original.length).assertEqual(1);
    });

    it('BackingStoreTest_explicitSharedBackingRemainsSharedUntilOneSourceRebinds', 0, () => {
      const first = makeSource('round2.source.shared-array', 1, 'initial');
      const second = new DataSource();
      second.dataList = first.dataList;
      const added = makeSource('round2.source.shared-array', 1, 'added').getData(0);
      second.addData(added);
      expect(first.totalCount()).assertEqual(2);
      expect(first.getData(1) === added).assertTrue();
      second.dataList = [];
      expect(second.totalCount()).assertEqual(0);
      expect(first.totalCount()).assertEqual(2);
      expect(first.getData(1) === added).assertTrue();
    });

    it('BackingStoreTest_indexAccessorFailurePropagatesWithoutChangingLength', 0, () => {
      const source = makeSource('round2.source.index-getter', 1, 'unreadable');
      const failure = new Error('backing index getter failed');
      let reads = 0;
      setReadProperty(source.dataList, '0', () => {
        reads++;
        throw failure;
      });
      expect(source.totalCount()).assertEqual(1);
      expect(reads).assertEqual(0);
      expectSyncFailure(() => { source.getData(0); }, failure);
      expect(reads).assertEqual(1);
      expect(source.totalCount()).assertEqual(1);
      expect(source.getData(1)).assertUndefined();
    });
  });
}
