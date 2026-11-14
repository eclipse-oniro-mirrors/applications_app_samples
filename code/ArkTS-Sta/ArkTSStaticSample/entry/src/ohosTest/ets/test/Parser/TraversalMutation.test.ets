/*
 * Copyright (c) 2026 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0.
 */

import { describe, it, expect, beforeEach } from '@ohos/hypium';
import { CardData } from 'library/src/main/ets/components/dyn/CardData';
import { DataParser } from 'library/src/main/ets/components/dyn/DataParser';
import { RESOLVER_REGISTRY as registry } from 'library/src/main/ets/components/dyn/ResolverRegistry';
import { makeGroup, RecordingResolver, snapshotTitles } from '../Shared/ScenarioSupport';
import { CallbackResolver, yieldBetweenCases } from '../Shared/BoundarySupport';
import { inspectProperty } from '../Shared/PropertyInspection';

export default function traversalMutationTest(): void {
  describe('TraversalMutationTest', () => {
    beforeEach(yieldBetweenCases);

    it('TraversalMutationTest_replacingPayloadArrayChangesSubsequentReads', 0, async () => {
      const type = 'round2.traversal.replace-array';
      const group = makeGroup(type, 3, 'old');
      const original = group.data;
      const replacement = makeGroup(type, 2, 'new').data;
      const resolver = new CallbackResolver((model, index) => {
        if (index === 0) {
          group.data = replacement;
        }
        return new CardData(model);
      });
      registry.registerCard(type, resolver);
      const source = await new DataParser(() => {}).parse([group]);
      expect(snapshotTitles(source)).assertDeepEquals(['old:0', 'new:1']);
      expect(resolver.models[0].data === original[0]).assertTrue();
      expect(resolver.models[1].data === replacement[1]).assertTrue();
      expect(inspectProperty(original[1].style, 'width').hasGetter).assertFalse();
    });

    it('TraversalMutationTest_shrinkingCurrentPayloadArrayStopsTraversal', 0, async () => {
      const type = 'round2.traversal.shrink';
      const group = makeGroup(type, 3, 'shrink');
      const removed = group.data[1];
      const resolver = new CallbackResolver((model) => {
        group.data.length = 1;
        return new CardData(model);
      });
      registry.registerCard(type, resolver);
      const source = await new DataParser(() => {}).parse([group]);
      expect(snapshotTitles(source)).assertDeepEquals(['shrink:0']);
      expect(resolver.models.length).assertEqual(1);
      expect(inspectProperty(removed.style, 'width').hasGetter).assertFalse();
    });

    it('TraversalMutationTest_groupTypeChangeRoutesRemainingPayloads', 0, async () => {
      const firstType = 'round2.traversal.type-first';
      const nextType = 'round2.traversal.type-next';
      const group = makeGroup(firstType, 2, 'route');
      const next = new RecordingResolver();
      registry.registerCard(nextType, next);
      registry.registerCard(firstType, new CallbackResolver((model) => {
        group.type = nextType;
        return new CardData(model);
      }));
      const source = await new DataParser(() => {}).parse([group]);
      expect(source.getData(0).type).assertEqual(firstType);
      expect(source.getData(1).type).assertEqual(nextType);
      expect(next.calls).assertEqual(1);
      expect(next.models[0].data === group.data[1]).assertTrue();
    });

    it('TraversalMutationTest_unknownTypeAfterMutationSkipsRemainingPayloads', 0, async () => {
      const type = 'round2.traversal.unknown-next';
      const group = makeGroup(type, 2, 'skip');
      const resolver = new CallbackResolver((model) => {
        group.type = type + '.missing';
        return new CardData(model);
      });
      registry.registerCard(type, resolver);
      const source = await new DataParser(() => {}).parse([group]);
      expect(snapshotTitles(source)).assertDeepEquals(['skip:0']);
      expect(resolver.models.length).assertEqual(1);
      expect(inspectProperty(group.data[1].style, 'width').hasGetter).assertFalse();
    });

    it('TraversalMutationTest_appendedTopLevelGroupIsVisited', 0, async () => {
      const type = 'round2.traversal.append-group';
      const laterType = type + '.later';
      const input = [makeGroup(type, 1, 'first')];
      const later = new RecordingResolver();
      registry.registerCard(laterType, later);
      registry.registerCard(type, new CallbackResolver((model) => {
        input.push(makeGroup(laterType, 1, 'appended'));
        return new CardData(model);
      }));
      const source = await new DataParser(() => {}).parse(input);
      expect(snapshotTitles(source)).assertDeepEquals(['first:0', 'appended:0']);
      expect(later.calls).assertEqual(1);
      expect(source.getData(1).data === input[1].data[0]).assertTrue();
    });

    it('TraversalMutationTest_replacingNextGroupChangesDispatch', 0, async () => {
      const type = 'round2.traversal.replace-group';
      const unusedType = type + '.unused';
      const replacementType = type + '.replacement';
      const unused = new RecordingResolver();
      const replacement = new RecordingResolver();
      registry.registerCard(unusedType, unused);
      registry.registerCard(replacementType, replacement);
      const input = [makeGroup(type, 1, 'first'), makeGroup(unusedType, 1, 'removed')];
      registry.registerCard(type, new CallbackResolver((model) => {
        input[1] = makeGroup(replacementType, 1, 'inserted');
        return new CardData(model);
      }));
      const source = await new DataParser(() => {}).parse(input);
      expect(snapshotTitles(source)).assertDeepEquals(['first:0', 'inserted:0']);
      expect(unused.calls).assertEqual(0);
      expect(replacement.calls).assertEqual(1);
    });

    it('TraversalMutationTest_truncatedTopLevelArrayDoesNotVisitRemovedGroup', 0, async () => {
      const type = 'round2.traversal.truncate-groups';
      const removedType = type + '.removed';
      const removed = new RecordingResolver();
      registry.registerCard(removedType, removed);
      const input = [makeGroup(type, 1, 'kept'), makeGroup(removedType, 1, 'removed')];
      registry.registerCard(type, new CallbackResolver((model) => {
        input.length = 1;
        return new CardData(model);
      }));
      const source = await new DataParser(() => {}).parse(input);
      expect(snapshotTitles(source)).assertDeepEquals(['kept:0']);
      expect(removed.calls).assertEqual(0);
    });

    it('TraversalMutationTest_sharedPayloadCreatesDistinctCardsWithoutCloningData', 0, async () => {
      const type = 'round2.traversal.payload-alias';
      const group = makeGroup(type, 1, 'shared');
      group.data.push(group.data[0]);
      const resolver = new RecordingResolver();
      registry.registerCard(type, resolver);
      const source = await new DataParser(() => {}).parse([group]);
      expect(resolver.calls).assertEqual(2);
      expect(source.getData(0) === source.getData(1)).assertFalse();
      expect(source.getData(0).data === source.getData(1).data).assertTrue();
      expect(source.getData(0).getObjectId() === source.getData(1).getObjectId()).assertFalse();
      expect(inspectProperty(group.data[0].style, 'width').hasGetter).assertTrue();
    });

  });
}
