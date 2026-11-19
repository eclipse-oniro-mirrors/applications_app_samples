/*
 * Copyright (c) 2026 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

import { beforeEach, describe, expect, it, Level, Size, TestType } from '@ohos/hypium';
import type { AppConfig, BundleSnapshot, ModuleConfig } from '../harness/ConfigModels';
import { ConfigSerializer } from '../harness/ConfigSerializer';
import { TestLog } from '../harness/TestLog';
import { ConfigFactory } from '../harness/ConfigFactory';
import { SAMPLE_BUNDLE_NAME } from '../harness/ConfigConstants';
export default function ConfigSerializerValidationTest(): void {
  describe('ConfigSerializerValidationTest', () => {
    // Yield a macrotask to keep large suites responsive to the main-thread watchdog.
    beforeEach(async (): Promise<void> => {
      await new Promise<void>((resolve: () => void) => {
        setTimeout(resolve, 1);
      });
    });

    /**
     * @tc.number    SUB_SYS_MODULE_CONFIG_4400
     * @tc.name      testSerializerSnapshotRoundTrip
     * @tc.desc      Checks that the sample snapshot survives a JSON round trip.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testSerializerSnapshotRoundTrip',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      TestLog.text('testSerializerSnapshotRoundTrip', 'case begin', 'snapshotroundtrip serializer check');
      TestLog.step('testSerializerSnapshotRoundTrip', 'snapshotroundtrip serializer check');
      const actual: boolean = ConfigSerializer.roundTripEquals(ConfigFactory.bundleSnapshot());
      TestLog.text('testSerializerSnapshotRoundTrip', 'actual value', String(actual));
      expect(actual).assertTrue();
      TestLog.text('testSerializerSnapshotRoundTrip', 'case end', 'snapshotroundtrip serializer check');
    })

    /**
     * @tc.number    SUB_SYS_MODULE_CONFIG_4401
     * @tc.name      testSerializerAppRoundTrip
     * @tc.desc      Checks that the sample app configuration survives a JSON round trip.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testSerializerAppRoundTrip',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      TestLog.text('testSerializerAppRoundTrip', 'case begin', 'approundtrip serializer check');
      TestLog.step('testSerializerAppRoundTrip', 'approundtrip serializer check');
      const actual: boolean = ConfigSerializer.appRoundTripEquals(ConfigFactory.appConfig());
      TestLog.text('testSerializerAppRoundTrip', 'actual value', String(actual));
      expect(actual).assertTrue();
      TestLog.text('testSerializerAppRoundTrip', 'case end', 'approundtrip serializer check');
    })

    /**
     * @tc.number    SUB_SYS_MODULE_CONFIG_4402
     * @tc.name      testSerializerEntryModuleRoundTrip
     * @tc.desc      Checks that the entry module survives a JSON round trip.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testSerializerEntryModuleRoundTrip',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      TestLog.text('testSerializerEntryModuleRoundTrip', 'case begin', 'entrymoduleroundtrip serializer check');
      TestLog.step('testSerializerEntryModuleRoundTrip', 'entrymoduleroundtrip serializer check');
      const actual: boolean = ConfigSerializer.moduleRoundTripEquals(ConfigFactory.entryModule());
      TestLog.text('testSerializerEntryModuleRoundTrip', 'actual value', String(actual));
      expect(actual).assertTrue();
      TestLog.text('testSerializerEntryModuleRoundTrip', 'case end', 'entrymoduleroundtrip serializer check');
    })

    /**
     * @tc.number    SUB_SYS_MODULE_CONFIG_4403
     * @tc.name      testSerializerFeatureModuleRoundTrip
     * @tc.desc      Checks that the feature module survives a JSON round trip.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testSerializerFeatureModuleRoundTrip',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      TestLog.text('testSerializerFeatureModuleRoundTrip', 'case begin', 'featuremoduleroundtrip serializer check');
      TestLog.step('testSerializerFeatureModuleRoundTrip', 'featuremoduleroundtrip serializer check');
      const actual: boolean = ConfigSerializer.moduleRoundTripEquals(ConfigFactory.featureModule());
      TestLog.text('testSerializerFeatureModuleRoundTrip', 'actual value', String(actual));
      expect(actual).assertTrue();
      TestLog.text('testSerializerFeatureModuleRoundTrip', 'case end', 'featuremoduleroundtrip serializer check');
    })

    /**
     * @tc.number    SUB_SYS_MODULE_CONFIG_4404
     * @tc.name      testSerializerCustomModuleRoundTrip
     * @tc.desc      Checks that a renamed feature module survives a JSON round trip.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testSerializerCustomModuleRoundTrip',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      TestLog.text('testSerializerCustomModuleRoundTrip', 'case begin', 'custommoduleroundtrip serializer check');
      TestLog.step('testSerializerCustomModuleRoundTrip', 'custommoduleroundtrip serializer check');
      const actual: boolean = 
        ConfigSerializer.moduleRoundTripEquals(ConfigFactory.featureModuleNamed('feature_custom'));
      TestLog.text('testSerializerCustomModuleRoundTrip', 'actual value', String(actual));
      expect(actual).assertTrue();
      TestLog.text('testSerializerCustomModuleRoundTrip', 'case end', 'custommoduleroundtrip serializer check');
    })

    /**
     * @tc.number    SUB_SYS_MODULE_CONFIG_4405
     * @tc.name      testSerializerSerializedLength
     * @tc.desc      Checks that the serialized snapshot is not empty.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testSerializerSerializedLength',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      TestLog.text('testSerializerSerializedLength', 'case begin', 'serializedlength serializer check');
      TestLog.step('testSerializerSerializedLength', 'serializedlength serializer check');
      const actual: boolean = ConfigSerializer.serializedLength(ConfigFactory.bundleSnapshot()) > 0;
      TestLog.text('testSerializerSerializedLength', 'actual value', String(actual));
      expect(actual).assertTrue();
      TestLog.text('testSerializerSerializedLength', 'case end', 'serializedlength serializer check');
    })

    /**
     * @tc.number    SUB_SYS_MODULE_CONFIG_4406
     * @tc.name      testSerializerContainsModulesKey
     * @tc.desc      Checks that the serialized snapshot contains the modules key.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testSerializerContainsModulesKey',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      TestLog.text('testSerializerContainsModulesKey', 'case begin', 'containsmoduleskey serializer check');
      TestLog.step('testSerializerContainsModulesKey', 'containsmoduleskey serializer check');
      const actual: boolean = ConfigSerializer.containsKey(ConfigFactory.bundleSnapshot(), 'modules');
      TestLog.text('testSerializerContainsModulesKey', 'actual value', String(actual));
      expect(actual).assertTrue();
      TestLog.text('testSerializerContainsModulesKey', 'case end', 'containsmoduleskey serializer check');
    })

    /**
     * @tc.number    SUB_SYS_MODULE_CONFIG_4407
     * @tc.name      testSerializerContainsAppKey
     * @tc.desc      Checks that the serialized snapshot contains the app key.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testSerializerContainsAppKey',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      TestLog.text('testSerializerContainsAppKey', 'case begin', 'containsappkey serializer check');
      TestLog.step('testSerializerContainsAppKey', 'containsappkey serializer check');
      const actual: boolean = ConfigSerializer.containsKey(ConfigFactory.bundleSnapshot(), 'app');
      TestLog.text('testSerializerContainsAppKey', 'actual value', String(actual));
      expect(actual).assertTrue();
      TestLog.text('testSerializerContainsAppKey', 'case end', 'containsappkey serializer check');
    })

    /**
     * @tc.number    SUB_SYS_MODULE_CONFIG_4408
     * @tc.name      testSerializerMissingKey
     * @tc.desc      Checks that an absent key is not found.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testSerializerMissingKey',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      TestLog.text('testSerializerMissingKey', 'case begin', 'missingkey serializer check');
      TestLog.step('testSerializerMissingKey', 'missingkey serializer check');
      const actual: boolean = ConfigSerializer.containsKey(ConfigFactory.bundleSnapshot(), 'ghost_key');
      TestLog.text('testSerializerMissingKey', 'actual value', String(actual));
      expect(actual).assertFalse();
      TestLog.text('testSerializerMissingKey', 'case end', 'missingkey serializer check');
    })

    /**
     * @tc.number    SUB_SYS_MODULE_CONFIG_4409
     * @tc.name      testSerializerDeserializeSample
     * @tc.desc      Checks that the serialized snapshot deserializes again.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testSerializerDeserializeSample',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      TestLog.text('testSerializerDeserializeSample', 'case begin', 'deserializesample serializer check');
      TestLog.step('testSerializerDeserializeSample', 'deserializesample serializer check');
      const actual: boolean = 
        ConfigSerializer.deserialize(ConfigSerializer.serialize(ConfigFactory.bundleSnapshot())) === null;
      TestLog.text('testSerializerDeserializeSample', 'actual value', String(actual));
      expect(actual).assertFalse();
      TestLog.text('testSerializerDeserializeSample', 'case end', 'deserializesample serializer check');
    })

    /**
     * @tc.number    SUB_SYS_MODULE_CONFIG_4410
     * @tc.name      testSerializerDeserializeEmpty
     * @tc.desc      Checks that an empty text does not deserialize.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testSerializerDeserializeEmpty',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      TestLog.text('testSerializerDeserializeEmpty', 'case begin', 'deserializeempty serializer check');
      TestLog.step('testSerializerDeserializeEmpty', 'deserializeempty serializer check');
      const actual: boolean = ConfigSerializer.deserialize('') === null;
      TestLog.text('testSerializerDeserializeEmpty', 'actual value', String(actual));
      expect(actual).assertTrue();
      TestLog.text('testSerializerDeserializeEmpty', 'case end', 'deserializeempty serializer check');
    })

    /**
     * @tc.number    SUB_SYS_MODULE_CONFIG_4411
     * @tc.name      testSerializerDeserializeSpaces
     * @tc.desc      Checks that a whitespace text does not deserialize.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testSerializerDeserializeSpaces',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      TestLog.text('testSerializerDeserializeSpaces', 'case begin', 'deserializespaces serializer check');
      TestLog.step('testSerializerDeserializeSpaces', 'deserializespaces serializer check');
      const actual: boolean = ConfigSerializer.deserialize('   ') === null;
      TestLog.text('testSerializerDeserializeSpaces', 'actual value', String(actual));
      expect(actual).assertTrue();
      TestLog.text('testSerializerDeserializeSpaces', 'case end', 'deserializespaces serializer check');
    })

    /**
     * @tc.number    SUB_SYS_MODULE_CONFIG_4412
     * @tc.name      testSerializerDeserializeBroken
     * @tc.desc      Checks that a broken json text does not deserialize.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testSerializerDeserializeBroken',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      TestLog.text('testSerializerDeserializeBroken', 'case begin', 'deserializebroken serializer check');
      TestLog.step('testSerializerDeserializeBroken', 'deserializebroken serializer check');
      const actual: boolean = ConfigSerializer.deserialize('not json') === null;
      TestLog.text('testSerializerDeserializeBroken', 'actual value', String(actual));
      expect(actual).assertTrue();
      TestLog.text('testSerializerDeserializeBroken', 'case end', 'deserializebroken serializer check');
    })

    /**
     * @tc.number    SUB_SYS_MODULE_CONFIG_4413
     * @tc.name      testSerializerDeserializeEmptyObject
     * @tc.desc      Checks that an empty object does not deserialize.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testSerializerDeserializeEmptyObject',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      TestLog.text('testSerializerDeserializeEmptyObject', 'case begin', 'deserializeemptyobject serializer check');
      TestLog.step('testSerializerDeserializeEmptyObject', 'deserializeemptyobject serializer check');
      const actual: boolean = ConfigSerializer.deserialize('{}') === null;
      TestLog.text('testSerializerDeserializeEmptyObject', 'actual value', String(actual));
      expect(actual).assertTrue();
      TestLog.text('testSerializerDeserializeEmptyObject', 'case end', 'deserializeemptyobject serializer check');
    })

    /**
     * @tc.number    SUB_SYS_MODULE_CONFIG_4414
     * @tc.name      testSerializerDeserializeArray
     * @tc.desc      Checks that a json array does not deserialize.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testSerializerDeserializeArray',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      TestLog.text('testSerializerDeserializeArray', 'case begin', 'deserializearray serializer check');
      TestLog.step('testSerializerDeserializeArray', 'deserializearray serializer check');
      const actual: boolean = ConfigSerializer.deserialize('[]') === null;
      TestLog.text('testSerializerDeserializeArray', 'actual value', String(actual));
      expect(actual).assertTrue();
      TestLog.text('testSerializerDeserializeArray', 'case end', 'deserializearray serializer check');
    })

    /**
     * @tc.number    SUB_SYS_MODULE_CONFIG_4415
     * @tc.name      testSerializerDeserializeMinimal
     * @tc.desc      Checks that the minimal snapshot text deserializes.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testSerializerDeserializeMinimal',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      TestLog.text('testSerializerDeserializeMinimal', 'case begin', 'deserializeminimal serializer check');
      TestLog.step('testSerializerDeserializeMinimal', 'deserializeminimal serializer check');
      const actual: boolean = ConfigSerializer.deserialize(ConfigSerializer.minimalSnapshotText('entry')) === null;
      TestLog.text('testSerializerDeserializeMinimal', 'actual value', String(actual));
      expect(actual).assertFalse();
      TestLog.text('testSerializerDeserializeMinimal', 'case end', 'deserializeminimal serializer check');
    })

    /**
     * @tc.number    SUB_SYS_MODULE_CONFIG_4416
     * @tc.name      testSerializerMinimalModuleCount
     * @tc.desc      Checks that the minimal snapshot text declares one module.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testSerializerMinimalModuleCount',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      TestLog.text('testSerializerMinimalModuleCount', 'case begin', 'minimalmodulecount serializer check');
      TestLog.step('testSerializerMinimalModuleCount', 'minimalmodulecount serializer check');
      const actual: number = 
        (ConfigSerializer.deserialize(ConfigSerializer.minimalSnapshotText('entry')) as BundleSnapshot).modules.length;
      TestLog.text('testSerializerMinimalModuleCount', 'actual value', String(actual));
      expect(actual).assertEqual(1);
      TestLog.text('testSerializerMinimalModuleCount', 'case end', 'minimalmodulecount serializer check');
    })

    /**
     * @tc.number    SUB_SYS_MODULE_CONFIG_4417
     * @tc.name      testSerializerMinimalRoundTrip
     * @tc.desc      Checks that the minimal snapshot text survives a round trip.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testSerializerMinimalRoundTrip',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      TestLog.text('testSerializerMinimalRoundTrip', 'case begin', 'minimalroundtrip serializer check');
      TestLog.step('testSerializerMinimalRoundTrip', 'minimalroundtrip serializer check');
      const actual: boolean = 
        ConfigSerializer.roundTripEquals(ConfigSerializer.deserialize(ConfigSerializer.minimalSnapshotText('entry')) as 
          BundleSnapshot);
      TestLog.text('testSerializerMinimalRoundTrip', 'actual value', String(actual));
      expect(actual).assertTrue();
      TestLog.text('testSerializerMinimalRoundTrip', 'case end', 'minimalroundtrip serializer check');
    })

    /**
     * @tc.number    SUB_SYS_MODULE_CONFIG_4418
     * @tc.name      testSerializerAppIsSnapshot
     * @tc.desc      Checks that an app configuration is not a snapshot.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testSerializerAppIsSnapshot',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      TestLog.text('testSerializerAppIsSnapshot', 'case begin', 'appissnapshot serializer check');
      TestLog.step('testSerializerAppIsSnapshot', 'appissnapshot serializer check');
      const actual: boolean = ConfigSerializer.isSnapshot(ConfigFactory.appConfig() as object as BundleSnapshot);
      TestLog.text('testSerializerAppIsSnapshot', 'actual value', String(actual));
      expect(actual).assertFalse();
      TestLog.text('testSerializerAppIsSnapshot', 'case end', 'appissnapshot serializer check');
    })

    /**
     * @tc.number    SUB_SYS_MODULE_CONFIG_4419
     * @tc.name      testSerializerSnapshotIsSnapshot
     * @tc.desc      Checks that the sample bundle is a snapshot.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testSerializerSnapshotIsSnapshot',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      TestLog.text('testSerializerSnapshotIsSnapshot', 'case begin', 'snapshotissnapshot serializer check');
      TestLog.step('testSerializerSnapshotIsSnapshot', 'snapshotissnapshot serializer check');
      const actual: boolean = ConfigSerializer.isSnapshot(ConfigFactory.bundleSnapshot());
      TestLog.text('testSerializerSnapshotIsSnapshot', 'actual value', String(actual));
      expect(actual).assertTrue();
      TestLog.text('testSerializerSnapshotIsSnapshot', 'case end', 'snapshotissnapshot serializer check');
    })

    /**
     * @tc.number    SUB_SYS_MODULE_CONFIG_4420
     * @tc.name      testSerializerAppIsAppConfig
     * @tc.desc      Checks that the sample app configuration is an app configuration.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testSerializerAppIsAppConfig',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      TestLog.text('testSerializerAppIsAppConfig', 'case begin', 'appisappconfig serializer check');
      TestLog.step('testSerializerAppIsAppConfig', 'appisappconfig serializer check');
      const actual: boolean = ConfigSerializer.isAppConfig(ConfigFactory.appConfig());
      TestLog.text('testSerializerAppIsAppConfig', 'actual value', String(actual));
      expect(actual).assertTrue();
      TestLog.text('testSerializerAppIsAppConfig', 'case end', 'appisappconfig serializer check');
    })

    /**
     * @tc.number    SUB_SYS_MODULE_CONFIG_4421
     * @tc.name      testSerializerModuleIsNotAppConfig
     * @tc.desc      Checks that a module configuration is not an app configuration.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testSerializerModuleIsNotAppConfig',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      TestLog.text('testSerializerModuleIsNotAppConfig', 'case begin', 'moduleisnotappconfig serializer check');
      TestLog.step('testSerializerModuleIsNotAppConfig', 'moduleisnotappconfig serializer check');
      const actual: boolean = ConfigSerializer.isAppConfig(ConfigFactory.entryModule() as object as AppConfig);
      TestLog.text('testSerializerModuleIsNotAppConfig', 'actual value', String(actual));
      expect(actual).assertFalse();
      TestLog.text('testSerializerModuleIsNotAppConfig', 'case end', 'moduleisnotappconfig serializer check');
    })

    /**
     * @tc.number    SUB_SYS_MODULE_CONFIG_4422
     * @tc.name      testSerializerModuleIsModuleConfig
     * @tc.desc      Checks that the entry module is a module configuration.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testSerializerModuleIsModuleConfig',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      TestLog.text('testSerializerModuleIsModuleConfig', 'case begin', 'moduleismoduleconfig serializer check');
      TestLog.step('testSerializerModuleIsModuleConfig', 'moduleismoduleconfig serializer check');
      const actual: boolean = ConfigSerializer.isModuleConfig(ConfigFactory.entryModule());
      TestLog.text('testSerializerModuleIsModuleConfig', 'actual value', String(actual));
      expect(actual).assertTrue();
      TestLog.text('testSerializerModuleIsModuleConfig', 'case end', 'moduleismoduleconfig serializer check');
    })

    /**
     * @tc.number    SUB_SYS_MODULE_CONFIG_4423
     * @tc.name      testSerializerAppIsNotModuleConfig
     * @tc.desc      Checks that an app configuration is not a module configuration.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testSerializerAppIsNotModuleConfig',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      TestLog.text('testSerializerAppIsNotModuleConfig', 'case begin', 'appisnotmoduleconfig serializer check');
      TestLog.step('testSerializerAppIsNotModuleConfig', 'appisnotmoduleconfig serializer check');
      const actual: boolean = ConfigSerializer.isModuleConfig(ConfigFactory.appConfig() as object as ModuleConfig);
      TestLog.text('testSerializerAppIsNotModuleConfig', 'actual value', String(actual));
      expect(actual).assertFalse();
      TestLog.text('testSerializerAppIsNotModuleConfig', 'case end', 'appisnotmoduleconfig serializer check');
    })

    /**
     * @tc.number    SUB_SYS_MODULE_CONFIG_4424
     * @tc.name      testSerializerDeserializeAppFromModuleText
     * @tc.desc      Checks that module text does not deserialize as an app configuration.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testSerializerDeserializeAppFromModuleText',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      TestLog.text('testSerializerDeserializeAppFromModuleText', 
        'case begin', 'deserializeappfrommoduletext serializer check');
      TestLog.step('testSerializerDeserializeAppFromModuleText', 'deserializeappfrommoduletext serializer check');
      const actual: boolean = 
        ConfigSerializer.deserializeApp(ConfigSerializer.serializeModule(ConfigFactory.entryModule())) === null;
      TestLog.text('testSerializerDeserializeAppFromModuleText', 'actual value', String(actual));
      expect(actual).assertTrue();
      TestLog.text('testSerializerDeserializeAppFromModuleText', 
        'case end', 'deserializeappfrommoduletext serializer check');
    })

    /**
     * @tc.number    SUB_SYS_MODULE_CONFIG_4425
     * @tc.name      testSerializerDeserializeModuleFromAppText
     * @tc.desc      Checks that app text does not deserialize as a module configuration.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testSerializerDeserializeModuleFromAppText',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      TestLog.text('testSerializerDeserializeModuleFromAppText', 
        'case begin', 'deserializemodulefromapptext serializer check');
      TestLog.step('testSerializerDeserializeModuleFromAppText', 'deserializemodulefromapptext serializer check');
      const actual: boolean = 
        ConfigSerializer.deserializeModule(ConfigSerializer.serializeApp(ConfigFactory.appConfig())) === null;
      TestLog.text('testSerializerDeserializeModuleFromAppText', 'actual value', String(actual));
      expect(actual).assertTrue();
      TestLog.text('testSerializerDeserializeModuleFromAppText', 
        'case end', 'deserializemodulefromapptext serializer check');
    })

    /**
     * @tc.number    SUB_SYS_MODULE_CONFIG_4426
     * @tc.name      testSerializerSerializedStartsWithBrace
     * @tc.desc      Checks that the serialized snapshot starts with a brace.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testSerializerSerializedStartsWithBrace',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      TestLog.text('testSerializerSerializedStartsWithBrace', 
        'case begin', 'serializedstartswithbrace serializer check');
      TestLog.step('testSerializerSerializedStartsWithBrace', 'serializedstartswithbrace serializer check');
      const actual: string = ConfigSerializer.serialize(ConfigFactory.bundleSnapshot()).substring(0, 1);
      TestLog.text('testSerializerSerializedStartsWithBrace', 'actual value', String(actual));
      expect(actual).assertEqual('{');
      TestLog.text('testSerializerSerializedStartsWithBrace', 'case end', 'serializedstartswithbrace serializer check');
    })

    /**
     * @tc.number    SUB_SYS_MODULE_CONFIG_4427
     * @tc.name      testSerializerSerializedContainsEntry
     * @tc.desc      Checks that the serialized snapshot contains the entry module name.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testSerializerSerializedContainsEntry',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      TestLog.text('testSerializerSerializedContainsEntry', 'case begin', 'serializedcontainsentry serializer check');
      TestLog.step('testSerializerSerializedContainsEntry', 'serializedcontainsentry serializer check');
      const actual: boolean = ConfigSerializer.serialize(ConfigFactory.bundleSnapshot()).indexOf('entry') >= 0;
      TestLog.text('testSerializerSerializedContainsEntry', 'actual value', String(actual));
      expect(actual).assertTrue();
      TestLog.text('testSerializerSerializedContainsEntry', 'case end', 'serializedcontainsentry serializer check');
    })

    /**
     * @tc.number    SUB_SYS_MODULE_CONFIG_4428
     * @tc.name      testSerializerSerializedContainsFeature
     * @tc.desc      Checks that the serialized snapshot contains the feature module name.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testSerializerSerializedContainsFeature',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      TestLog.text('testSerializerSerializedContainsFeature', 
        'case begin', 'serializedcontainsfeature serializer check');
      TestLog.step('testSerializerSerializedContainsFeature', 'serializedcontainsfeature serializer check');
      const actual: boolean = ConfigSerializer.serialize(ConfigFactory.bundleSnapshot()).indexOf('feature') >= 0;
      TestLog.text('testSerializerSerializedContainsFeature', 'actual value', String(actual));
      expect(actual).assertTrue();
      TestLog.text('testSerializerSerializedContainsFeature', 'case end', 'serializedcontainsfeature serializer check');
    })

    /**
     * @tc.number    SUB_SYS_MODULE_CONFIG_4429
     * @tc.name      testSerializerSerializedContainsBundleName
     * @tc.desc      Checks that the serialized snapshot contains the bundle name.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testSerializerSerializedContainsBundleName',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      TestLog.text('testSerializerSerializedContainsBundleName', 
        'case begin', 'serializedcontainsbundlename serializer check');
      TestLog.step('testSerializerSerializedContainsBundleName', 'serializedcontainsbundlename serializer check');
      const actual: boolean = 
        ConfigSerializer.serialize(ConfigFactory.bundleSnapshot()).indexOf(SAMPLE_BUNDLE_NAME) >= 0;
      TestLog.text('testSerializerSerializedContainsBundleName', 'actual value', String(actual));
      expect(actual).assertTrue();
      TestLog.text('testSerializerSerializedContainsBundleName', 
        'case end', 'serializedcontainsbundlename serializer check');
    })

  })
}
