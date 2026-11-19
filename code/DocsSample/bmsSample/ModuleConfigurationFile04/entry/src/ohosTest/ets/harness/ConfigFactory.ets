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

import type {
  AbilityConfig,
  AppConfig,
  AtomicServiceConfig,
  BundleSnapshot,
  ExtensionAbilityConfig,
  ModuleConfig,
  PreloadConfig,
  SkillConfig,
  UriConfig
} from './ConfigModels';
import {
  DEVICE_TYPE_PHONE,
  DEVICE_TYPE_TABLET,
  ENTRY_ABILITY_NAME,
  ENTRY_MODULE_NAME,
  FEATURE_ABILITY_NAME,
  FEATURE_MODULE_NAME,
  HOME_ACTION,
  HOME_ENTITY,
  MODULE_TYPE_ENTRY,
  MODULE_TYPE_FEATURE,
  SAMPLE_BUNDLE_NAME,
  SAMPLE_VENDOR,
  SAMPLE_VERSION_CODE,
  SAMPLE_VERSION_NAME
} from './ConfigConstants';

/**
 * Builds sample configuration models that mirror app.json5 and module.json5.
 */
export class ConfigFactory {
  /**
   * Returns the application level configuration used by the sample.
   */
  public static appConfig(): AppConfig {
    const config: AppConfig = {
      bundleName: SAMPLE_BUNDLE_NAME,
      vendor: SAMPLE_VENDOR,
      versionCode: SAMPLE_VERSION_CODE,
      versionName: SAMPLE_VERSION_NAME,
      icon: '$media:layered_image',
      label: '$string:app_name'
    };
    return config;
  }

  /**
   * Returns an empty uri configuration.
   */
  public static emptyUri(): UriConfig {
    const uri: UriConfig = {
      scheme: '',
      host: '',
      path: ''
    };
    return uri;
  }

  /**
   * Returns the home skill declared by the entry ability.
   */
  public static entrySkill(): SkillConfig {
    const skill: SkillConfig = {
      entities: [HOME_ENTITY],
      actions: [HOME_ACTION],
      uris: []
    };
    return skill;
  }

  /**
   * Returns the home skill declared by the feature ability.
   */
  public static featureSkill(): SkillConfig {
    const skill: SkillConfig = {
      entities: [HOME_ENTITY],
      actions: [HOME_ACTION],
      uris: []
    };
    return skill;
  }

  /**
   * Returns the entry ability declared by module.json5.
   */
  public static entryAbility(): AbilityConfig {
    const ability: AbilityConfig = {
      name: ENTRY_ABILITY_NAME,
      srcEntry: './ets/entryability/EntryAbility.ets',
      description: '$string:EntryAbility_desc',
      icon: '$media:layered_image',
      label: '$string:EntryAbility_label',
      startWindowIcon: '$media:startIcon',
      startWindowBackground: '$color:start_window_background',
      exported: true,
      launchType: 'singleton',
      orientation: 'unspecified',
      skills: [ConfigFactory.entrySkill()]
    };
    return ability;
  }

  /**
   * Returns the feature ability declared by module.json5.
   */
  public static featureAbility(): AbilityConfig {
    const ability: AbilityConfig = {
      name: FEATURE_ABILITY_NAME,
      srcEntry: './ets/featureability/FeatureAbility.ets',
      description: '$string:FeatureAbility_desc',
      icon: '$media:icon',
      label: '$string:FeatureAbility_label',
      startWindowIcon: '$media:startIcon',
      startWindowBackground: '$color:start_window_background',
      exported: true,
      launchType: 'singleton',
      orientation: 'unspecified',
      skills: [ConfigFactory.featureSkill()]
    };
    return ability;
  }

  /**
   * Returns the atomicService preload configuration of the entry module.
   */
  public static entryAtomicService(): AtomicServiceConfig {
    const preload: PreloadConfig = {
      moduleName: FEATURE_MODULE_NAME
    };
    const atomicService: AtomicServiceConfig = {
      preloads: [preload],
      resizeable: true
    };
    return atomicService;
  }

