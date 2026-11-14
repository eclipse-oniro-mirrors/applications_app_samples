/*
 * Copyright (c) 2026 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0.
 */

// @device-only: static JSON conversion, taskpool failures and record interop.
import { describe, it, expect, beforeEach } from '@ohos/hypium';
import { DataParserStaW } from 'library/src/main/ets/components/sta_wrapper/DataParserStaW';
import { RESOLVER_REGISTRY as registry } from 'library/src/main/ets/components/dyn/ResolverRegistry';
import { CardResolver } from '../../../../main/ets/pages/CardResolver';
import { TextCardData } from '../../../../main/ets/pages/TextCardData';
import { CardStyle, makeGroup, waitForNativeFactory, snapshotTitles } from '../Shared/ScenarioSupport';
import { CallbackResolver, expectRejection, yieldBetweenCases } from '../Shared/BoundarySupport';

export default function staticRecoveryTest(): void {
  describe('StaticRecoveryTest', () => {
    beforeEach(async () => {
      await yieldBetweenCases();
      await waitForNativeFactory();
    });

    it('StaticRecoveryTest_scalarJsonRootsProduceEmptySources', 0, async () => {
      const parser = new DataParserStaW();
      const scalars = ['0', 'false', '"not-a-layout"', 'null'];
      for (const input of scalars) {
        const source = await parser.parse(input);
        expect(source.totalCount()).assertEqual(0);
        expect(source.getData(0)).assertUndefined();
      }
    });

    it('StaticRecoveryTest_badPayloadStopsItsGroupButPreservesOtherGroups', 0, async () => {
      const type = 'round2.static.partial';
      registry.registerCard(type, new CardResolver());
      const group = makeGroup(type, 3, 'partial');
      const broken = '{"type":"' + type + '","data":[' + JSON.stringify(group.data[0]) +
        ',17,' + JSON.stringify(group.data[2]) + ']}';
      const next = JSON.stringify(makeGroup(type, 1, 'next'));
      const source = await new DataParserStaW().parse('[' + broken + ',' + next + ']');
      expect(snapshotTitles(source)).assertDeepEquals(['partial:0', 'next:0']);
      expect(source.getData(0) instanceof TextCardData).assertTrue();
      expect(source.getData(1) instanceof TextCardData).assertTrue();
    });

    it('StaticRecoveryTest_nonObjectGroupRejectsTaskAndParserRemainsReusable', 0, async () => {
      const type = 'round2.static.bad-group';
      registry.registerCard(type, new CardResolver());
      const group = JSON.stringify(makeGroup(type, 1, 'valid'));
      const parser = new DataParserStaW();
      let rejected = false;
      try {
        await parser.parse('[' + group + ',17,' + group + ']');
      } catch (error) {
        rejected = true;
      }
      expect(rejected).assertTrue();
      const recovered = await parser.parse('[' + group + ']');
      expect(snapshotTitles(recovered)).assertDeepEquals(['valid:0']);
    });

    it('StaticRecoveryTest_dynamicWidthRemainsEvaluableAcrossStaticBridge', 0, async () => {
      const type = 'round2.static.width';
      registry.registerCard(type, new CardResolver());
      const source = await new DataParserStaW().parse([makeGroup(type, 1, 'width')]);
      const style: CardStyle = source.getData(0).opt('style');
      const first = Number.parseFloat(style.width);
      expect(Number.isFinite(first)).assertTrue();
      expect(Number.parseFloat(style.width)).assertEqual(first - 10);
      expect(Number.parseFloat(style.width)).assertEqual(first - 20);
      expect(source.getData(0).opt('item').title.name).assertEqual('width:0');
    });

    it('StaticRecoveryTest_repeatedRealParsingAllocatesIndependentRecordGraphs', 0, async () => {
      const type = 'round2.static.record-graphs';
      registry.registerCard(type, new CardResolver());
      const input = [makeGroup(type, 1, 'record')];
      const parser = new DataParserStaW();
      const first = await parser.parse(input);
      const second = await parser.parse(input);
      expect(first.getData(0).data === second.getData(0).data).assertFalse();
      expect(first.getData(0).opt('item') === second.getData(0).opt('item')).assertFalse();
      expect(snapshotTitles(first)).assertDeepEquals(['record:0']);
      expect(snapshotTitles(second)).assertDeepEquals(['record:0']);
      expect(first.getData(0).data === input[0].data[0]).assertFalse();
    });

    it('StaticRecoveryTest_sharedInputPayloadDoesNotAliasNativeRecords', 0, async () => {
      const type = 'round2.static.alias-input';
      registry.registerCard(type, new CardResolver());
      const group = makeGroup(type, 1, 'aliased');
      group.data.push(group.data[0]);
      const source = await new DataParserStaW().parse([group]);
      expect(source.totalCount()).assertEqual(2);
      expect(group.data[0] === group.data[1]).assertTrue();
      expect(source.getData(0).data === source.getData(1).data).assertFalse();
      expect(source.getData(0).opt('item') === source.getData(1).opt('item')).assertFalse();
      expect(snapshotTitles(source)).assertDeepEquals(['aliased:0', 'aliased:0']);
    });

    it('StaticRecoveryTest_emptyNestedCollectionsRetainLengthsAndMembers', 0, async () => {
      const type = 'round2.static.empty-containers';
      registry.registerCard(type, new CardResolver());
      const source = await new DataParserStaW().parse(
        '[{"type":"' + type + '","data":[{"item":{"title":{"name":"empty"}},' +
        '"emptyObject":{},"emptyArray":[],"mixed":[[],{}]}]}]'
      );
      const card = source.getData(0);
      expect(source.totalCount()).assertEqual(1);
      expect(card.opt('emptyObject') !== undefined).assertTrue();
      expect(card.opt('emptyObject').length).assertUndefined();
      // Static arrays are interop objects; verify their exposed collection contract.
      expect(card.opt('emptyArray').length).assertEqual(0);
      expect(card.opt('mixed').length).assertEqual(2);
      expect(card.opt('mixed')[0].length).assertEqual(0);
      expect(card.opt('mixed')[1] !== undefined).assertTrue();
      expect(card.opt('mixed')[1].length).assertUndefined();
      expect(card.opt('item').title.name).assertEqual('empty');
    });

    it('StaticRecoveryTest_escapedKeysAndSurrogatePairsSurviveNativeJson', 0, async () => {
      const type = 'round2.static.escaped-keys';
      registry.registerCard(type, new CardResolver());
      const source = await new DataParserStaW().parse(
        '[{"type":"' + type + '","data":[{"it\\u0065m":{"title":{"name":"\\uD83D\\uDE00"}},' +
        '"line\\u0000break":7}]}]'
      );
      expect(source.getData(0).opt('item').title.name).assertEqual('\uD83D\uDE00');
      expect(source.getData(0).opt('line\u0000break')).assertEqual(7);
      expect(source.getData(0).type).assertEqual(type);
    });

    it('StaticRecoveryTest_dynamicResolverFailureAfterTaskSuccessCanRecover', 0, async () => {
      const type = 'round2.static.dynamic-failure';
      const failure = new Error('dynamic conversion rejected native result');
      const failing = new CallbackResolver(() => { throw failure; });
      registry.registerCard(type, failing);
      const parser = new DataParserStaW();
      const input = [makeGroup(type, 2, 'recovery')];
      await expectRejection(parser.parse(input), failure);
      expect(failing.models.length).assertEqual(1);
      registry.registerCard(type, new CardResolver());
      const recovered = await parser.parse(input);
      expect(snapshotTitles(recovered)).assertDeepEquals(['recovery:0', 'recovery:1']);
      expect(recovered.getData(0) instanceof TextCardData).assertTrue();
      expect(recovered.getData(1) instanceof TextCardData).assertTrue();
    });
  });
}
