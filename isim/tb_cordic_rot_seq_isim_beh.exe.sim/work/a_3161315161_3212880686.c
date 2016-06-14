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
static const char *ng0 = "/home/waseemh/Xilinx_Proj/iA_cordic_6stage/norm_rotation_mode.vhd";
extern char *IEEE_P_1242562249;
extern char *IEEE_P_2592010699;

int ieee_p_1242562249_sub_17802405650254020620_1035706684(char *, char *, char *);


static void work_a_3161315161_3212880686_p_0(char *t0)
{
    char *t1;
    char *t2;
    int t3;
    char *t4;
    char *t5;
    char *t6;
    char *t7;
    char *t8;
    char *t9;

LAB0:    xsi_set_current_line(69, ng0);

LAB3:    t1 = (t0 + 1032U);
    t2 = *((char **)t1);
    t1 = (t0 + 9920U);
    t3 = ieee_p_1242562249_sub_17802405650254020620_1035706684(IEEE_P_1242562249, t2, t1);
    t4 = (t0 + 6184);
    t5 = (t4 + 56U);
    t6 = *((char **)t5);
    t7 = (t6 + 56U);
    t8 = *((char **)t7);
    *((int *)t8) = t3;
    xsi_driver_first_trans_fast(t4);

LAB2:    t9 = (t0 + 6024);
    *((int *)t9) = 1;

LAB1:    return;
LAB4:    goto LAB2;

}

static void work_a_3161315161_3212880686_p_1(char *t0)
{
    char *t1;
    char *t2;
    int t3;
    char *t4;
    int t5;
    unsigned char t6;
    char *t8;
    char *t9;
    char *t10;
    char *t11;
    char *t12;
    unsigned char t13;
    char *t14;
    char *t15;
    int t16;
    char *t17;
    int t18;
    unsigned char t19;
    char *t20;
    int t21;
    char *t22;
    int t23;
    unsigned char t24;
    char *t26;
    char *t27;
    char *t28;
    char *t29;
    char *t30;
    unsigned char t31;
    char *t32;
    char *t33;
    int t34;
    char *t35;
    int t36;
    unsigned char t37;
    char *t38;
    int t39;
    char *t40;
    int t41;
    unsigned char t42;
    char *t44;
    char *t45;
    char *t46;
    char *t47;
    char *t48;
    char *t49;
    char *t51;
    char *t52;
    char *t53;
    char *t54;
    char *t55;
    char *t56;

LAB0:    xsi_set_current_line(70, ng0);
    t1 = (t0 + 1512U);
    t2 = *((char **)t1);
    t3 = *((int *)t2);
    t1 = (t0 + 3248U);
    t4 = *((char **)t1);
    t5 = *((int *)t4);
    t6 = (t3 <= t5);
    if (t6 != 0)
        goto LAB3;

LAB4:    t14 = (t0 + 1512U);
    t15 = *((char **)t14);
    t16 = *((int *)t15);
    t14 = (t0 + 3248U);
    t17 = *((char **)t14);
    t18 = *((int *)t17);
    t19 = (t16 > t18);
    if (t19 == 1)
        goto LAB7;

LAB8:    t13 = (unsigned char)0;

LAB9:    if (t13 != 0)
        goto LAB5;

LAB6:    t32 = (t0 + 1512U);
    t33 = *((char **)t32);
    t34 = *((int *)t33);
    t32 = (t0 + 3368U);
    t35 = *((char **)t32);
    t36 = *((int *)t35);
    t37 = (t34 > t36);
    if (t37 == 1)
        goto LAB12;

LAB13:    t31 = (unsigned char)0;

LAB14:    if (t31 != 0)
        goto LAB10;

LAB11:
LAB15:    t49 = (t0 + 10442);
    t51 = (t0 + 6248);
    t52 = (t51 + 56U);
    t53 = *((char **)t52);
    t54 = (t53 + 56U);
    t55 = *((char **)t54);
    memcpy(t55, t49, 2U);
    xsi_driver_first_trans_fast_port(t51);

LAB2:    t56 = (t0 + 6040);
    *((int *)t56) = 1;

LAB1:    return;
LAB3:    t1 = (t0 + 10436);
    t8 = (t0 + 6248);
    t9 = (t8 + 56U);
    t10 = *((char **)t9);
    t11 = (t10 + 56U);
    t12 = *((char **)t11);
    memcpy(t12, t1, 2U);
    xsi_driver_first_trans_fast_port(t8);
    goto LAB2;

LAB5:    t14 = (t0 + 10438);
    t26 = (t0 + 6248);
    t27 = (t26 + 56U);
    t28 = *((char **)t27);
    t29 = (t28 + 56U);
    t30 = *((char **)t29);
    memcpy(t30, t14, 2U);
    xsi_driver_first_trans_fast_port(t26);
    goto LAB2;

LAB7:    t14 = (t0 + 1512U);
    t20 = *((char **)t14);
    t21 = *((int *)t20);
    t14 = (t0 + 3368U);
    t22 = *((char **)t14);
    t23 = *((int *)t22);
    t24 = (t21 <= t23);
    t13 = t24;
    goto LAB9;

LAB10:    t32 = (t0 + 10440);
    t44 = (t0 + 6248);
    t45 = (t44 + 56U);
    t46 = *((char **)t45);
    t47 = (t46 + 56U);
    t48 = *((char **)t47);
    memcpy(t48, t32, 2U);
    xsi_driver_first_trans_fast_port(t44);
    goto LAB2;

LAB12:    t32 = (t0 + 1512U);
    t38 = *((char **)t32);
    t39 = *((int *)t38);
    t32 = (t0 + 3488U);
    t40 = *((char **)t32);
    t41 = *((int *)t40);
    t42 = (t39 <= t41);
    t31 = t42;
    goto LAB14;

LAB16:    goto LAB2;

}

