<template>
<!--    新規作成部分-->
<!--    タスクのテキスト部分-->
    <div>

        <div class="row">
    <div class="col s10 m11">
        <input class="form_tasks" placeholder="Add your tasks!"/>

    </div>

<!--    タスク追加ボタン-->
    <div class="col s10 m11">
        <div class="btn-floating waves-effect waves-light red">
        <i class="material-icons">add</i>
        </div>
    </div>
        </div>
<!--    リスト表示部分-->
        <div>
            <ul class="collection">
<!--                <li id = "row_task_1" class="collection-item">-->
<!--                    <input type ="checkbox" id="task_1"/>-->
<!--                    <label for="task_1">Sample task</label>-->
<!--                </li>-->
<!--                <li id = "row_task_2" class="collection-item">-->
<!--                    <input type ="checkbox" id="task_2"/>-->
<!--                    <label for="task_2">Sample task</label>-->
<!--                </li>-->
<!--                <li id = "row_task_3" class="collection-item">-->
<!--                    <input type ="checkbox" id="task_3"/>-->
<!--                    <label for="task_3">Sample task</label>-->
<!--                </li>-->

                <li v-for="task in tasks" v-if="!task.is_done" v-bind:id="'row_task_' + task.id" class="collection-item">
                     <input type="checkbox" v-bind:id="'task_' + task.id" />
                     <label v-bind:for="'task_' + task.id">{{ task.name }}</label>
                </li>
            </ul>
        </div>

<!--    完了済みタスク一覧-->
        <div class="btn">Display finished tasks</div>

        <div id="finished-tasks" class="display_none">
        <ul class="collection">
<!--            <li id="row_task_4" class="collection-item">-->
            <!--                <input type = "checkbox" id="task_4" checked="checked"/>-->
            <!--                <label v-bind:for ="task_4" class="line-through">Done Task</label>-->
            <!--            </li>-->
            <!--            <li id="row_task_5" class="collection-item">-->
            <!--                <input type = "checkbox" id="task_5" checked="checked"/>-->
            <!--                <label v-bind:for ="task_5" class="line-through">Done Task</label>-->
            <!--            </li>-->

            <li v-for="task in tasks" v-if="task.is_done"v-bind:id="'row_task_' + task.id" class="collection-item">
                <input type="checkbox" v-bind:id="'task_' + task.id" checked="checked" />
                <label v-bind:for="'task_' + task.id"  class="line-through">{{ task.name }}</label>
            </li>

        </ul>
        </div>
    </div>
</template>

<script>
    import axios from 'axios';

    export default {
        data: function () {
            return {
                tasks: [],
                newTask: ''
            }
        },
        mounted: function () {
            this.fetchTasks();
        },
        methods: {
            fetchTasks: function () {
                axios.get('/api/tasks').then((response) =>{
                    for (var i = 0; i <response.data.tasks.length; i++) {
                        this.tasks.push(response.data.tasks[i]);
                    }
                },(error)=>{
                    console.log(error);
                    });
            },
        }
    }


</script>

<style scoped>
    [v-cloak] {
        display: none;
    }
    .display_none{
        display: none;
    }
    .line-through{
        text-decoration: line-through;
    }
</style>
