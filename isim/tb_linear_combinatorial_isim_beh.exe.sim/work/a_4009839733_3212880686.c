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
static const char *ng0 = "/home/waseemh/Xilinx_Proj/iA_cordic_6stage/norm_linear_module.vhd";
extern char *IEEE_P_2592010699;

char *ieee_p_2592010699_sub_207919886985903570_503743352(char *, char *, char *, char *);


static void work_a_4009839733_3212880686_p_0(char *t0)
{
    char t11[16];
    char t16[16];
    char t18[16];
    char t35[16];
    char t37[16];
    char *t1;
    char *t2;
    int t3;
    unsigned int t4;
    unsigned int t5;
    unsigned int t6;
    unsigned char t7;
    unsigned char t8;
    char *t9;
    char *t12;
    char *t13;
    char *t14;
    char *t15;
    char *t17;
    char *t19;
    char *t20;
    int t21;
    unsigned int t22;
    unsigned int t23;
    unsigned int t24;
    unsigned char t25;
    char *t26;
    char *t27;
    char *t28;
    char *t29;
    char *t30;
    char *t31;
    char *t33;
    char *t34;
    char *t36;
    char *t38;
    char *t39;
    int t40;
    unsigned int t41;
    unsigned char t42;
    char *t43;
    char *t44;
    char *t45;
    char *t46;
    char *t47;
    char *t48;

LAB0:    xsi_set_current_line(52, ng0);
    t1 = (t0 + 1032U);
    t2 = *((char **)t1);
    t3 = (31 - 31);
    t4 = (t3 * -1);
    t5 = (1U * t4);
    t6 = (0 + t5);
    t1 = (t2 + t6);
    t7 = *((unsigned char *)t1);
    t8 = (t7 == (unsigned char)3);
    if (t8 != 0)
        goto LAB3;

LAB4:
LAB7:    t31 = (t0 + 8243);
    t33 = (t0 + 1032U);
    t34 = *((char **)t33);
    t36 = ((IEEE_P_2592010699) + 4000);
    t38 = (t37 + 0U);
    t39 = (t38 + 0U);
    *((int *)t39) = 0;
    t39 = (t38 + 4U);
    *((int *)t39) = 7;
    t39 = (t38 + 8U);
    *((int *)t39) = 1;
    t40 = (7 - 0);
    t41 = (t40 * 1);
    t41 = (t41 + 1);
    t39 = (t38 + 12U);
    *((unsigned int *)t39) = t41;
    t39 = (t0 + 7880U);
    t33 = xsi_base_array_concat(t33, t35, t36, (char)97, t31, t37, (char)97, t34, t39, (char)101);
    t41 = (8U + 32U);
    t42 = (40U != t41);
    if (t42 == 1)
        goto LAB9;

LAB10:    t43 = (t0 + 4976);
    t44 = (t43 + 56U);
    t45 = *((char **)t44);
    t46 = (t45 + 56U);
    t47 = *((char **)t46);
    memcpy(t47, t33, 40U);
    xsi_driver_first_trans_fast(t43);

LAB2:    t48 = (t0 + 4848);
    *((int *)t48) = 1;

LAB1:    return;
LAB3:    t9 = (t0 + 8235);
    t12 = (t0 + 1032U);
    t13 = *((char **)t12);
    t12 = (t0 + 7880U);
    t14 = ieee_p_2592010699_sub_207919886985903570_503743352(IEEE_P_2592010699, t11, t13, t12);
    t17 = ((IEEE_P_2592010699) + 4000);
    t19 = (t18 + 0U);
    t20 = (t19 + 0U);
    *((int *)t20) = 0;
    t20 = (t19 + 4U);
    *((int *)t20) = 7;
    t20 = (t19 + 8U);
    *((int *)t20) = 1;
    t21 = (7 - 0);
    t22 = (t21 * 1);
    t22 = (t22 + 1);
    t20 = (t19 + 12U);
    *((unsigned int *)t20) = t22;
    t15 = xsi_base_array_concat(t15, t16, t17, (char)97, t9, t18, (char)97, t14, t11, (char)101);
    t20 = (t11 + 12U);
    t22 = *((unsigned int *)t20);
    t23 = (1U * t22);
    t24 = (8U + t23);
    t25 = (40U != t24);
    if (t25 == 1)
        goto LAB5;

LAB6:    t26 = (t0 + 4976);
    t27 = (t26 + 56U);
    t28 = *((char **)t27);
    t29 = (t28 + 56U);
    t30 = *((char **)t29);
    memcpy(t30, t15, 40U);
    xsi_driver_first_trans_fast(t26);
    goto LAB2;

LAB5:    xsi_size_not_matching(40U, t24, 0);
    goto LAB6;

LAB8:    goto LAB2;

LAB9:    xsi_size_not_matching(40U, t41, 0);
    goto LAB10;

}

