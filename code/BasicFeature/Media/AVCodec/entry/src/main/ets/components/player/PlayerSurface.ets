/*
 * Copyright (c) 2026 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 */

import { CommonConstants as Const } from '../../common/CommonConstants';

@Component
export struct PlayerSurface {
  controller: XComponentController = new XComponentController();
  onAreaChanged: (oldArea: Area, newArea: Area) => void = (_oldArea: Area, _newArea: Area): void => {};

  build() {
    XComponent({
      id: 'player',
      type: 0,
      libraryname: 'player',
      controller: this.controller
    })
      .height(Const.FULL_SIZE)
      .width(Const.FULL_SIZE)
      .onAreaChange(this.onAreaChanged)
  }
}