static void work_a_3161315161_3212880686_p_2(char *t0)
{
    char *t1;
    char *t2;
    int t3;
    char *t4;
    int t5;
    unsigned char t6;
    char *t7;
    char *t8;
    char *t9;
    char *t10;
    unsigned char t11;
    char *t12;
    char *t13;
    int t14;
    char *t15;
    int t16;
    unsigned char t17;
    char *t18;
    int t19;
    char *t20;
    int t21;
    unsigned char t22;
    char *t23;
    char *t24;
    char *t25;
    char *t26;
    unsigned char t27;
    char *t28;
    char *t29;
    int t30;
    char *t31;
    int t32;
    unsigned char t33;
    char *t34;
    int t35;
    char *t36;
    int t37;
    unsigned char t38;
    char *t39;
    char *t40;
    char *t41;
    char *t42;
    char *t43;
    char *t44;
    char *t45;
    char *t46;
    char *t47;
    char *t48;

LAB0:    xsi_set_current_line(74, ng0);
    t1 = (t0 + 1512U);
    t2 = *((char **)t1);
    t3 = *((int *)t2);
    t1 = (t0 + 3248U);
    t4 = *((char **)t1);
    t5 = *((int *)t4);
    t6 = (t3 <= t5);
    if (t6 != 0)
        goto LAB3;

LAB4:    t12 = (t0 + 1512U);
    t13 = *((char **)t12);
    t14 = *((int *)t13);
    t12 = (t0 + 3248U);
    t15 = *((char **)t12);
    t16 = *((int *)t15);
    t17 = (t14 > t16);
    if (t17 == 1)
        goto LAB7;

LAB8:    t11 = (unsigned char)0;

LAB9:    if (t11 != 0)
        goto LAB5;

LAB6:    t28 = (t0 + 1512U);
    t29 = *((char **)t28);
    t30 = *((int *)t29);
    t28 = (t0 + 3368U);
    t31 = *((char **)t28);
    t32 = *((int *)t31);
    t33 = (t30 > t32);
    if (t33 == 1)
        goto LAB12;

LAB13:    t27 = (unsigned char)0;

LAB14:    if (t27 != 0)
        goto LAB10;

LAB11:
LAB15:    t43 = (t0 + 6312);
    t44 = (t43 + 56U);
    t45 = *((char **)t44);
    t46 = (t45 + 56U);
    t47 = *((char **)t46);
    *((unsigned char *)t47) = (unsigned char)3;
    xsi_driver_first_trans_fast(t43);

LAB2:    t48 = (t0 + 6056);
    *((int *)t48) = 1;

LAB1:    return;
LAB3:    t1 = (t0 + 6312);
    t7 = (t1 + 56U);
    t8 = *((char **)t7);
    t9 = (t8 + 56U);
    t10 = *((char **)t9);
    *((unsigned char *)t10) = (unsigned char)2;
    xsi_driver_first_trans_fast(t1);
    goto LAB2;

LAB5:    t12 = (t0 + 6312);
    t23 = (t12 + 56U);
    t24 = *((char **)t23);
    t25 = (t24 + 56U);
    t26 = *((char **)t25);
    *((unsigned char *)t26) = (unsigned char)3;
    xsi_driver_first_trans_fast(t12);
    goto LAB2;

LAB7:    t12 = (t0 + 1512U);
    t18 = *((char **)t12);
    t19 = *((int *)t18);
    t12 = (t0 + 3368U);
    t20 = *((char **)t12);
    t21 = *((int *)t20);
    t22 = (t19 <= t21);
    t11 = t22;
    goto LAB9;

LAB10:    t28 = (t0 + 6312);
    t39 = (t28 + 56U);
    t40 = *((char **)t39);
    t41 = (t40 + 56U);
    t42 = *((char **)t41);
    *((unsigned char *)t42) = (unsigned char)2;
    xsi_driver_first_trans_fast(t28);
    goto LAB2;

LAB12:    t28 = (t0 + 1512U);
    t34 = *((char **)t28);
    t35 = *((int *)t34);
    t28 = (t0 + 3488U);
    t36 = *((char **)t28);
    t37 = *((int *)t36);
    t38 = (t35 <= t37);
    t27 = t38;
    goto LAB14;

LAB16:    goto LAB2;

}

