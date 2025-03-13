import { z } from "zod";

// 定义猫的数据结构
export const CreateCatSchema = z.object({
	name: z.string().min(1, "名字不能为空"),
	age: z.number().min(0, "年龄必须是非负数"),
	breed: z.string().optional(),
});

export type AdoptionCatDto = z.infer<typeof CreateCatSchema>;

export const UpdateCatSchema = CreateCatSchema.partial();

export type UpdateCatDto = z.infer<typeof UpdateCatSchema>;