  /**
   * Returns the entry module declared by module.json5.
   */
  public static entryModule(): ModuleConfig {
    const moduleConfig: ModuleConfig = {
      name: ENTRY_MODULE_NAME,
      type: MODULE_TYPE_ENTRY,
      description: '$string:module_desc',
      mainElement: ENTRY_ABILITY_NAME,
      deviceTypes: [DEVICE_TYPE_TABLET, DEVICE_TYPE_PHONE],
      deliveryWithInstall: true,
      installationFree: false,
      pages: '$profile:main_pages',
      abilities: [ConfigFactory.entryAbility()],
      extensionAbilities: [],
      atomicService: ConfigFactory.entryAtomicService()
    };
    return moduleConfig;
  }

  /**
   * Returns the feature module declared by module.json5.
   */
  public static featureModule(): ModuleConfig {
    const featureModule: ModuleConfig = {
      name: FEATURE_MODULE_NAME,
      type: MODULE_TYPE_FEATURE,
      description: '$string:module_desc',
      mainElement: FEATURE_ABILITY_NAME,
      deviceTypes: [DEVICE_TYPE_TABLET, DEVICE_TYPE_PHONE],
      deliveryWithInstall: true,
      installationFree: true,
      pages: '$profile:main_pages',
      abilities: [ConfigFactory.featureAbility()],
      extensionAbilities: [],
      atomicService: null
    };
    return featureModule;
  }

  /**
   * Returns a feature module with the requested module name.
   */
  public static featureModuleNamed(moduleName: string): ModuleConfig {
    const featureModule: ModuleConfig = ConfigFactory.featureModule();
    featureModule.name = moduleName;
    return featureModule;
  }

  /**
   * Returns a feature module carrying an empty atomicService block.
   */
  public static featureModuleWithAtomicService(moduleName: string): ModuleConfig {
    const featureModule: ModuleConfig = ConfigFactory.featureModuleNamed(moduleName);
    const atomicService: AtomicServiceConfig = {
      preloads: [],
      resizeable: true
    };
    featureModule.atomicService = atomicService;
    return featureModule;
  }

  /**
   * Returns the two module bundle declared by the sample.
   */
  public static bundleSnapshot(): BundleSnapshot {
    const snapshot: BundleSnapshot = {
      app: ConfigFactory.appConfig(),
      modules: [ConfigFactory.entryModule(), ConfigFactory.featureModule()]
    };
    return snapshot;
  }

  /**
   * Returns a bundle snapshot carrying the requested modules.
   */
  public static snapshotWith(modules: ModuleConfig[]): BundleSnapshot {
    const snapshot: BundleSnapshot = {
      app: ConfigFactory.appConfig(),
      modules: modules
    };
    return snapshot;
  }

  /**
   * Returns an extension ability record with the requested name and type.
   */
  public static extensionAbility(name: string, type: string): ExtensionAbilityConfig {
    const extensionAbility: ExtensionAbilityConfig = {
      name: name,
      srcEntry: `./ets/extensionability/${name}.ets`,
      type: type,
      exported: false
    };
    return extensionAbility;
  }

  /**
   * Returns a deep copy of an application configuration.
   */
  public static cloneAppConfig(source: AppConfig): AppConfig {
    const copy: AppConfig = {
      bundleName: source.bundleName,
      vendor: source.vendor,
      versionCode: source.versionCode,
      versionName: source.versionName,
      icon: source.icon,
      label: source.label
    };
    return copy;
  }

  /**
   * Returns a deep copy of a uri configuration.
   */
  public static cloneUri(source: UriConfig): UriConfig {
    const copy: UriConfig = {
      scheme: source.scheme,
      host: source.host,
      path: source.path
    };
    return copy;
  }