static void work_a_3161315161_3212880686_p_3(char *t0)
{
    char *t1;
    char *t2;
    int t3;
    char *t4;
    int t5;
    unsigned char t6;
    char *t7;
    char *t8;
    char *t9;
    char *t10;
    char *t11;
    unsigned char t12;
    char *t13;
    char *t14;
    int t15;
    char *t16;
    int t17;
    unsigned char t18;
    char *t19;
    int t20;
    char *t21;
    int t22;
    unsigned char t23;
    char *t24;
    char *t25;
    char *t26;
    char *t27;
    char *t28;
    unsigned char t29;
    char *t30;
    char *t31;
    int t32;
    char *t33;
    int t34;
    unsigned char t35;
    char *t36;
    int t37;
    char *t38;
    int t39;
    unsigned char t40;
    char *t41;
    char *t42;
    char *t43;
    char *t44;
    char *t45;
    char *t46;
    char *t47;
    char *t48;
    char *t49;
    char *t50;
    char *t51;
    char *t52;

LAB0:    xsi_set_current_line(79, ng0);
    t1 = (t0 + 1512U);
    t2 = *((char **)t1);
    t3 = *((int *)t2);
    t1 = (t0 + 3248U);
    t4 = *((char **)t1);
    t5 = *((int *)t4);
    t6 = (t3 <= t5);
    if (t6 != 0)
        goto LAB3;

LAB4:    t13 = (t0 + 1512U);
    t14 = *((char **)t13);
    t15 = *((int *)t14);
    t13 = (t0 + 3248U);
    t16 = *((char **)t13);
    t17 = *((int *)t16);
    t18 = (t15 > t17);
    if (t18 == 1)
        goto LAB7;

LAB8:    t12 = (unsigned char)0;

LAB9:    if (t12 != 0)
        goto LAB5;

LAB6:    t30 = (t0 + 1512U);
    t31 = *((char **)t30);
    t32 = *((int *)t31);
    t30 = (t0 + 3368U);
    t33 = *((char **)t30);
    t34 = *((int *)t33);
    t35 = (t32 > t34);
    if (t35 == 1)
        goto LAB12;

LAB13:    t29 = (unsigned char)0;

LAB14:    if (t29 != 0)
        goto LAB10;

LAB11:
LAB15:    t46 = (t0 + 3008U);
    t47 = *((char **)t46);
    t46 = (t0 + 6376);
    t48 = (t46 + 56U);
    t49 = *((char **)t48);
    t50 = (t49 + 56U);
    t51 = *((char **)t50);
    memcpy(t51, t47, 40U);
    xsi_driver_first_trans_fast(t46);

LAB2:    t52 = (t0 + 6072);
    *((int *)t52) = 1;

LAB1:    return;
LAB3:    t1 = (t0 + 2768U);
    t7 = *((char **)t1);
    t1 = (t0 + 6376);
    t8 = (t1 + 56U);
    t9 = *((char **)t8);
    t10 = (t9 + 56U);
    t11 = *((char **)t10);
    memcpy(t11, t7, 40U);
    xsi_driver_first_trans_fast(t1);
    goto LAB2;

LAB5:    t13 = (t0 + 2888U);
    t24 = *((char **)t13);
    t13 = (t0 + 6376);
    t25 = (t13 + 56U);
    t26 = *((char **)t25);
    t27 = (t26 + 56U);
    t28 = *((char **)t27);
    memcpy(t28, t24, 40U);
    xsi_driver_first_trans_fast(t13);
    goto LAB2;

LAB7:    t13 = (t0 + 1512U);
    t19 = *((char **)t13);
    t20 = *((int *)t19);
    t13 = (t0 + 3368U);
    t21 = *((char **)t13);
    t22 = *((int *)t21);
    t23 = (t20 <= t22);
    t12 = t23;
    goto LAB9;

LAB10:    t30 = (t0 + 3128U);
    t41 = *((char **)t30);
    t30 = (t0 + 6376);
    t42 = (t30 + 56U);
    t43 = *((char **)t42);
    t44 = (t43 + 56U);
    t45 = *((char **)t44);
    memcpy(t45, t41, 40U);
    xsi_driver_first_trans_fast(t30);
    goto LAB2;

LAB12:    t30 = (t0 + 1512U);
    t36 = *((char **)t30);
    t37 = *((int *)t36);
    t30 = (t0 + 3488U);
    t38 = *((char **)t30);
    t39 = *((int *)t38);
    t40 = (t37 <= t39);
    t29 = t40;
    goto LAB14;

LAB16:    goto LAB2;

}