static void work_a_4009839733_3212880686_p_1(char *t0)
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
    char *t11;
    char *t12;
    char *t13;
    char *t14;
    char *t15;
    char *t16;
    char *t18;
    char *t19;
    char *t20;
    char *t21;
    char *t22;
    char *t23;

LAB0:    xsi_set_current_line(54, ng0);
    t1 = (t0 + 1032U);
    t2 = *((char **)t1);
    t3 = (31 - 31);
    t4 = (t3 * -1);
    t5 = (1U * t4);
    t6 = (0 + t5);
    t1 = (t2 + t6);
    t7 = *((unsigned char *)t1);
    t8 = (t7 == (unsigned char)3);
    if (t8 != 0)
        goto LAB3;

LAB4:
LAB5:    t16 = (t0 + 8291);
    t18 = (t0 + 5040);
    t19 = (t18 + 56U);
    t20 = *((char **)t19);
    t21 = (t20 + 56U);
    t22 = *((char **)t21);
    memcpy(t22, t16, 40U);
    xsi_driver_first_trans_fast(t18);

LAB2:    t23 = (t0 + 4864);
    *((int *)t23) = 1;

LAB1:    return;
LAB3:    t9 = (t0 + 8251);
    t11 = (t0 + 5040);
    t12 = (t11 + 56U);
    t13 = *((char **)t12);
    t14 = (t13 + 56U);
    t15 = *((char **)t14);
    memcpy(t15, t9, 40U);
    xsi_driver_first_trans_fast(t11);
    goto LAB2;

LAB6:    goto LAB2;

}

