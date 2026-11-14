/*
 * Copyright (c) 2026 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0.
 */

import { describe, it, expect, beforeEach } from '@ohos/hypium';
import { CardData } from 'library/src/main/ets/components/dyn/CardData';
import { DataModel } from 'library/src/main/ets/components/dyn/DataModel';
import { CardItem, makePayload } from '../Shared/ScenarioSupport';
import { expectSyncFailure, yieldBetweenCases } from '../Shared/BoundarySupport';
import { PropertyProbe, replaceItem, deleteItem, freezeObject, hasOwn } from '../Shared/BoundaryFixtures';

export default function accessBoundaryTest(): void {
  describe('AccessBoundaryTest', () => {
    beforeEach(yieldBetweenCases);

    it('AccessBoundaryTest_payloadAccessorIsLazyAndNotCached', 0, () => {
      const probe = new PropertyProbe();
      const card = new CardData({ type: 'boundary.access.lazy', data: probe.data });
      expect(probe.reads).assertEqual(0);
      expect(card.opt('item') === probe.value).assertTrue();
      expect(probe.reads).assertEqual(1);
      probe.value = { title: { name: 'changed' } };
      expect(card.opt('item').title.name).assertEqual('changed');
      expect(probe.reads).assertEqual(2);
      card.getObjectId();
      expect(probe.reads).assertEqual(2);
    });

    it('AccessBoundaryTest_accessorExceptionPropagatesAndCanRecover', 0, () => {
      const probe = new PropertyProbe();
      const card = new CardData({ type: 'boundary.access.failure', data: probe.data });
      const id = card.getObjectId();
      const failure = new Error('payload accessor failed');
      probe.failure = failure;
      expectSyncFailure(() => { card.opt('item'); }, failure);
      expect(probe.reads).assertEqual(1);
      probe.failure = undefined;
      expect(card.opt('item') === probe.value).assertTrue();
      expect(probe.reads).assertEqual(2);
      expect(card.getObjectId()).assertEqual(id);
    });

    it('AccessBoundaryTest_inheritedNonEnumerablePayloadPropertyIsReadable', 0, () => {
      const probe = new PropertyProbe(true);
      const card = new CardData({ type: 'boundary.access.inherited', data: probe.data });
      expect(hasOwn(probe.data, 'item')).assertFalse();
      expect(JSON.stringify(probe.data)).assertEqual('{}');
      expect(card.opt('item') === probe.value).assertTrue();
      expect(probe.reads).assertEqual(1);
      expect(card.opt('missing')).assertUndefined();
      expect(probe.reads).assertEqual(1);
    });

    it('AccessBoundaryTest_deletingAndRedefiningAccessorIsObserved', 0, () => {
      const probe = new PropertyProbe();
      const card = new CardData({ type: 'boundary.access.redefine', data: probe.data });
      const id = card.getObjectId();
      expect(card.opt('item') === probe.value).assertTrue();
      deleteItem(probe.data);
      expect(card.opt('item')).assertUndefined();
      const replacement: CardItem = { title: { name: 'replacement' } };
      replaceItem(probe.data, replacement);
      expect(card.opt('item') === replacement).assertTrue();
      expect(probe.reads).assertEqual(1);
      expect(card.getObjectId()).assertEqual(id);
    });

    it('AccessBoundaryTest_constructorCapturesModelFieldsButSharesPayload', 0, () => {
      const first = makePayload('first', '10%', 1);
      const second = makePayload('second', '20%', 2);
      const model: DataModel = { type: 'boundary.access.model', data: first };
      const card = new CardData(model);
      model.type = 'reassigned';
      model.data = second;
      first.item.title.name = 'shared-change';
      expect(card.type).assertEqual('boundary.access.model');
      expect(card.data === first).assertTrue();
      expect(card.opt('item').title.name).assertEqual('shared-change');
      expect(model.data === second).assertTrue();
    });

    it('AccessBoundaryTest_frozenPayloadIsNotAnnotatedDuringConstruction', 0, () => {
      const payload = makePayload('frozen', '15%', 3);
      const before = JSON.stringify(payload);
      freezeObject(payload);
      const first = new CardData({ type: 'boundary.access.frozen', data: payload });
      const second = new CardData({ type: 'boundary.access.frozen', data: payload });
      expect(first.data === payload).assertTrue();
      expect(second.data === payload).assertTrue();
      expect(first.opt('item').title.name).assertEqual('frozen');
      expect(first.getObjectId() === second.getObjectId()).assertFalse();
      expect(JSON.stringify(payload)).assertEqual(before);
      expect(hasOwn(payload, 'objectId')).assertFalse();
    });
  });
}
