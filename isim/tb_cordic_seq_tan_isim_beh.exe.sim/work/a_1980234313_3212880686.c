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
static const char *ng0 = "/home/waseemh/Xilinx_Proj/iA_cordic_6stage/norm_vector_mode.vhd";
extern char *IEEE_P_2592010699;

char *ieee_p_2592010699_sub_207919886985903570_503743352(char *, char *, char *, char *);


static void work_a_1980234313_3212880686_p_0(char *t0)
{
    char t3[16];
    char t8[16];
    char t10[16];
    char *t1;
    char *t4;
    char *t5;
    char *t6;
    char *t7;
    char *t9;
    char *t11;
    char *t12;
    int t13;
    unsigned int t14;
    unsigned int t15;
    unsigned int t16;
    unsigned char t17;
    char *t18;
    char *t19;
    char *t20;
    char *t21;
    char *t22;
    char *t23;

LAB0:    xsi_set_current_line(57, ng0);

LAB3:    t1 = (t0 + 7595);
    t4 = (t0 + 1032U);
    t5 = *((char **)t4);
    t4 = (t0 + 7240U);
    t6 = ieee_p_2592010699_sub_207919886985903570_503743352(IEEE_P_2592010699, t3, t5, t4);
    t9 = ((IEEE_P_2592010699) + 4000);
    t11 = (t10 + 0U);
    t12 = (t11 + 0U);
    *((int *)t12) = 0;
    t12 = (t11 + 4U);
    *((int *)t12) = 7;
    t12 = (t11 + 8U);
    *((int *)t12) = 1;
    t13 = (7 - 0);
    t14 = (t13 * 1);
    t14 = (t14 + 1);
    t12 = (t11 + 12U);
    *((unsigned int *)t12) = t14;
    t7 = xsi_base_array_concat(t7, t8, t9, (char)97, t1, t10, (char)97, t6, t3, (char)101);
    t12 = (t3 + 12U);
    t14 = *((unsigned int *)t12);
    t15 = (1U * t14);
    t16 = (8U + t15);
    t17 = (40U != t16);
    if (t17 == 1)
        goto LAB5;

LAB6:    t18 = (t0 + 4552);
    t19 = (t18 + 56U);
    t20 = *((char **)t19);
    t21 = (t20 + 56U);
    t22 = *((char **)t21);
    memcpy(t22, t7, 40U);
    xsi_driver_first_trans_fast(t18);

LAB2:    t23 = (t0 + 4440);
    *((int *)t23) = 1;

LAB1:    return;
LAB4:    goto LAB2;

LAB5:    xsi_size_not_matching(40U, t16, 0);
    goto LAB6;

}

static void work_a_1980234313_3212880686_p_1(char *t0)
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

LAB0:    xsi_set_current_line(58, ng0);

LAB3:    t1 = (t0 + 7603);
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
    t9 = (t0 + 7240U);
    t3 = xsi_base_array_concat(t3, t5, t6, (char)97, t1, t7, (char)97, t4, t9, (char)101);
    t11 = (8U + 32U);
    t12 = (40U != t11);
    if (t12 == 1)
        goto LAB5;

LAB6:    t13 = (t0 + 4616);
    t14 = (t13 + 56U);
    t15 = *((char **)t14);
    t16 = (t15 + 56U);
    t17 = *((char **)t16);
    memcpy(t17, t3, 40U);
    xsi_driver_first_trans_fast(t13);

LAB2:    t18 = (t0 + 4456);
    *((int *)t18) = 1;

LAB1:    return;
LAB4:    goto LAB2;

LAB5:    xsi_size_not_matching(40U, t11, 0);
    goto LAB6;

}

static void work_a_1980234313_3212880686_p_2(char *t0)
{
    char *t1;
    char *t2;
    int t3;
    unsigned int t4;
    unsigned int t5;
    unsigned int t6;
    unsigned char t7;
    unsigned char t8;
    char *t9;
    char *t10;
    char *t11;
    char *t12;
    char *t13;
    char *t14;
    char *t15;
    char *t16;
    char *t17;
    char *t18;
    char *t19;
    char *t20;
    char *t21;

LAB0:    xsi_set_current_line(59, ng0);
    t1 = (t0 + 1032U);
    t2 = *((char **)t1);
    t3 = (31 - 31);
    t4 = (t3 * -1);
    t5 = (1U * t4);
    t6 = (0 + t5);
    t1 = (t2 + t6);
    t7 = *((unsigned char *)t1);
    t8 = (t7 == (unsigned char)2);
    if (t8 != 0)
        goto LAB3;

LAB4:
LAB5:    t15 = (t0 + 1832U);
    t16 = *((char **)t15);
    t15 = (t0 + 4680);
    t17 = (t15 + 56U);
    t18 = *((char **)t17);
    t19 = (t18 + 56U);
    t20 = *((char **)t19);
    memcpy(t20, t16, 40U);
    xsi_driver_first_trans_fast_port(t15);

LAB2:    t21 = (t0 + 4472);
    *((int *)t21) = 1;

LAB1:    return;
LAB3:    t9 = (t0 + 1512U);
    t10 = *((char **)t9);
    t9 = (t0 + 4680);
    t11 = (t9 + 56U);
    t12 = *((char **)t11);
    t13 = (t12 + 56U);
    t14 = *((char **)t13);
    memcpy(t14, t10, 40U);
    xsi_driver_first_trans_fast_port(t9);
    goto LAB2;

LAB6:    goto LAB2;

}


extern void work_a_1980234313_3212880686_init()
{
	static char *pe[] = {(void *)work_a_1980234313_3212880686_p_0,(void *)work_a_1980234313_3212880686_p_1,(void *)work_a_1980234313_3212880686_p_2};
	xsi_register_didat("work_a_1980234313_3212880686", "isim/tb_cordic_seq_tan_isim_beh.exe.sim/work/a_1980234313_3212880686.didat");
	xsi_register_executes(pe);
}