static void work_a_4009839733_3212880686_p_2(char *t0)
{
    char t80[16];
    char t82[16];
    char t87[16];
    char t103[16];
    char t105[16];
    char t110[16];
    unsigned char t1;
    unsigned char t2;
    unsigned char t3;
    unsigned char t4;
    unsigned char t5;
    unsigned char t6;
    unsigned char t7;
    char *t8;
    char *t9;
    int t10;
    unsigned int t11;
    unsigned int t12;
    unsigned int t13;
    unsigned char t14;
    unsigned char t15;
    char *t16;
    char *t17;
    int t18;
    unsigned int t19;
    unsigned int t20;
    unsigned int t21;
    unsigned char t22;
    unsigned char t23;
    char *t24;
    char *t25;
    int t26;
    unsigned int t27;
    unsigned int t28;
    unsigned int t29;
    unsigned char t30;
    unsigned char t31;
    char *t32;
    char *t33;
    int t34;
    unsigned int t35;
    unsigned int t36;
    unsigned int t37;
    unsigned char t38;
    unsigned char t39;
    char *t40;
    char *t41;
    int t42;
    unsigned int t43;
    unsigned int t44;
    unsigned int t45;
    unsigned char t46;
    unsigned char t47;
    char *t48;
    char *t49;
    int t50;
    unsigned int t51;
    unsigned int t52;
    unsigned int t53;
    unsigned char t54;
    unsigned char t55;
    char *t56;
    char *t57;
    int t58;
    unsigned int t59;
    unsigned int t60;
    unsigned int t61;
    unsigned char t62;
    unsigned char t63;
    char *t64;
    char *t65;
    int t66;
    unsigned int t67;
    unsigned int t68;
    unsigned int t69;
    unsigned char t70;
    unsigned char t71;
    char *t72;
    char *t74;
    char *t75;
    unsigned int t76;
    unsigned int t77;
    unsigned int t78;
    char *t79;
    char *t81;
    char *t83;
    char *t84;
    int t85;
    unsigned int t86;
    char *t88;
    int t89;
    unsigned char t90;
    char *t91;
    char *t92;
    char *t93;
    char *t94;
    char *t95;
    char *t96;
    unsigned int t97;
    unsigned int t98;
    unsigned int t99;
    char *t100;
    char *t102;
    char *t104;
    char *t106;
    char *t107;
    int t108;
    unsigned int t109;
    char *t111;
    int t112;
    unsigned char t113;
    char *t114;
    char *t115;
    char *t116;
    char *t117;
    char *t118;

LAB0:    xsi_set_current_line(66, ng0);
    t8 = (t0 + 2152U);
    t9 = *((char **)t8);
    t10 = (23 - 39);
    t11 = (t10 * -1);
    t12 = (1U * t11);
    t13 = (0 + t12);
    t8 = (t9 + t13);
    t14 = *((unsigned char *)t8);
    t15 = (t14 == (unsigned char)3);
    if (t15 == 1)
        goto LAB23;

LAB24:    t16 = (t0 + 2152U);
    t17 = *((char **)t16);
    t18 = (22 - 39);
    t19 = (t18 * -1);
    t20 = (1U * t19);
    t21 = (0 + t20);
    t16 = (t17 + t21);
    t22 = *((unsigned char *)t16);
    t23 = (t22 == (unsigned char)3);
    t7 = t23;

LAB25:    if (t7 == 1)
        goto LAB20;

LAB21:    t24 = (t0 + 2152U);
    t25 = *((char **)t24);
    t26 = (21 - 39);
    t27 = (t26 * -1);
    t28 = (1U * t27);
    t29 = (0 + t28);
    t24 = (t25 + t29);
    t30 = *((unsigned char *)t24);
    t31 = (t30 == (unsigned char)3);
    t6 = t31;

LAB22:    if (t6 == 1)
        goto LAB17;

LAB18:    t32 = (t0 + 2152U);
    t33 = *((char **)t32);
    t34 = (20 - 39);
    t35 = (t34 * -1);
    t36 = (1U * t35);
    t37 = (0 + t36);
    t32 = (t33 + t37);
    t38 = *((unsigned char *)t32);
    t39 = (t38 == (unsigned char)3);
    t5 = t39;

LAB19:    if (t5 == 1)
        goto LAB14;

LAB15:    t40 = (t0 + 2152U);
    t41 = *((char **)t40);
    t42 = (19 - 39);
    t43 = (t42 * -1);
    t44 = (1U * t43);
    t45 = (0 + t44);
    t40 = (t41 + t45);
    t46 = *((unsigned char *)t40);
    t47 = (t46 == (unsigned char)3);
    t4 = t47;

LAB16:    if (t4 == 1)
        goto LAB11;

LAB12:    t48 = (t0 + 2152U);
    t49 = *((char **)t48);
    t50 = (18 - 39);
    t51 = (t50 * -1);
    t52 = (1U * t51);
    t53 = (0 + t52);
    t48 = (t49 + t53);
    t54 = *((unsigned char *)t48);
    t55 = (t54 == (unsigned char)3);
    t3 = t55;

LAB13:    if (t3 == 1)
        goto LAB8;

LAB9:    t56 = (t0 + 2152U);
    t57 = *((char **)t56);
    t58 = (17 - 39);
    t59 = (t58 * -1);
    t60 = (1U * t59);
    t61 = (0 + t60);
    t56 = (t57 + t61);
    t62 = *((unsigned char *)t56);
    t63 = (t62 == (unsigned char)3);
    t2 = t63;

LAB10:    if (t2 == 1)
        goto LAB5;

LAB6:    t64 = (t0 + 2152U);
    t65 = *((char **)t64);
    t66 = (16 - 39);
    t67 = (t66 * -1);
    t68 = (1U * t67);
    t69 = (0 + t68);
    t64 = (t65 + t69);
    t70 = *((unsigned char *)t64);
    t71 = (t70 == (unsigned char)3);
    t1 = t71;

LAB7:    if (t1 != 0)
        goto LAB3;

LAB4:
LAB28:    t95 = (t0 + 2152U);
    t96 = *((char **)t95);
    t97 = (39 - 31);
    t98 = (t97 * 1U);
    t99 = (0 + t98);
    t95 = (t96 + t99);
    t100 = (t0 + 8339);
    t104 = ((IEEE_P_2592010699) + 4000);
    t106 = (t105 + 0U);
    t107 = (t106 + 0U);
    *((int *)t107) = 31;
    t107 = (t106 + 4U);
    *((int *)t107) = 0;
    t107 = (t106 + 8U);
    *((int *)t107) = -1;
    t108 = (0 - 31);
    t109 = (t108 * -1);
    t109 = (t109 + 1);
    t107 = (t106 + 12U);
    *((unsigned int *)t107) = t109;
    t107 = (t110 + 0U);
    t111 = (t107 + 0U);
    *((int *)t111) = 0;
    t111 = (t107 + 4U);
    *((int *)t111) = 7;
    t111 = (t107 + 8U);
    *((int *)t111) = 1;
    t112 = (7 - 0);
    t109 = (t112 * 1);
    t109 = (t109 + 1);
    t111 = (t107 + 12U);
    *((unsigned int *)t111) = t109;
    t102 = xsi_base_array_concat(t102, t103, t104, (char)97, t95, t105, (char)97, t100, t110, (char)101);
    t109 = (32U + 8U);
    t113 = (40U != t109);
    if (t113 == 1)
        goto LAB30;

LAB31:    t111 = (t0 + 5104);
    t114 = (t111 + 56U);
    t115 = *((char **)t114);
    t116 = (t115 + 56U);
    t117 = *((char **)t116);
    memcpy(t117, t102, 40U);
    xsi_driver_first_trans_fast_port(t111);

LAB2:    t118 = (t0 + 4880);
    *((int *)t118) = 1;

LAB1:    return;
LAB3:    t72 = (t0 + 8331);
    t74 = (t0 + 2152U);
    t75 = *((char **)t74);
    t76 = (39 - 31);
    t77 = (t76 * 1U);
    t78 = (0 + t77);
    t74 = (t75 + t78);
    t81 = ((IEEE_P_2592010699) + 4000);
    t83 = (t82 + 0U);
    t84 = (t83 + 0U);
    *((int *)t84) = 0;
    t84 = (t83 + 4U);
    *((int *)t84) = 7;
    t84 = (t83 + 8U);
    *((int *)t84) = 1;
    t85 = (7 - 0);
    t86 = (t85 * 1);
    t86 = (t86 + 1);
    t84 = (t83 + 12U);
    *((unsigned int *)t84) = t86;
    t84 = (t87 + 0U);
    t88 = (t84 + 0U);
    *((int *)t88) = 31;
    t88 = (t84 + 4U);
    *((int *)t88) = 0;
    t88 = (t84 + 8U);
    *((int *)t88) = -1;
    t89 = (0 - 31);
    t86 = (t89 * -1);
    t86 = (t86 + 1);
    t88 = (t84 + 12U);
    *((unsigned int *)t88) = t86;
    t79 = xsi_base_array_concat(t79, t80, t81, (char)97, t72, t82, (char)97, t74, t87, (char)101);
    t86 = (8U + 32U);
    t90 = (40U != t86);
    if (t90 == 1)
        goto LAB26;

LAB27:    t88 = (t0 + 5104);
    t91 = (t88 + 56U);
    t92 = *((char **)t91);
    t93 = (t92 + 56U);
    t94 = *((char **)t93);
    memcpy(t94, t79, 40U);
    xsi_driver_first_trans_fast_port(t88);
    goto LAB2;

LAB5:    t1 = (unsigned char)1;
    goto LAB7;

LAB8:    t2 = (unsigned char)1;
    goto LAB10;

LAB11:    t3 = (unsigned char)1;
    goto LAB13;

LAB14:    t4 = (unsigned char)1;
    goto LAB16;

LAB17:    t5 = (unsigned char)1;
    goto LAB19;

LAB20:    t6 = (unsigned char)1;
    goto LAB22;

LAB23:    t7 = (unsigned char)1;
    goto LAB25;

LAB26:    xsi_size_not_matching(40U, t86, 0);
    goto LAB27;

LAB29:    goto LAB2;

LAB30:    xsi_size_not_matching(40U, t109, 0);
    goto LAB31;

}