static void work_a_3161315161_3212880686_p_4(char *t0)
{
    char t9[16];
    char t11[16];
    char t16[16];
    char *t1;
    char *t2;
    unsigned int t3;
    unsigned int t4;
    unsigned int t5;
    char *t6;
    char *t8;
    char *t10;
    char *t12;
    char *t13;
    int t14;
    unsigned int t15;
    char *t17;
    int t18;
    unsigned char t19;
    char *t20;
    char *t21;
    char *t22;
    char *t23;
    char *t24;

LAB0:    xsi_set_current_line(83, ng0);

LAB3:    t1 = (t0 + 1832U);
    t2 = *((char **)t1);
    t3 = (39 - 23);
    t4 = (t3 * 1U);
    t5 = (0 + t4);
    t1 = (t2 + t5);
    t6 = (t0 + 10444);
    t10 = ((IEEE_P_2592010699) + 4000);
    t12 = (t11 + 0U);
    t13 = (t12 + 0U);
    *((int *)t13) = 23;
    t13 = (t12 + 4U);
    *((int *)t13) = 0;
    t13 = (t12 + 8U);
    *((int *)t13) = -1;
    t14 = (0 - 23);
    t15 = (t14 * -1);
    t15 = (t15 + 1);
    t13 = (t12 + 12U);
    *((unsigned int *)t13) = t15;
    t13 = (t16 + 0U);
    t17 = (t13 + 0U);
    *((int *)t17) = 0;
    t17 = (t13 + 4U);
    *((int *)t17) = 15;
    t17 = (t13 + 8U);
    *((int *)t17) = 1;
    t18 = (15 - 0);
    t15 = (t18 * 1);
    t15 = (t15 + 1);
    t17 = (t13 + 12U);
    *((unsigned int *)t17) = t15;
    t8 = xsi_base_array_concat(t8, t9, t10, (char)97, t1, t11, (char)97, t6, t16, (char)101);
    t15 = (24U + 16U);
    t19 = (40U != t15);
    if (t19 == 1)
        goto LAB5;

LAB6:    t17 = (t0 + 6440);
    t20 = (t17 + 56U);
    t21 = *((char **)t20);
    t22 = (t21 + 56U);
    t23 = *((char **)t22);
    memcpy(t23, t8, 40U);
    xsi_driver_first_trans_fast_port(t17);

LAB2:    t24 = (t0 + 6088);
    *((int *)t24) = 1;

LAB1:    return;
LAB4:    goto LAB2;

LAB5:    xsi_size_not_matching(40U, t15, 0);
    goto LAB6;

}

