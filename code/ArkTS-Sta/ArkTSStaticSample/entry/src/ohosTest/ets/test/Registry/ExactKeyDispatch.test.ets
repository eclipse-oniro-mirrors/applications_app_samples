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

export default function exactKeyDispatchTest(): void {
  describe('ExactKeyDispatchTest', () => {
    beforeEach(yieldBetweenCases);

    it('ExactKeyDispatchTest_emptyTypeCanBeRegisteredAndParsed', 0, async () => {
      const resolver = new RecordingResolver();
      const previous = registry.getCardResolver('');
      registry.registerCard('', resolver);
      try {
        const source = await new DataParser(() => {}).parse([makeGroup('', 1, 'empty-key')]);
        expect(source.totalCount()).assertEqual(1);
        expect(source.getData(0).type).assertEqual('');
        expect(resolver.calls).assertEqual(1);
        expect(snapshotTitles(source)).assertDeepEquals(['empty-key:0']);
      } finally {
        if (previous !== undefined) {
          registry.registerCard('', previous);
        }
      }
    });

    it('ExactKeyDispatchTest_objectPrototypeNamesRemainIndependentTypeKeys', 0, async () => {
      const keys = ['__proto__', 'constructor', 'hasOwnProperty', 'toString'];
      const resolvers: RecordingResolver[] = [];
      const previous = keys.map((key: string) => registry.getCardResolver(key));
      try {
        for (const key of keys) {
          const resolver = new RecordingResolver();
          resolvers.push(resolver);
          registry.registerCard(key, resolver);
        }
        const source = await new DataParser(() => {}).parse(
          keys.map((key: string) => makeGroup(key, 1, key))
        );
        expect(source.totalCount()).assertEqual(keys.length);
        for (let index = 0; index < keys.length; index++) {
          expect(source.getData(index).type).assertEqual(keys[index]);
          expect(resolvers[index].calls).assertEqual(1);
          expect(registry.getCardResolver(keys[index]) === resolvers[index]).assertTrue();
        }
      } finally {
        for (let index = 0; index < keys.length; index++) {
          if (previous[index] !== undefined) {
            registry.registerCard(keys[index], previous[index]!);
          }
        }
      }
    });

    it('ExactKeyDispatchTest_caseVariantsDoNotAliasOneRegistration', 0, async () => {
      const lower = 'round2.registry.case';
      const upper = 'round2.registry.CASE';
      const first = new RecordingResolver();
      const second = new RecordingResolver();
      registry.registerCard(lower, first);
      registry.registerCard(upper, second);
      const source = await new DataParser(() => {}).parse([
        makeGroup(lower, 1, 'lower'), makeGroup(upper, 1, 'upper')
      ]);
      expect(snapshotTitles(source)).assertDeepEquals(['lower:0', 'upper:0']);
      expect(first.models[0].type).assertEqual(lower);
      expect(second.models[0].type).assertEqual(upper);
      expect(registry.getCardResolver('round2.registry.Case')).assertUndefined();
    });

    it('ExactKeyDispatchTest_whitespaceIsNotTrimmedBeforeLookup', 0, async () => {
      const type = 'round2.registry.space';
      const spaced = ' ' + type + ' ';
      const resolver = new RecordingResolver();
      registry.registerCard(type, resolver);
      const parser = new DataParser(() => {});
      const first = await parser.parse([makeGroup(spaced, 1, 'unregistered')]);
      expect(first.totalCount()).assertEqual(0);
      expect(resolver.calls).assertEqual(0);
      const spacedResolver = new RecordingResolver();
      registry.registerCard(spaced, spacedResolver);
      const second = await parser.parse([makeGroup(spaced, 1, 'registered')]);
      expect(second.getData(0).type).assertEqual(spaced);
      expect(spacedResolver.calls).assertEqual(1);
      expect(resolver.calls).assertEqual(0);
    });

    it('ExactKeyDispatchTest_unicodeNormalizationDoesNotMergeKeys', 0, async () => {
      const composed = 'round2.registry.\u00e9';
      const decomposed = 'round2.registry.e\u0301';
      const resolver = new RecordingResolver();
      registry.registerCard(composed, resolver);
      const parser = new DataParser(() => {});
      const missing = await parser.parse([makeGroup(decomposed, 1, 'decomposed')]);
      expect(missing.totalCount()).assertEqual(0);
      const other = new RecordingResolver();
      registry.registerCard(decomposed, other);
      const source = await parser.parse([
        makeGroup(composed, 1, 'composed'), makeGroup(decomposed, 1, 'decomposed')
      ]);
      expect(source.totalCount()).assertEqual(2);
      expect(resolver.calls).assertEqual(1);
      expect(other.calls).assertEqual(1);
      expect(source.getData(0).type === source.getData(1).type).assertFalse();
    });

    it('ExactKeyDispatchTest_embeddedNullIsNotTreatedAsStringTerminator', 0, async () => {
      const prefix = 'round2.registry.nul';
      const full = prefix + '\u0000suffix';
      const prefixResolver = new RecordingResolver();
      const fullResolver = new RecordingResolver();
      registry.registerCard(prefix, prefixResolver);
      registry.registerCard(full, fullResolver);
      const source = await new DataParser(() => {}).parse(JSON.stringify([
        makeGroup(full, 1, 'full'), makeGroup(prefix, 1, 'prefix')
      ]));
      expect(source.getData(0).type).assertEqual(full);
      expect(source.getData(1).type).assertEqual(prefix);
      expect(fullResolver.calls).assertEqual(1);
      expect(prefixResolver.calls).assertEqual(1);
    });

    it('ExactKeyDispatchTest_sharedResolverReceivesEachRegisteredType', 0, async () => {
      const firstType = 'round2.registry.shared-a';
      const secondType = 'round2.registry.shared-b';
      const shared = new RecordingResolver();
      registry.registerCard(firstType, shared);
      registry.registerCard(secondType, shared);
      const source = await new DataParser(() => {}).parse([
        makeGroup(firstType, 1, 'a'), makeGroup(secondType, 1, 'b')
      ]);
      expect(shared.calls).assertEqual(2);
      expect(shared.models.map((model) => model.type)).assertDeepEquals([firstType, secondType]);
      expect(source.getData(0).type).assertEqual(firstType);
      expect(source.getData(1).type).assertEqual(secondType);
    });

    it('ExactKeyDispatchTest_registrationRetainsLiveResolverBehavior', 0, async () => {
      const type = 'round2.registry.live-resolver';
      const resolver = new CallbackResolver((model) => new CardData(model));
      registry.registerCard(type, resolver);
      resolver.action = (model) => {
        model.data.item.title.name = 'modified-after-registration';
        return new CardData(model);
      };
      const source = await new DataParser(() => {}).parse([makeGroup(type, 1, 'original')]);
      expect(snapshotTitles(source)).assertDeepEquals(['modified-after-registration']);
      expect(registry.getCardResolver(type) === resolver).assertTrue();
      expect(resolver.models.length).assertEqual(1);
    });
  });
}
