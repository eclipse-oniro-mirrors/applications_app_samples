// Script for compiling build behavior. It is built in the build plug-in and cannot be modified currently.
import { harTasks } from '@ohos/hvigor-ohos-plugin';
import { harPlugin } from '@hadss/hmrouter-plugin';

export default {
  system: harTasks,
  plugins: [harPlugin()]
};