static void work_a_3161315161_3212880686_p_5(char *t0)
{
    char t5[16];
    char t7[16];
    char *t1;
    char *t3;
    char *t4;
    char *t6;
    char *t8;
    char *t9;
    int t10;
    unsigned int t11;
    unsigned char t12;
    char *t13;
    char *t14;
    char *t15;
    char *t16;
    char *t17;
    char *t18;

LAB0:    xsi_set_current_line(62, ng0);

LAB3:    t1 = (t0 + 10460);
    t3 = (t0 + 1032U);
    t4 = *((char **)t3);
    t6 = ((IEEE_P_2592010699) + 4000);
    t8 = (t7 + 0U);
    t9 = (t8 + 0U);
    *((int *)t9) = 0;
    t9 = (t8 + 4U);
    *((int *)t9) = 7;
    t9 = (t8 + 8U);
    *((int *)t9) = 1;
    t10 = (7 - 0);
    t11 = (t10 * 1);
    t11 = (t11 + 1);
    t9 = (t8 + 12U);
    *((unsigned int *)t9) = t11;
    t9 = (t0 + 9920U);
    t3 = xsi_base_array_concat(t3, t5, t6, (char)97, t1, t7, (char)97, t4, t9, (char)101);
    t11 = (8U + 32U);
    t12 = (40U != t11);
    if (t12 == 1)
        goto LAB5;

LAB6:    t13 = (t0 + 6504);
    t14 = (t13 + 56U);
    t15 = *((char **)t14);
    t16 = (t15 + 56U);
    t17 = *((char **)t16);
    memcpy(t17, t3, 40U);
    xsi_driver_first_trans_fast(t13);

LAB2:    t18 = (t0 + 6104);
    *((int *)t18) = 1;

LAB1:    return;
LAB4:    goto LAB2;

LAB5:    xsi_size_not_matching(40U, t11, 0);
    goto LAB6;

}


extern void work_a_3161315161_3212880686_init()
{
	static char *pe[] = {(void *)work_a_3161315161_3212880686_p_0,(void *)work_a_3161315161_3212880686_p_1,(void *)work_a_3161315161_3212880686_p_2,(void *)work_a_3161315161_3212880686_p_3,(void *)work_a_3161315161_3212880686_p_4,(void *)work_a_3161315161_3212880686_p_5};
	xsi_register_didat("work_a_3161315161_3212880686", "isim/tb_cordic_rot_seq_isim_beh.exe.sim/work/a_3161315161_3212880686.didat");
	xsi_register_executes(pe);
}
