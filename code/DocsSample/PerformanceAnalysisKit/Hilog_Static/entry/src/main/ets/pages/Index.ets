'use static'
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
// [Start arkts_static]
import { Entry, Row, Column, Component, Button, ClickEvent } from '@ohos.arkui.component'
import hilog from '@ohos.hilog'

class Person {
  constructor(name: string, age: number) {
    this.name = name;
    this.age = age;
  }
  name: string;
  age:  number;
}

@Entry
@Component
struct Index {
  message: string = 'HiLog ArkTS Static';
  message2: string = 'SandboxLog Static';

  build() {
    Row() {
      Column(undefined) {
        // 添加hilog按钮，以响应用户点击
        Button(this.message).backgroundColor('#FFFF00FF')
          .width('40%')
          .height('5%')
          .onClick((e: ClickEvent) => {
            let ret = hilog.isLoggable(0xFF00, 'testTag', hilog.LogLevel.INFO);
            if (ret) {
              hilog.info(0xFF00, 'testTag',
              'A log with a domainID of 0xFF00 and a label of testTag can print logs at the Info level or higher.');
            }
            hilog.info(0xFF00, 'testTag', '%{public}s World %{public}d', 'hello', 3);
            let peter: Person = new Person('peter', 15);
            hilog.info(0xFF00, 'testTag', 'peter is %{public}o', peter);
            // 设置应用日志最低打印级别，设置完成后，低于Warn级别的日志将无法打印
            hilog.setMinLogLevel(hilog.LogLevel.WARN);
            hilog.info(0xFF00, 'testTag', 'this is an info level log');
            hilog.error(0xFF00, 'testTag', 'this is an error level log');
            // 设置应用日志PREFER_OPEN_LOG策略的最低打印级别，设置完成后，不低于INFO级别的日志都可打印
            hilog.setLogLevel(hilog.LogLevel.INFO, hilog.PreferStrategy.PREFER_OPEN_LOG);
            hilog.info(0xFF00, 'testTag', 'this is an another info level log');
            hilog.error(0xFF00, 'testTag', 'this is an another error level log');
          })
        // 添加沙箱日志按钮，以响应用户点击
        Button(this.message2).backgroundColor('#FFFF00FF')
          .width('40%')
          .height('5%')
          .onClick((e: ClickEvent) => {
            // 设置日志输出类型SHARE_SANDBOX_WITH_CONSOLE，同时输出公有沙箱和控制台
            hilog.setOutputType(hilog.OutputType.SHARE_SANDBOX_WITH_CONSOLE);
            let lastType:int = hilog.getOutputType();
            hilog.info(0xFF00, 'testTag', 'current log type:%{public}d', lastType);
            let dir = hilog.getOutputDir();
            hilog.info(0xFF00, 'testTag', 'current log dir:%{public}s', dir);
            hilog.info(0xFF00, 'testTag', 'hilog_info_test');
            hilog.debug(0xFF00, 'testTag', 'hilog_debug_test');
            hilog.warn(0xFF00, 'testTag', 'hilog_warn_test');
            hilog.fatal(0xFF00, 'testTag', 'hilog_fatal_test');
            hilog.error(0xFF00, 'testTag', 'hilog_error_test');
            // 获取沙箱目录中2分钟之内写入过的日志文件
            let logs:Array<string> = hilog.getLogFile(120);
            hilog.info(0xFF00, 'testTag', 'current log files:%{public}s', logs.toString());
            // 将沙箱日志刷入磁盘
            hilog.flush();
          })
      }
      .width('100%')
    }
    .height('100%')
  }
}
// [End arkts_static]