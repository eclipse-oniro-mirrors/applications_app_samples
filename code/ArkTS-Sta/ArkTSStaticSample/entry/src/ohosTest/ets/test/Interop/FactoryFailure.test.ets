/*
 * Copyright (c) 2026 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0.
 */

import { describe, it, expect, beforeEach } from '@ohos/hypium';
import { EtsFactory } from 'library/src/main/ets/components/sta_bridge/EtsFactory';
import { DataParserStaW } from 'library/src/main/ets/components/sta_wrapper/DataParserStaW';
import { ControlledParser, waitForNativeFactory } from '../Shared/ScenarioSupport';
import { ParserFactory, expectSyncFailure, yieldBetweenCases } from '../Shared/BoundarySupport';

export default function factoryFailureTest(): void {
  describe('FactoryFailureTest', () => {
    beforeEach(yieldBetweenCases);

    it('FactoryFailureTest_missingFactoryFailsConstructionThenRecovers', 0, async () => {
      await waitForNativeFactory();
      const previous = EtsFactory.factory;
      const native = new ControlledParser();
      const factory = new ParserFactory(native);
      try {
        EtsFactory.factory = undefined;
        let caught = false;
        try {
          new DataParserStaW();
        } catch (error) {
          caught = error instanceof TypeError;
        }
        expect(caught).assertTrue();
        expect(native.inputs.length).assertEqual(0);
        EtsFactory.factory = factory;
        const output = await new DataParserStaW().parse([]);
        expect(output.totalCount()).assertEqual(0);
        expect(factory.calls).assertEqual(1);
      } finally {
        EtsFactory.factory = previous;
      }
    });

    it('FactoryFailureTest_factoryExceptionIsUnwrappedAndCreationCanRetry', 0, async () => {
      await waitForNativeFactory();
      const previous = EtsFactory.factory;
      const native = new ControlledParser();
      const factory = new ParserFactory(native);
      const failure = new Error('factory creation failed');
      factory.failure = failure;
      EtsFactory.factory = factory;
      try {
        expectSyncFailure(() => { new DataParserStaW(); }, failure);
        expect(factory.calls).assertEqual(1);
        expect(native.inputs.length).assertEqual(0);
        factory.failure = undefined;
        expect((await new DataParserStaW().parse([])).totalCount()).assertEqual(0);
        expect(factory.calls).assertEqual(2);
        expect(native.inputs.length).assertEqual(1);
      } finally {
        EtsFactory.factory = previous;
      }
    });

    it('FactoryFailureTest_existingWrapperSurvivesLaterFactoryFailure', 0, async () => {
      await waitForNativeFactory();
      const previous = EtsFactory.factory;
      const native = new ControlledParser();
      const factory = new ParserFactory(native);
      EtsFactory.factory = factory;
      try {
        const wrapper = new DataParserStaW();
        const failure = new Error('new constructions disabled');
        factory.failure = failure;
        expectSyncFailure(() => { new DataParserStaW(); }, failure);
        EtsFactory.factory = undefined;
        expect((await wrapper.parse([])).totalCount()).assertEqual(0);
        expect(factory.calls).assertEqual(2);
        expect(native.inputs.length).assertEqual(1);
      } finally {
        EtsFactory.factory = previous;
      }
    });
  });
}
