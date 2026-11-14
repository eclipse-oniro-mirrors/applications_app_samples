/*
 * Copyright (c) 2026 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0.
 */

import { describe, it, expect, beforeEach } from '@ohos/hypium';
import { CardData } from 'library/src/main/ets/components/dyn/CardData';
import { RESOLVER_REGISTRY as registry } from 'library/src/main/ets/components/dyn/ResolverRegistry';
import { ControlledParser, makeSource, makePayload, RecordingResolver, snapshotTitles } from '../Shared/ScenarioSupport';
import {
  CallbackResolver, ProbeSource, withParser, expectRejection, yieldBetweenCases
} from '../Shared/BoundarySupport';

export default function conversionBoundaryTest(): void {
  describe('ConversionBoundaryTest', () => {
    beforeEach(yieldBetweenCases);

    it('ConversionBoundaryTest_readsCountOnceThenConvertsInIndexOrder', 0, async () => {
      const type = 'boundary.convert.access-order';
      const input = new ProbeSource();
      const resolver = new CallbackResolver((model, index) => {
        input.events.push('convert:' + index);
        return new CardData(model);
      });
      registry.registerCard(type, resolver);
      input.dataList = makeSource(type, 2, 'ordered').dataList;
      const native = new ControlledParser();
      native.result = input;
      await withParser(native, async (wrapper) => {
        expect(snapshotTitles(await wrapper.parse([]))).assertDeepEquals(['ordered:0', 'ordered:1']);
        expect(input.events).assertDeepEquals(['count', 'read:0', 'convert:0', 'read:1', 'convert:1']);
      });
    });

    it('ConversionBoundaryTest_countFailureRejectsWithoutReadingCards', 0, async () => {
      const input = new ProbeSource();
      const failure = new Error('native count failed');
      input.countFailure = failure;
      const native = new ControlledParser();
      native.result = input;
      await withParser(native, async (wrapper) => {
        await expectRejection(wrapper.parse([]), failure);
        expect(input.events).assertDeepEquals(['count']);
      });
    });

    it('ConversionBoundaryTest_middleReadFailureStopsFurtherReads', 0, async () => {
      const type = 'boundary.convert.read-failure';
      const resolver = new RecordingResolver();
      registry.registerCard(type, resolver);
      const input = new ProbeSource();
      input.dataList = makeSource(type, 3, 'read').dataList;
      const failure = new Error('native read failed');
      input.failIndex = 1;
      input.readFailure = failure;
      const native = new ControlledParser();
      native.result = input;
      await withParser(native, async (wrapper) => {
        await expectRejection(wrapper.parse([]), failure);
        expect(input.events).assertDeepEquals(['count', 'read:0', 'read:1']);
        expect(resolver.calls).assertEqual(1);
        expect(input.dataList.length).assertEqual(3);
        input.readFailure = undefined;
        input.events = [];
        expect(snapshotTitles(await wrapper.parse([]))).assertDeepEquals(['read:0', 'read:1', 'read:2']);
        expect(resolver.calls).assertEqual(4);
      });
    });

    it('ConversionBoundaryTest_countSnapshotExcludesResolverAppends', 0, async () => {
      const type = 'boundary.convert.append';
      const input = new ProbeSource();
      input.dataList = makeSource(type, 1, 'initial').dataList;
      const resolver = new CallbackResolver((model) => {
        input.addData(new CardData({ type: type, data: makePayload('added', '50%', 1) }));
        return new CardData(model);
      });
      registry.registerCard(type, resolver);
      const native = new ControlledParser();
      native.result = input;
      await withParser(native, async (wrapper) => {
        const output = await wrapper.parse([]);
        expect(snapshotTitles(output)).assertDeepEquals(['initial:0']);
        expect(input.dataList.length).assertEqual(2);
        expect(input.events).assertDeepEquals(['count', 'read:0']);
        expect(resolver.models.length).assertEqual(1);
      });
    });

    it('ConversionBoundaryTest_usesReportedCountInsteadOfBackingArrayLength', 0, async () => {
      const type = 'boundary.convert.count-contract';
      const input = new ProbeSource();
      input.dataList = makeSource(type, 2, 'backing').dataList;
      input.reportedCount = 1;
      registry.registerCard(type, new RecordingResolver());
      const native = new ControlledParser();
      native.result = input;
      await withParser(native, async (wrapper) => {
        expect(snapshotTitles(await wrapper.parse([]))).assertDeepEquals(['backing:0']);
        expect(input.events).assertDeepEquals(['count', 'read:0']);
        expect(input.dataList.length).assertEqual(2);
      });
    });

    it('ConversionBoundaryTest_readsLaterCardsAfterEarlierResolverMutation', 0, async () => {
      const type = 'boundary.convert.replace-later-card';
      const input = makeSource(type, 2, 'original');
      const replacement = new CardData({ type: type, data: makePayload('new-card', '30%', 2) });
      registry.registerCard(type, new CallbackResolver((model, index) => {
        if (index === 0) {
          input.dataList[1] = replacement;
        }
        return new CardData(model);
      }));
      const native = new ControlledParser();
      native.result = input;
      await withParser(native, async (wrapper) => {
        const source = await wrapper.parse([]);
        expect(snapshotTitles(source)).assertDeepEquals(['original:0', 'new-card']);
        expect(source.getData(1).data === replacement.data).assertTrue();
      });
    });

    it('ConversionBoundaryTest_replacementResolverAffectsRemainingCards', 0, async () => {
      const type = 'boundary.convert.replace-resolver';
      const replacement = new RecordingResolver();
      const original = new CallbackResolver((model) => {
        registry.registerCard(type, replacement);
        return new CardData(model);
      });
      registry.registerCard(type, original);
      const native = new ControlledParser();
      native.result = makeSource(type, 3, 'swap');
      await withParser(native, async (wrapper) => {
        const output = await wrapper.parse([]);
        expect(original.models.length).assertEqual(1);
        expect(replacement.calls).assertEqual(2);
        expect(replacement.models[0].data === native.result.getData(1).data).assertTrue();
        expect(snapshotTitles(output)).assertDeepEquals(['swap:0', 'swap:1', 'swap:2']);
      });
    });

    it('ConversionBoundaryTest_registrationDoesNotRevisitEarlierUnknownCard', 0, async () => {
      const type = 'boundary.convert.register-midstream';
      const laterType = type + '.later';
      const later = new RecordingResolver();
      const input = makeSource(laterType, 1, 'skipped');
      input.addData(new CardData({ type: type, data: makePayload('trigger', '50%', 0) }));
      input.addData(new CardData({ type: laterType, data: makePayload('included', '50%', 1) }));
      registry.registerCard(type, new CallbackResolver((model) => {
        registry.registerCard(laterType, later);
        return new CardData(model);
      }));
      const native = new ControlledParser();
      native.result = input;
      await withParser(native, async (wrapper) => {
        const output = await wrapper.parse([]);
        expect(snapshotTitles(output)).assertDeepEquals(['trigger', 'included']);
        expect(later.calls).assertEqual(1);
        expect(input.totalCount()).assertEqual(3);
      });
    });

    it('ConversionBoundaryTest_resolverFailureRejectsInsteadOfReturningPartialResult', 0, async () => {
      const type = 'boundary.convert.partial-failure';
      const failure = new Error('second conversion failed');
      const resolver = new CallbackResolver((model, index) => {
        if (index === 1) {
          throw failure;
        }
        return new CardData(model);
      });
      registry.registerCard(type, resolver);
      const input = new ProbeSource();
      input.dataList = makeSource(type, 3, 'partial').dataList;
      const native = new ControlledParser();
      native.result = input;
      await withParser(native, async (wrapper) => {
        await expectRejection(wrapper.parse([]), failure);
        expect(resolver.models.length).assertEqual(2);
        expect(resolver.cards.length).assertEqual(1);
        expect(input.events).assertDeepEquals(['count', 'read:0', 'read:1']);
        registry.registerCard(type, new RecordingResolver());
        const recovered = await wrapper.parse([]);
        expect(snapshotTitles(recovered)).assertDeepEquals(['partial:0', 'partial:1', 'partial:2']);
        expect(recovered.getData(0) === resolver.cards[0]).assertFalse();
      });
    });

    it('ConversionBoundaryTest_storesResolverReturnedCardWithoutRewrapping', 0, async () => {
      const type = 'boundary.convert.custom-card';
      const replacement = new CardData({ type: type + '.output', data: makePayload('custom', '40%', 7) });
      registry.registerCard(type, new CallbackResolver(() => replacement));
      const native = new ControlledParser();
      native.result = makeSource(type, 1, 'input');
      await withParser(native, async (wrapper) => {
        const output = await wrapper.parse([]);
        expect(output.getData(0) === replacement).assertTrue();
        expect(output.getData(0).type).assertEqual(type + '.output');
        expect(output.getData(0).opt('sequence')).assertEqual(7);
      });
    });

    it('ConversionBoundaryTest_repeatedNativeReferenceTriggersSeparateConversions', 0, async () => {
      const type = 'boundary.convert.repeated-native';
      const resolver = new RecordingResolver();
      registry.registerCard(type, resolver);
      const native = new ControlledParser();
      native.result = makeSource(type, 1, 'same');
      native.result.addData(native.result.getData(0));
      await withParser(native, async (wrapper) => {
        const output = await wrapper.parse([]);
        expect(resolver.calls).assertEqual(2);
        expect(output.totalCount()).assertEqual(2);
        expect(output.getData(0) === output.getData(1)).assertFalse();
        expect(output.getData(0).data === output.getData(1).data).assertTrue();
        expect(output.getData(0).getObjectId() === output.getData(1).getObjectId()).assertFalse();
      });
    });

    it('ConversionBoundaryTest_resolverMayIntentionallyReuseOneOutputCard', 0, async () => {
      const type = 'boundary.convert.shared-output';
      const shared = new CardData({ type: type, data: makePayload('shared', '60%', 0) });
      const resolver = new CallbackResolver(() => shared);
      registry.registerCard(type, resolver);
      const native = new ControlledParser();
      native.result = makeSource(type, 2, 'distinct');
      await withParser(native, async (wrapper) => {
        const output = await wrapper.parse([]);
        expect(resolver.models.length).assertEqual(2);
        expect(output.totalCount()).assertEqual(2);
        expect(output.getData(0) === shared).assertTrue();
        expect(output.getData(1) === shared).assertTrue();
        expect(native.result.getData(0) === native.result.getData(1)).assertFalse();
      });
    });
  });
}
