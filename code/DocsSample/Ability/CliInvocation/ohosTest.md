# CliInvocation测试用例归档

本工程测试用例覆盖 CliInvocation 的模型逻辑、命令构建、退出码与消息映射、参数安全校验，以及 EntryAbility 启动和“启动目标应用”按钮点击流程，共 3070 条自动化用例。

## 用例表

| 测试功能 | 预置条件 | 输入 | 预期输出 | 是否自动 | 测试结果 |
|---|---|---|---|---|---|
| 启动EntryAbility | 设备正常运行，应用已安装 | 通过 abilityDelegator 启动 com.example.clisandbox 的 EntryAbility | 成功启动 Ability，当前顶层 Ability 名称为 EntryAbility | 是 | Pass |
| 通过命令行工具启动目标应用 | 位于应用主页，已授予 ohos.permission.CUSTOM_SANDBOX 权限 | 点击“启动目标应用”按钮 | 调用 forkAndExecute 以 fork+execvp 执行命令行工具 start 命令，页面 message 文案更新且 text_message 组件存在 | 是 | Pass |
| CliModel.isValidName 名称校验（300例） | 设备正常运行 | 传入 3~128 位、包含各类字符的名称 | 不含空格/制表符/换行且长度合法时返回 true，否则 false | 是 | Pass |
| CliModel.isValidBundleName 包名校验（300例） | 设备正常运行 | 传入包含“.”、边界点号及非法字符的包名 | 满足 isValidName、包含“.”且不以“.”开头或结尾时返回 true，否则 false | 是 | Pass |
| CliModel.isValidAbilityName Ability名校验（250例） | 设备正常运行 | 传入合法名称、含“.”名称及边界输入 | 满足 isValidName 且不包含“.”时返回 true，否则 false | 是 | Pass |
| CliModel.isValidExitCode 退出码校验（200例） | 设备正常运行 | 传入 -1、0、127、255、256 等退出码 | 退出码在 [-1,255] 范围内返回 true，否则 false | 是 | Pass |
| CliModel.isSuccessCode 成功码判断（150例） | 设备正常运行 | 传入不同退出码 | 退出码为 0 时返回 true，否则 false | 是 | Pass |
| CliModel.isForkFailure fork失败判断（150例） | 设备正常运行 | 传入不同退出码 | 退出码为 -1 时返回 true，否则 false | 是 | Pass |
| CliModel.isExecFailure exec失败判断（150例） | 设备正常运行 | 传入不同退出码 | 退出码为 127 时返回 true，否则 false | 是 | Pass |
| CliModel.exitMessageKey 消息键映射（200例） | 设备正常运行 | 传入 0、-1、127 及其余退出码 | 分别映射为 message_start_success、message_start_failed_fork、message_start_failed_exec、message_start_failed | 是 | Pass |
| CliModel.exitMessage 消息文本映射（100例） | 设备正常运行 | 传入退出码及返回值 | 0 返回 start success，其余返回 start failed, ret = 返回值 | 是 | Pass |
| CliModel.isSafeArg 参数安全校验（300例） | 设备正常运行 | 传入普通参数及包含 ; & \| ` 的参数 | 参数非空且不包含 shell 元字符时返回 true，否则 false | 是 | Pass |
| CliModel.decodeWaitStatus 等待状态解析（200例） | 设备正常运行 | 传入负数、0、正常 wait status 及大数值 | status 小于 0 返回 -1，否则返回 status 的高 8 位退出码 | 是 | Pass |
| CliModel.normalizeBundle 包名规范化（150例） | 设备正常运行 | 传入含首尾空白及正常包名 | 返回去除首尾空白后的包名 | 是 | Pass |
| CliModel.formatCommand 命令格式化（100例） | 设备正常运行 | 传入不同 argv 数组 | 使用空格拼接 argv 返回完整命令字符串 | 是 | Pass |
| CliModel.commandSummary 命令摘要（100例） | 设备正常运行 | 传入不同 argv 数组 | 返回 argc=参数个数 cmd=第一个参数 | 是 | Pass |
| CliModel.argCount 参数计数（100例） | 设备正常运行 | 传入不同长度 argv 数组 | 返回参数数组长度 | 是 | Pass |
| CliModel.hasOption 选项存在判断（100例） | 设备正常运行 | 传入 argv 与目标选项 | argv 中包含指定选项时返回 true，否则 false | 是 | Pass |
| CliModel.optionValue 选项值提取（150例） | 设备正常运行 | 传入 argv 与目标选项 | 返回选项后一个参数；选项不存在或缺少值返回空字符串 | 是 | Pass |
| Model.Validation 参数校验矩阵（5例） | 设备正常运行 | 对 bundleName、abilityName、name、exitCode 的合法与非法输入进行参数化校验 | 各项校验结果与预期一致 | 是 | Pass |
| Model.Boundary 边界矩阵（4例） | 设备正常运行 | 名称长度、decodeWaitStatus、argCount 等边界值 | 边界结果与预期一致 | 是 | Pass |
| Model.ErrorCatalog 错误码目录（4例） | 设备正常运行 | 退出码 0、-1、127 及其余值 | 退出码语义与消息键映射正确 | 是 | Pass |
| Model.StateMachine 退出状态机（3例） | 设备正常运行 | 退出码及其分类元组 | 退出状态分类和消息文本正确 | 是 | Pass |
| Model.Builder 命令构建（17例） | 设备正常运行 | buildStartArgs、buildStopArgs 各参数位置 | 生成的 argv 内容与顺序正确 | 是 | Pass |
| Model.Integration 端到端命令构建（5例） | 设备正常运行 | 多组 bundleName、abilityName 构建完整命令 | 端到端 argv 与 CliCommand 字段正确 | 是 | Pass |
| Model.Security 参数安全（5例） | 设备正常运行 | 包含 shell 元字符的参数 | isSafeArg 拒绝不安全参数 | 是 | Pass |
| Model.Messages 消息映射（3例） | 设备正常运行 | 多组退出码 | 消息键和消息文本映射正确 | 是 | Pass |
| Model.PathRules 路径规则（6例） | 设备正常运行 | CLI 路径、子命令、选项定义 | 路径前缀、子命令和选项分类正确 | 是 | Pass |
| Model.Workflow 工作流（16例） | 设备正常运行 | start/force-stop 命令、退出码、wait status | 命令内容、退出码语义和消息映射正确 | 是 | Pass |

## 用例分组与批量执行

3070 条用例按 `-s batch <1..6>` 分为 6 批执行，每批前需先执行 force-stop 子命令，避免 Ability 任务累积影响结果：

| 批次 | 用例数 | 覆盖范围 |
|---|---|---|
| batch 1 | 518 | Model 全部 + isValidName + isValidBundleName Core/Edge/Matrix |
| batch 2 | 550 | isValidBundleName Stress/Extended/Boundary + isValidAbilityName + isValidExitCode Core/Edge/Matrix |
| batch 3 | 550 | isValidExitCode Stress + isSuccessCode + isForkFailure + isExecFailure + exitMessageKey Core |
| batch 4 | 550 | exitMessageKey Edge/Matrix/Stress + exitMessage + isSafeArg |
| batch 5 | 550 | decodeWaitStatus + normalizeBundle + formatCommand + commandSummary |
| batch 6 | 352 | argCount + hasOption + optionValue + EntryAbility/按钮点击用例 |

执行方式：先对 com.example.clisandbox 执行 force-stop，再通过 Ability Assistant 的 test 子命令按 batch 1~6 依次执行，每批均指定 `-s timeout 15000`。
