/**********************************************************************/
/*   ____  ____                                                       */
/*  /   /\/   /                                                       */
/* /___/  \  /                                                        */
/* \   \   \/                                                       */
/*  \   \        Copyright (c) 2003-2009 Xilinx, Inc.                */
/*  /   /          All Right Reserved.                                 */
/* /---/   /\                                                         */
/* \   \  /  \                                                      */
/*  \___\/\___\                                                    */
/***********************************************************************/

/* This file is designed for use with ISim build 0xfbc00daa */

#define XSI_HIDE_SYMBOL_SPEC true
#include "xsi.h"
#include <memory.h>
#ifdef __GNUC__
#include <stdlib.h>
#else
#include <malloc.h>
#define alloca _alloca
#endif
static const char *ng0 = "/home/waseemh/Xilinx_Proj/iA_cordic_6stage/tb_rot_combiatorial.vhd";



static void work_a_0574576823_2372691052_p_0(char *t0)
{
    char *t1;
    char *t2;
    int64 t3;
    int64 t4;
    char *t6;
    char *t7;
    char *t8;
    char *t9;
    char *t10;
    char *t11;
    char *t12;
    int64 t13;
    int64 t14;
    char *t16;
    char *t17;
    char *t18;
    char *t19;
    char *t20;
    char *t21;
    char *t22;
    int64 t23;
    int64 t24;
    char *t26;
    char *t27;
    char *t28;
    char *t29;
    char *t30;
    char *t31;
    char *t32;
    int64 t33;
    int64 t34;
    char *t36;
    char *t37;
    char *t38;
    char *t39;
    char *t40;
    char *t41;

LAB0:    xsi_set_current_line(36, ng0);

LAB3:    t1 = (t0 + 1648U);
    t2 = *((char **)t1);
    t3 = *((int64 *)t2);
    t4 = (t3 * 2);
    t1 = (t0 + 5032);
    t6 = (t0 + 3008);
    t7 = (t6 + 56U);
    t8 = *((char **)t7);
    t9 = (t8 + 56U);
    t10 = *((char **)t9);
    memcpy(t10, t1, 32U);
    xsi_driver_first_trans_delta(t6, 0U, 32U, t4);
    t11 = (t0 + 1648U);
    t12 = *((char **)t11);
    t13 = *((int64 *)t12);
    t14 = (t13 * 52);
    t11 = (t0 + 5064);
    t16 = (t0 + 3008);
    t17 = (t16 + 56U);
    t18 = *((char **)t17);
    t19 = (t18 + 56U);
    t20 = *((char **)t19);
    memcpy(t20, t11, 32U);
    xsi_driver_subsequent_trans_delta(t16, 0U, 32U, t14);
    t21 = (t0 + 1648U);
    t22 = *((char **)t21);
    t23 = *((int64 *)t22);
    t24 = (t23 * 104);
    t21 = (t0 + 5096);
    t26 = (t0 + 3008);
    t27 = (t26 + 56U);
    t28 = *((char **)t27);
    t29 = (t28 + 56U);
    t30 = *((char **)t29);
    memcpy(t30, t21, 32U);
    xsi_driver_subsequent_trans_delta(t26, 0U, 32U, t24);
    t31 = (t0 + 1648U);
    t32 = *((char **)t31);
    t33 = *((int64 *)t32);
    t34 = (180 * t33);
    t31 = (t0 + 5128);
    t36 = (t0 + 3008);
    t37 = (t36 + 56U);
    t38 = *((char **)t37);
    t39 = (t38 + 56U);
    t40 = *((char **)t39);
    memcpy(t40, t31, 32U);
    xsi_driver_subsequent_trans_delta(t36, 0U, 32U, t34);
    t41 = (t0 + 3008);
    xsi_driver_intertial_reject(t41, t4, t4);

LAB2:
LAB1:    return;
LAB4:    goto LAB2;

}


extern void work_a_0574576823_2372691052_init()
{
	static char *pe[] = {(void *)work_a_0574576823_2372691052_p_0};
	xsi_register_didat("work_a_0574576823_2372691052", "isim/tb_rot_combinatorial_isim_beh.exe.sim/work/a_0574576823_2372691052.didat");
	xsi_register_executes(pe);
}
