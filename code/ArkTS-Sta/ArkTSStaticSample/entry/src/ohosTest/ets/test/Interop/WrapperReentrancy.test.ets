/*
 * Copyright (c) 2026 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0.
 */

import { describe, it, expect, beforeEach } from '@ohos/hypium';
import { CardData } from 'library/src/main/ets/components/dyn/CardData';
import { DataSource } from 'library/src/main/ets/components/dyn/DataSource';
import { RESOLVER_REGISTRY as registry } from 'library/src/main/ets/components/dyn/ResolverRegistry';
import {
  CardPayload, ControlledParser, makeSource, RecordingResolver, snapshotTitles
} from '../Shared/ScenarioSupport';
import {
  CallbackResolver, DeferredParser, withParser, expectRejection, yieldBetweenCases
} from '../Shared/BoundarySupport';
import { SerializationProbe, setReadProperty } from '../Shared/BoundaryFixtures';

export default function wrapperReentrancyTest(): void {
  describe('WrapperReentrancyTest', () => {
    beforeEach(yieldBetweenCases);

    it('WrapperReentrancyTest_resolverCanQueueAnotherParseOnSameWrapper', 0, async () => {
      const outerType = 'round2.reentrant.outer';
      const innerType = 'round2.reentrant.inner';
      registry.registerCard(innerType, new RecordingResolver());
      const native = new DeferredParser();
      await withParser(native, async (wrapper) => {
        const nested: Promise<DataSource>[] = [];
        registry.registerCard(outerType, new CallbackResolver((model, index) => {
          if (index === 0) {
            nested.push(wrapper.parse('inner'));
          }
          return new CardData(model);
        }));
        const pending = wrapper.parse('outer');
        native.complete(0, makeSource(outerType, 2, 'outer'));
        const outer = await pending;
        expect(native.inputs).assertDeepEquals(['outer', 'inner']);
        native.complete(1, makeSource(innerType, 1, 'inner'));
        const inner = await nested[0];
        expect(snapshotTitles(outer)).assertDeepEquals(['outer:0', 'outer:1']);
        expect(snapshotTitles(inner)).assertDeepEquals(['inner:0']);
        expect(inner === outer).assertFalse();
      });
    });

    it('WrapperReentrancyTest_nestedFailureDoesNotDiscardCompletedOuterOutput', 0, async () => {
      const type = 'round2.reentrant.inner-failure';
      const native = new DeferredParser();
      const failure = new Error('nested request failed');
      await withParser(native, async (wrapper) => {
        const nestedChecks: Promise<void>[] = [];
        registry.registerCard(type, new CallbackResolver((model) => {
          nestedChecks.push(expectRejection(wrapper.parse('nested'), failure));
          return new CardData(model);
        }));
        const pending = wrapper.parse('outer');
        native.complete(0, makeSource(type, 1, 'outer'));
        const outer = await pending;
        const card = outer.getData(0);
        native.fail(1, failure);
        await nestedChecks[0];
        expect(snapshotTitles(outer)).assertDeepEquals(['outer:0']);
        expect(outer.getData(0) === card).assertTrue();
        expect(native.inputs.length).assertEqual(2);
      });
    });

    it('WrapperReentrancyTest_serializationCanReenterBeforeOuterNativeCall', 0, async () => {
      const native = new ControlledParser();
      const probe = new SerializationProbe();
      await withParser(native, async (wrapper) => {
        const nested: Promise<DataSource>[] = [];
        setReadProperty(probe, 'result', () => {
          nested.push(wrapper.parse('inner'));
          return [];
        });
        const outer = await wrapper.parse(probe);
        const inner = await nested[0];
        expect(native.inputs).assertDeepEquals(['inner', '[]']);
        expect(probe.calls).assertEqual(1);
        expect(inner === outer).assertFalse();
        expect(inner.totalCount()).assertEqual(0);
        expect(outer.totalCount()).assertEqual(0);
      });
    });

    it('WrapperReentrancyTest_payloadGetterCanTriggerIndependentConversion', 0, async () => {
      const type = 'round2.reentrant.payload-getter';
      const innerType = type + '.inner';
      registry.registerCard(type, new RecordingResolver());
      registry.registerCard(innerType, new RecordingResolver());
      const native = new DeferredParser();
      const outerInput = makeSource(type, 1, 'outer');
      const payload: CardPayload = outerInput.getData(0).data;
      await withParser(native, async (wrapper) => {
        const nested: Promise<DataSource>[] = [];
        setReadProperty(outerInput.getData(0), 'data', () => {
          nested.push(wrapper.parse('getter-inner'));
          return payload!;
        });
        const pending = wrapper.parse('outer');
        native.complete(0, outerInput);
        const outer = await pending;
        expect(nested.length).assertEqual(1);
        native.complete(1, makeSource(innerType, 1, 'inner'));
        const inner = await nested[0];
        expect(snapshotTitles(outer)).assertDeepEquals(['outer:0']);
        expect(snapshotTitles(inner)).assertDeepEquals(['inner:0']);
        expect(outer.getData(0).data === payload).assertTrue();
      });
    });
  });
}
