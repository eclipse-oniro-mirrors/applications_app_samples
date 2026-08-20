import { testCases } from '../entryability/EntryAbility'

@CustomDialog
struct TaskInfoDialog {
  controller!: CustomDialogController
  @State abilityName: string = 'EntryAbility'
  @State taskId: string = '0';
  onConfirm!: (abilityName: string, taskId: number) => void

  build() {
    Column() {
      Text('abilityName')
        .fontSize(14)
        .margin({ top: 10, bottom: 4 })
      TextInput({ text: this.abilityName })
        .width('100%')
        .onChange((value: string) => {
          this.abilityName = value;
        })

      Text('taskId')
        .fontSize(14)
        .margin({ top: 10, bottom: 4 })
      TextInput({ text: this.taskId })
        .width('100%')
        .type(InputType.Number)
        .onChange((value: string) => {
          this.taskId = value;
        })

      Flex({ justifyContent: FlexAlign.SpaceAround }) {
        Button('Cancel')
          .onClick(() => {
            this.controller.close();
          })
          .backgroundColor('#cccccc')
          .fontColor('#333333')
        Button('OK')
          .onClick(() => {
            this.onConfirm(this.abilityName, Number(this.taskId));
            this.controller.close();
          })
      }
      .margin({ top: 20 })
    }
    .padding(20)
  }
}

@CustomDialog
struct TaskIdDialog {
  controller!: CustomDialogController
  @State taskId: string = '0';
  onConfirm!: (abilityName: string, taskId: number) => void

  build() {
    Column() {
      Text('taskId')
        .fontSize(14)
        .margin({ top: 10, bottom: 4 })
      TextInput({ text: this.taskId })
        .width('100%')
        .type(InputType.Number)
        .onChange((value: string) => {
          this.taskId = value;
        })

      Flex({ justifyContent: FlexAlign.SpaceAround }) {
        Button('Cancel')
          .onClick(() => {
            this.controller.close();
          })
          .backgroundColor('#cccccc')
          .fontColor('#333333')
        Button('OK')
          .onClick(() => {
            this.onConfirm(Number(this.taskId));
            this.controller.close();
          })
      }
      .margin({ top: 20 })
    }
    .padding(20)
  }
}

@CustomDialog
struct ResultDialog {
  controller!: CustomDialogController
  @State title: string = '';
  @State result: string = '';

  build() {
    Column() {
      Text(this.title)
        .fontSize(18)
        .fontWeight((FontWeight.Bold))
        .margin({ bottom: 12 })

      Scroll() {
        Text(this.result)
          .fontSize(14)
          .fontColor('#333333')
          .width('100%')
      }
      .width('100%')
      .constraintSize({ maxHeight: 200})

      Button('OK')
        .margin({ top: 16 })
        .onClick(() => {
          this.controller.close();
        })
    }
    .padding(20)
  }
}

@Entry
@Component
struct Index {
  @State resultTitle: string = ''
  @State resultContent: string = ''
  resultDialogController: CustomDialogController = new CustomDialogController({
    builder: ResultDialog({
      title: this.resultTitle,
      result: this.resultContent,
    })
  })
  registerDialogController: CustomDialogController = new CustomDialogController({
    builder: TaskInfoDialog({
      onConfirm: (abilityName: string, taskId: number) => {
        testCases.registerTask(abilityName, taskId).then((result: string) => {
          this.resultTitle = 'registerTask Result';
          this.resultContent = `abilityName: ${abilityName}\ntaskId: ${taskId}\n\n${result}`;
          this.resultDialogController.open();
        });
      }
    })
  })
  getTaskInfoDialogController: CustomDialogController = new CustomDialogController({
    builder: TaskIdDialog({
      onConfirm: (taskId: number) => {
        testCases.getTaskInfo(taskId).then((result: string) => {
          this.resultTitle = 'getTaskInfo Result';
          this.resultContent = `taskId: ${taskId}\n\n${result}`;
          this.resultDialogController.open();
        });
      }
    })
  })
  finishTaskDialogController: CustomDialogController = new CustomDialogController({
    builder: TaskInfoDialog({
      onConfirm: (abilityName: string, taskId: number) => {
        testCases.finishTask(abilityName, taskId).then((result: string) => {
          this.resultTitle = 'finishTask Result';
          this.resultContent = `abilityName: ${abilityName}\ntaskId: ${taskId}\n\n${result}`;
          this.resultDialogController.open();
        });
      }
    })
  })
  unregisterTaskDialogController: CustomDialogController = new CustomDialogController({
    builder: TaskInfoDialog({
      onConfirm: (abilityName: string, taskId: number) => {
        testCases.unregisterTask(abilityName, taskId).then((result: string) => {
          this.resultTitle = 'unregisterTask Result';
          this.resultContent = `abilityName: ${abilityName}\ntaskId: ${taskId}\n\n${result}`;
          this.resultDialogController.open();
        });
      }
    })
  })

  build() {
    Column() {
      Text('Test')
        .fontSize(24)
        .fontWeight(FontWeight.Bold)
        .margin({ top: 20, bottom: 20})

      Grid() {
        GridItem() {
          Button('Register Task')
            .width('100%')
            .onClick(() => {
              this.registerDialogController.open();
            })
        }

        GridItem() {
          Button('Get Task Info')
            .width('100%')
            .onClick(() => {
              this.getTaskInfoDialogController.open();
            })
        }

        GridItem() {
          Button('Finish Task')
            .width('100%')
            .onClick(() => {
              this.finishTaskDialogController.open();
            })
        }

        GridItem() {
          Button('Unegister Task')
            .width('100%')
            .onClick(() => {
              this.unregisterTaskDialogController.open();
            })
        }
      }
      .columnsTemplate('1fr 1fr')
      .rowsGap(10)
      .columnsGap(10)
      .width('100%')
      .padding(10)
    }
    .width('100%')
    .height('100%')
    .padding(10)
  }
}