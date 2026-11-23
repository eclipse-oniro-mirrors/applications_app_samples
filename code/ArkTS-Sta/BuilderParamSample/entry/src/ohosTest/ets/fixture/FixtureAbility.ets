'use static'
/*
 * Copyright (c) 2026 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0.
 */
import UIAbility from '@ohos.app.ability.UIAbility';
import window from '@ohos.window';
import { BusinessError } from '@ohos.base';
import hilog from '@ohos.hilog';

class FixtureAbility extends UIAbility {
  onWindowStageCreate(stage: window.WindowStage): void {
    stage.loadContent('fixture/BuilderFixture', (error: BusinessError<void> | null): void => {
      if (error && error.code) {
        hilog.error(0, 'BuilderParamFixture', 'Fixture load failed: %{public}d', error.code);
      }
    });
  }
}
