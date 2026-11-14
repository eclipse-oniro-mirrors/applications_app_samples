/*
 * Copyright (c) 2026 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0.
 */

import { describe, it, expect, beforeEach } from '@ohos/hypium';
import { CardData } from 'library/src/main/ets/components/dyn/CardData';
import { RESOLVER_REGISTRY as registry } from 'library/src/main/ets/components/dyn/ResolverRegistry';
import { makeSource, makePayload, RecordingResolver, snapshotTitles } from '../Shared/ScenarioSupport';
import {
  CallbackResolver, DeferredParser, withParser, expectRejection, yieldBetweenCases
} from '../Shared/BoundarySupport';

export default function deferredConversionTest(): void {
  describe('DeferredConversionTest', () => {
    beforeEach(yieldBetweenCases);

    it('DeferredConversionTest_doesNotConvertBeforeNativeCompletion', 0, async () => {
      const type = 'boundary.deferred.pending';
      const resolver = new RecordingResolver();
      registry.registerCard(type, resolver);
      const native = new DeferredParser();
      await withParser(native, async (wrapper) => {
        let completed = false;
        const result = wrapper.parse('[]').then((source) => {
          completed = true;
          return source;
        });
        await Promise.resolve();
        expect(resolver.calls).assertEqual(0);
        expect(completed).assertFalse();
        native.complete(0, makeSource(type, 1, 'ready'));
        expect((await result).totalCount()).assertEqual(1);
        expect(resolver.calls).assertEqual(1);
        expect(completed).assertTrue();
      });
    });

    it('DeferredConversionTest_reverseCompletionPreservesRequestAssociation', 0, async () => {
      const type = 'boundary.deferred.reverse';
      registry.registerCard(type, new RecordingResolver());
      const native = new DeferredParser();
      await withParser(native, async (wrapper) => {
        const completion: string[] = [];
        const first = wrapper.parse('first').then((source) => {
          completion.push('first');
          return source;
        });
        const second = wrapper.parse('second').then((source) => {
          completion.push('second');
          return source;
        });
        native.complete(1, makeSource(type, 1, 'second'));
        expect(snapshotTitles(await second)).assertDeepEquals(['second:0']);
        expect(completion).assertDeepEquals(['second']);
        native.complete(0, makeSource(type, 1, 'first'));
        expect(snapshotTitles(await first)).assertDeepEquals(['first:0']);
        expect(completion).assertDeepEquals(['second', 'first']);
        expect(native.inputs).assertDeepEquals(['first', 'second']);
      });
    });

    it('DeferredConversionTest_pendingRequestUsesReplacementResolver', 0, async () => {
      const type = 'boundary.deferred.replaced';
      const original = new RecordingResolver();
      const replacement = new RecordingResolver();
      registry.registerCard(type, original);
      const native = new DeferredParser();
      await withParser(native, async (wrapper) => {
        const result = wrapper.parse([]);
        registry.registerCard(type, replacement);
        native.complete(0, makeSource(type, 1, 'replacement'));
        expect((await result).totalCount()).assertEqual(1);
        expect(original.calls).assertEqual(0);
        expect(replacement.calls).assertEqual(1);
      });
    });

    it('DeferredConversionTest_registrationAfterRequestEnablesConversion', 0, async () => {
      const type = 'boundary.deferred.late-registration';
      const resolver = new RecordingResolver();
      const native = new DeferredParser();
      await withParser(native, async (wrapper) => {
        const result = wrapper.parse([]);
        registry.registerCard(type, resolver);
        native.complete(0, makeSource(type, 1, 'late'));
        expect(snapshotTitles(await result)).assertDeepEquals(['late:0']);
        expect(resolver.calls).assertEqual(1);
      });
    });

    it('DeferredConversionTest_resolvedPromiseStillDefersConversionToMicrotask', 0, async () => {
      const type = 'boundary.deferred.microtask';
      const original = new RecordingResolver();
      const replacement = new RecordingResolver();
      registry.registerCard(type, original);
      const native = new DeferredParser();
      await withParser(native, async (wrapper) => {
        const result = wrapper.parse([]);
        native.complete(0, makeSource(type, 1, 'resolved'));
        expect(original.calls).assertEqual(0);
        registry.registerCard(type, replacement);
        await result;
        expect(original.calls).assertEqual(0);
        expect(replacement.calls).assertEqual(1);
      });
    });

    it('DeferredConversionTest_payloadMutationBeforeConversionIsVisible', 0, async () => {
      const type = 'boundary.deferred.payload';
      registry.registerCard(type, new RecordingResolver());
      const native = new DeferredParser();
      const input = makeSource(type, 1, 'before');
      await withParser(native, async (wrapper) => {
        const pending = wrapper.parse([]);
        native.complete(0, input);
        input.getData(0).data = makePayload('after', '80%', 7);
        const source = await pending;
        expect(snapshotTitles(source)).assertDeepEquals(['after']);
        expect(source.getData(0).data === input.getData(0).data).assertTrue();
      });
    });

    it('DeferredConversionTest_oneRejectedRequestDoesNotCancelSibling', 0, async () => {
      const type = 'boundary.deferred.sibling';
      const resolver = new RecordingResolver();
      registry.registerCard(type, resolver);
      const native = new DeferredParser();
      const failure = new Error('first request rejected');
      await withParser(native, async (wrapper) => {
        const rejected = expectRejection(wrapper.parse('first'), failure);
        const accepted = wrapper.parse('second');
        native.fail(0, failure);
        await rejected;
        expect(resolver.calls).assertEqual(0);
        native.complete(1, makeSource(type, 1, 'survivor'));
        expect(snapshotTitles(await accepted)).assertDeepEquals(['survivor:0']);
        expect(resolver.calls).assertEqual(1);
      });
    });

    it('DeferredConversionTest_conversionFailureDoesNotPoisonPendingSibling', 0, async () => {
      const type = 'boundary.deferred.conversion-failure';
      const failure = new Error('conversion rejected');
      registry.registerCard(type, new CallbackResolver((model) => {
        if (model.data.sequence === 9) {
          throw failure;
        }
        return new CardData(model);
      }));
      const native = new DeferredParser();
      await withParser(native, async (wrapper) => {
        const failed = expectRejection(wrapper.parse('bad'), failure);
        const healthy = wrapper.parse('good');
        const broken = makeSource(type, 1, 'bad');
        broken.getData(0).data.sequence = 9;
        native.complete(0, broken);
        await failed;
        native.complete(1, makeSource(type, 1, 'healthy'));
        expect(snapshotTitles(await healthy)).assertDeepEquals(['healthy:0']);
      });
    });

    it('DeferredConversionTest_resolverChangesBetweenCompletionsAreObserved', 0, async () => {
      const type = 'boundary.deferred.between';
      const firstResolver = new RecordingResolver();
      const secondResolver = new RecordingResolver();
      registry.registerCard(type, firstResolver);
      const native = new DeferredParser();
      await withParser(native, async (wrapper) => {
        const first = wrapper.parse('a');
        const second = wrapper.parse('b');
        native.complete(0, makeSource(type, 1, 'a'));
        const a = await first;
        registry.registerCard(type, secondResolver);
        native.complete(1, makeSource(type, 1, 'b'));
        const b = await second;
        expect(firstResolver.calls).assertEqual(1);
        expect(secondResolver.calls).assertEqual(1);
        expect(a.getData(0).data === firstResolver.models[0].data).assertTrue();
        expect(b.getData(0).data === secondResolver.models[0].data).assertTrue();
      });
    });
  });
}