  /**
   * Returns a deep copy of a skill configuration.
   */
  public static cloneSkill(source: SkillConfig): SkillConfig {
    const uris: UriConfig[] = [];
    for (let index: number = 0; index < source.uris.length; index++) {
      uris.push(ConfigFactory.cloneUri(source.uris[index]));
    }
    const copy: SkillConfig = {
      entities: source.entities.slice(0),
      actions: source.actions.slice(0),
      uris: uris
    };
    return copy;
  }

  /**
   * Returns a deep copy of an ability configuration.
   */
  public static cloneAbility(source: AbilityConfig): AbilityConfig {
    const skills: SkillConfig[] = [];
    for (let index: number = 0; index < source.skills.length; index++) {
      skills.push(ConfigFactory.cloneSkill(source.skills[index]));
    }
    const copy: AbilityConfig = {
      name: source.name,
      srcEntry: source.srcEntry,
      description: source.description,
      icon: source.icon,
      label: source.label,
      startWindowIcon: source.startWindowIcon,
      startWindowBackground: source.startWindowBackground,
      exported: source.exported,
      launchType: source.launchType,
      orientation: source.orientation,
      skills: skills
    };
    return copy;
  }

  /**
   * Returns a deep copy of an extension ability configuration.
   */
  public static cloneExtensionAbility(source: ExtensionAbilityConfig): ExtensionAbilityConfig {
    const copy: ExtensionAbilityConfig = {
      name: source.name,
      srcEntry: source.srcEntry,
      type: source.type,
      exported: source.exported
    };
    return copy;
  }

  /**
   * Returns a deep copy of a preload configuration.
   */
  public static clonePreload(source: PreloadConfig): PreloadConfig {
    const copy: PreloadConfig = {
      moduleName: source.moduleName
    };
    return copy;
  }

  /**
   * Returns a deep copy of an atomicService configuration.
   */
  public static cloneAtomicService(source: AtomicServiceConfig): AtomicServiceConfig {
    const preloads: PreloadConfig[] = [];
    for (let index: number = 0; index < source.preloads.length; index++) {
      preloads.push(ConfigFactory.clonePreload(source.preloads[index]));
    }
    const copy: AtomicServiceConfig = {
      preloads: preloads,
      resizeable: source.resizeable
    };
    return copy;
  }

  /**
   * Returns a deep copy of a module configuration.
   */
  public static cloneModule(source: ModuleConfig): ModuleConfig {
    const abilities: AbilityConfig[] = [];
    for (let index: number = 0; index < source.abilities.length; index++) {
      abilities.push(ConfigFactory.cloneAbility(source.abilities[index]));
    }
    const extensionAbilities: ExtensionAbilityConfig[] = [];
    for (let index: number = 0; index < source.extensionAbilities.length; index++) {
      extensionAbilities.push(ConfigFactory.cloneExtensionAbility(source.extensionAbilities[index]));
    }
    let atomicService: AtomicServiceConfig | null = null;
    if (source.atomicService !== null) {
      atomicService = ConfigFactory.cloneAtomicService(source.atomicService);
    }
    const copy: ModuleConfig = {
      name: source.name,
      type: source.type,
      description: source.description,
      mainElement: source.mainElement,
      deviceTypes: source.deviceTypes.slice(0),
      deliveryWithInstall: source.deliveryWithInstall,
      installationFree: source.installationFree,
      pages: source.pages,
      abilities: abilities,
      extensionAbilities: extensionAbilities,
      atomicService: atomicService
    };
    return copy;
  }

  /**
   * Returns a deep copy of a bundle snapshot.
   */
  public static cloneSnapshot(source: BundleSnapshot): BundleSnapshot {
    const modules: ModuleConfig[] = [];
    for (let index: number = 0; index < source.modules.length; index++) {
      modules.push(ConfigFactory.cloneModule(source.modules[index]));
    }
    const copy: BundleSnapshot = {
      app: ConfigFactory.cloneAppConfig(source.app),
      modules: modules
    };
    return copy;
  }
}