static void work_a_4009839733_3212880686_p_3(char *t0)
{
    unsigned char t1;
    unsigned char t2;
    unsigned char t3;
    unsigned char t4;
    unsigned char t5;
    unsigned char t6;
    unsigned char t7;
    char *t8;
    char *t9;
    int t10;
    unsigned int t11;
    unsigned int t12;
    unsigned int t13;
    unsigned char t14;
    unsigned char t15;
    char *t16;
    char *t17;
    int t18;
    unsigned int t19;
    unsigned int t20;
    unsigned int t21;
    unsigned char t22;
    unsigned char t23;
    char *t24;
    char *t25;
    int t26;
    unsigned int t27;
    unsigned int t28;
    unsigned int t29;
    unsigned char t30;
    unsigned char t31;
    char *t32;
    char *t33;
    int t34;
    unsigned int t35;
    unsigned int t36;
    unsigned int t37;
    unsigned char t38;
    unsigned char t39;
    char *t40;
    char *t41;
    int t42;
    unsigned int t43;
    unsigned int t44;
    unsigned int t45;
    unsigned char t46;
    unsigned char t47;
    char *t48;
    char *t49;
    int t50;
    unsigned int t51;
    unsigned int t52;
    unsigned int t53;
    unsigned char t54;
    unsigned char t55;
    char *t56;
    char *t57;
    int t58;
    unsigned int t59;
    unsigned int t60;
    unsigned int t61;
    unsigned char t62;
    unsigned char t63;
    char *t64;
    char *t65;
    int t66;
    unsigned int t67;
    unsigned int t68;
    unsigned int t69;
    unsigned char t70;
    unsigned char t71;
    char *t72;
    char *t73;
    char *t74;
    char *t75;
    char *t76;
    char *t77;
    char *t78;
    char *t79;
    char *t80;
    char *t81;
    char *t82;

LAB0:    xsi_set_current_line(73, ng0);
    t8 = (t0 + 2152U);
    t9 = *((char **)t8);
    t10 = (23 - 39);
    t11 = (t10 * -1);
    t12 = (1U * t11);
    t13 = (0 + t12);
    t8 = (t9 + t13);
    t14 = *((unsigned char *)t8);
    t15 = (t14 == (unsigned char)3);
    if (t15 == 1)
        goto LAB23;

LAB24:    t16 = (t0 + 2152U);
    t17 = *((char **)t16);
    t18 = (22 - 39);
    t19 = (t18 * -1);
    t20 = (1U * t19);
    t21 = (0 + t20);
    t16 = (t17 + t21);
    t22 = *((unsigned char *)t16);
    t23 = (t22 == (unsigned char)3);
    t7 = t23;

LAB25:    if (t7 == 1)
        goto LAB20;

LAB21:    t24 = (t0 + 2152U);
    t25 = *((char **)t24);
    t26 = (21 - 39);
    t27 = (t26 * -1);
    t28 = (1U * t27);
    t29 = (0 + t28);
    t24 = (t25 + t29);
    t30 = *((unsigned char *)t24);
    t31 = (t30 == (unsigned char)3);
    t6 = t31;

LAB22:    if (t6 == 1)
        goto LAB17;

LAB18:    t32 = (t0 + 2152U);
    t33 = *((char **)t32);
    t34 = (20 - 39);
    t35 = (t34 * -1);
    t36 = (1U * t35);
    t37 = (0 + t36);
    t32 = (t33 + t37);
    t38 = *((unsigned char *)t32);
    t39 = (t38 == (unsigned char)3);
    t5 = t39;

LAB19:    if (t5 == 1)
        goto LAB14;

LAB15:    t40 = (t0 + 2152U);
    t41 = *((char **)t40);
    t42 = (19 - 39);
    t43 = (t42 * -1);
    t44 = (1U * t43);
    t45 = (0 + t44);
    t40 = (t41 + t45);
    t46 = *((unsigned char *)t40);
    t47 = (t46 == (unsigned char)3);
    t4 = t47;

LAB16:    if (t4 == 1)
        goto LAB11;

LAB12:    t48 = (t0 + 2152U);
    t49 = *((char **)t48);
    t50 = (18 - 39);
    t51 = (t50 * -1);
    t52 = (1U * t51);
    t53 = (0 + t52);
    t48 = (t49 + t53);
    t54 = *((unsigned char *)t48);
    t55 = (t54 == (unsigned char)3);
    t3 = t55;

LAB13:    if (t3 == 1)
        goto LAB8;

LAB9:    t56 = (t0 + 2152U);
    t57 = *((char **)t56);
    t58 = (17 - 39);
    t59 = (t58 * -1);
    t60 = (1U * t59);
    t61 = (0 + t60);
    t56 = (t57 + t61);
    t62 = *((unsigned char *)t56);
    t63 = (t62 == (unsigned char)3);
    t2 = t63;

LAB10:    if (t2 == 1)
        goto LAB5;

LAB6:    t64 = (t0 + 2152U);
    t65 = *((char **)t64);
    t66 = (16 - 39);
    t67 = (t66 * -1);
    t68 = (1U * t67);
    t69 = (0 + t68);
    t64 = (t65 + t69);
    t70 = *((unsigned char *)t64);
    t71 = (t70 == (unsigned char)3);
    t1 = t71;

LAB7:    if (t1 != 0)
        goto LAB3;

LAB4:
LAB26:    t77 = (t0 + 5168);
    t78 = (t77 + 56U);
    t79 = *((char **)t78);
    t80 = (t79 + 56U);
    t81 = *((char **)t80);
    *((unsigned char *)t81) = (unsigned char)2;
    xsi_driver_first_trans_fast_port(t77);

LAB2:    t82 = (t0 + 4896);
    *((int *)t82) = 1;

LAB1:    return;
LAB3:    t72 = (t0 + 5168);
    t73 = (t72 + 56U);
    t74 = *((char **)t73);
    t75 = (t74 + 56U);
    t76 = *((char **)t75);
    *((unsigned char *)t76) = (unsigned char)3;
    xsi_driver_first_trans_fast_port(t72);
    goto LAB2;

LAB5:    t1 = (unsigned char)1;
    goto LAB7;

LAB8:    t2 = (unsigned char)1;
    goto LAB10;

LAB11:    t3 = (unsigned char)1;
    goto LAB13;

LAB14:    t4 = (unsigned char)1;
    goto LAB16;

LAB17:    t5 = (unsigned char)1;
    goto LAB19;

LAB20:    t6 = (unsigned char)1;
    goto LAB22;

LAB23:    t7 = (unsigned char)1;
    goto LAB25;

LAB27:    goto LAB2;

}


extern void work_a_4009839733_3212880686_init()
{
	static char *pe[] = {(void *)work_a_4009839733_3212880686_p_0,(void *)work_a_4009839733_3212880686_p_1,(void *)work_a_4009839733_3212880686_p_2,(void *)work_a_4009839733_3212880686_p_3};
	xsi_register_didat("work_a_4009839733_3212880686", "isim/tb_linear_combinatorial_isim_beh.exe.sim/work/a_4009839733_3212880686.didat");
	xsi_register_executes(pe);
}
