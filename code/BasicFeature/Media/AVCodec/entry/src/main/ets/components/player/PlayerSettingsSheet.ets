/*
 * Copyright (c) 2026 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 */

import { SettingsPage } from '../../pages/SettingsPage';

@Component
export struct PlayerSettingsSheet {
  @BuilderParam content: () => void;

  build() {
    SettingsPage({ content: (): void => this.content() })
  }
}
