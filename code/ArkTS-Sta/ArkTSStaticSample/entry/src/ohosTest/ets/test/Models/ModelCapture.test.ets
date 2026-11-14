/*
 * Copyright (c) 2026 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0.
 */

import { describe, it, expect, beforeEach } from '@ohos/hypium';
import { CardData } from 'library/src/main/ets/components/dyn/CardData';
import { DataModel } from 'library/src/main/ets/components/dyn/DataModel';
import { makePayload } from '../Shared/ScenarioSupport';
import { expectSyncFailure, yieldBetweenCases } from '../Shared/BoundarySupport';
import { setReadProperty } from '../Shared/BoundaryFixtures';

export default function modelCaptureTest(): void {
  describe('ModelCaptureTest', () => {
    beforeEach(yieldBetweenCases);

    it('ModelCaptureTest_constructorReadsTypeThenDataExactlyOnce', 0, () => {
      const payload = makePayload('captured', '60%', 1);
      const model: DataModel = { type: 'unused', data: payload };
      const events: string[] = [];
      setReadProperty(model, 'type', () => {
        events.push('type');
        return 'round2.model.capture';
      });
      setReadProperty(model, 'data', () => {
        events.push('data');
        return payload;
      });
      const card = new CardData(model);
      expect(events).assertDeepEquals(['type', 'data']);
      expect(card.type).assertEqual('round2.model.capture');
      expect(card.opt('item').title.name).assertEqual('captured');
      card.getObjectId();
      expect(events).assertDeepEquals(['type', 'data']);
    });

    it('ModelCaptureTest_typeFailurePreventsModelDataEvaluation', 0, () => {
      const payload = makePayload('unread', '50%', 2);
      const model: DataModel = { type: 'unused', data: payload };
      const failure = new Error('model type getter failed');
      let dataReads = 0;
      setReadProperty(model, 'type', () => { throw failure; });
      setReadProperty(model, 'data', () => {
        dataReads++;
        return payload;
      });
      expectSyncFailure(() => { new CardData(model); }, failure);
      expect(dataReads).assertEqual(0);
    });

    it('ModelCaptureTest_dataFailureIsUnwrappedAndNextConstructionStillWorks', 0, () => {
      const payload = makePayload('recovered', '70%', 3);
      const model: DataModel = { type: 'round2.model.data-error', data: payload };
      const failure = new Error('model data getter failed');
      setReadProperty(model, 'data', () => { throw failure; });
      expectSyncFailure(() => { new CardData(model); }, failure);
      setReadProperty(model, 'data', () => payload);
      const card = new CardData(model);
      expect(card.type).assertEqual(model.type);
      expect(card.data === payload).assertTrue();
      expect(card.opt('item').title.name).assertEqual('recovered');
    });

    it('ModelCaptureTest_dataAccessorSideEffectDoesNotRewriteCapturedType', 0, () => {
      const payload = makePayload('side-effect', '80%', 4);
      const model: DataModel = { type: 'round2.model.original-type', data: payload };
      setReadProperty(model, 'data', () => {
        model.type = 'round2.model.changed-type';
        return payload;
      });
      const card = new CardData(model);
      expect(card.type).assertEqual('round2.model.original-type');
      expect(model.type).assertEqual('round2.model.changed-type');
      expect(card.data === payload).assertTrue();
      expect(card.opt('sequence')).assertEqual(4);
    });
  });
}
